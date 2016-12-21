using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectTaxiMgmt
{
    public partial class ShowAvailableTaxi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //hide it 
            //noTaxiMsg.Visible = false;
            //noTaxiMsg.Style.Add("display", "none");

            btnProceed.Enabled = false;

            lblDateRetrieved.Text = DateTime.Now.ToShortDateString();
            lblTimeRetrieved.Text = DateTime.Now.ToShortTimeString();

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "select count(t.taxiPlateNo) from taxi t, driver d "+
            "where t.DriverID = d.DriverID and t.TaxiPlateNo in (select taxiPlateNo from taxi where TaxiPlateNo not in (select distinct taxiPlateNo from reservation where ReservationID in (select rsv.reservationid from reservation rsv, route r where rsv.RouteID = r.RouteID and rsv.RouteID in "+
            "(select pickupid from (select * from PickUp pk where pk.Status = 'Incomplete') as \"IncompletePickUpList\" where @NewPickupTime between PickUpTime and DateAdd(minute,15,EstimatedArrivalTime) "+
            "or @NewEstArrTime between PickUpTime and DateAdd(minute,15,EstimatedArrivalTime)))))";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            ///check here whether need explicit casting // temporarily disabled for running test code below //enable for normal operation
            cmdSelect.Parameters.AddWithValue("@NewPickupTime", Session["NewPickupTime"]);
            cmdSelect.Parameters.AddWithValue("@NewEstArrTime", Session["NewEstArrTime"]);
            //cmdSelect.Parameters.AddWithValue("@NewEstDuration", Session["NewEstDuration"]);

            /////////////////////////////////////////////////////////////////////////////////

            //test ///WARNING //disable these after testing
            //DateTime newPickupTime = DateTime.ParseExact("12 08 2016 10 30 00", "dd MM yyyy HH mm ss", CultureInfo.InvariantCulture);
            //DateTime newEstArrTime = DateTime.ParseExact("12 08 2016 11 00 00", "dd MM yyyy HH mm ss", CultureInfo.InvariantCulture);
            //int newEstDuration = 30; //30 minutes

            //cmdSelect.Parameters.AddWithValue("@NewPickupTime", newPickupTime);
            //cmdSelect.Parameters.AddWithValue("@NewEstArrTime", newEstArrTime);
            //cmdSelect.Parameters.AddWithValue("@NewEstDuration", newEstDuration);
            //////////////////////////////////////////////////

            int count = (int)cmdSelect.ExecuteScalar();

            lblNoOfTaxis.Text = count.ToString() + " ";

            if (count == 0)
            {
                //noTaxiMsg.Visible = true;
                //noTaxiMsg.Style.Remove("display");
                noTaxiMsg.Style.Clear();
            }

            // to prevent user from clicking proceed before selecting another option in the gridview, not triggering the indexchanged
            //gvAvailableTaxi.SelectedIndex = 0;
            //Session["SelTaxiPlateNo"] = gvAvailableTaxi.SelectedRow.Cells[0].Text;

            //close connection
            con.Close();
        }

        protected void gvAvailableTaxi_SelectedIndexChanged(object sender, EventArgs e)
        {
            //force user to select an option in order to enable the proceed button
            btnProceed.Enabled = true;

            Session["SelTaxiPlateNo"] = gvAvailableTaxi.SelectedValue.ToString();

            //test
            //lblNoOfTaxis.Text = gvAvailableTaxi.SelectedValue.ToString();
            //lblTest.Text = gvAvailableTaxi.SelectedValue.ToString();
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            //// to prevent user from clicking proceed before selecting another option in the gridview, not triggering the indexchanged
            //gvAvailableTaxi.SelectedIndex = 0;
            //Session["SelTaxiPlateNo"] = gvAvailableTaxi.SelectedRow.Cells[0].Text;

            //if (Request.QueryString["routeid"] != null)
            //{
            //    Response.Redirect("ReservationSummary.aspx?routeid=" + Request.QueryString["routeid"]);
            //}
            //else
            //{
                Response.Redirect("ReservationSummary.aspx");
            //}
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MakeReservation.aspx");
        }

        protected void refreshTimer_Tick(object sender, EventArgs e)
        {
            gvAvailableTaxi.DataBind();
        }

        public void Page_Error(object sender, EventArgs e)
        {
            //Exception objErr = Server.GetLastError().GetBaseException();
            //string err = "<b>Error Caught in Page_Error event</b><hr><br>" +
            //        "<br><b>Error in: </b>" + Request.Url.ToString() +
            //        "<br><b>Error Message: </b>" + objErr.Message.ToString() +
            //        "<br><b>Stack Trace:</b><br>" +
            //                  objErr.StackTrace.ToString();
            //Response.Write(err.ToString());
            //this.ErrorPage = "~/ReserveOops.aspx";
            Server.ClearError();
            //this.ErrorPage = "~/ReserveOops.aspx";
            Response.Redirect("ReserveOops.aspx");
        }

    }
}