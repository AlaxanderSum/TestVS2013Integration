using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppAsg;

namespace ProjectTaxiMgmt
{
    public partial class MakeReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testing error page
            //string test = Session["test"].ToString();
      //      throw new InvalidOperationException("An InvalidOperationException " +
      //"occurred in the Page_Load handler on the Default.aspx page.");


            // SWEEPING OPERATION//////////////////////////////////////////////////////////////////////////////////////////////////
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;
            SqlCommand sqlCommander;
            conn = new SqlConnection(strCon);
            conn.Open();
            string strSelectUnpaidRsv = "Select rsv.reservationID, r.routeID, pk.PickUpID from reservation rsv, route r, Pickup pk "+
                "where rsv.routeID = r.routeID and r.routeID = pk.routeID and rsv.reservationstatus = 'Incomplete'";
            sqlCommander = new SqlCommand(strSelectUnpaidRsv, conn);
            SqlDataReader dtrRsv;
            dtrRsv = sqlCommander.ExecuteReader();


            //List<String> unpaidRouteIDList = new List<string>();
            List<String> unpaidPickUpIDList = new List<string>();

            if (dtrRsv.HasRows)
            {
                while (dtrRsv.Read())
                {
                    unpaidPickUpIDList.Add(dtrRsv["PickUpID"].ToString());
                }
            }

            dtrRsv.Close();

            //setting affected pickups status to "Cancelled"
            string strAmmendPickUp = "Update PickUp Set Status = 'Cancelled' where PickUpID = @PickUpID";
            sqlCommander = new SqlCommand(strAmmendPickUp, conn);
            int result = -1; // this result is unused

            for (int i = 0; i < unpaidPickUpIDList.Count; i++)
            {
                sqlCommander.Parameters.AddWithValue("@PickUpID", unpaidPickUpIDList[i]);
                result = sqlCommander.ExecuteNonQuery();

                sqlCommander.Dispose(); // WATCH THIS OUT!!
                sqlCommander = new SqlCommand(strAmmendPickUp, conn);
            }

            //////////Scanning for orphaned routeID//////////////////////////////////////
            string strSelectOrphanRouteID = "select r.routeid from Route r where not exists(select 1 from reservation rsv where rsv.RouteID = r.RouteID) and not exists(select 1 from FavouriteLocation fav where fav.RouteID = r.RouteID) ";
            sqlCommander = new SqlCommand(strSelectOrphanRouteID ,conn);
            SqlDataReader dtrOrphanRoute;
            dtrOrphanRoute = sqlCommander.ExecuteReader();
            List<String> listOrphanRouteID = new List<string>();

            if (dtrOrphanRoute.HasRows)
            {
                while (dtrOrphanRoute.Read())
                {
                    listOrphanRouteID.Add(dtrOrphanRoute["RouteID"].ToString());
                }
            }

            dtrOrphanRoute.Close();
            ///////////////////////////////////////////////////////////////////////////////////////
            ////////////Delete Orphaned RouteID////////////////////////////////////////////////
            string strDeleteOrphanRouteID = "Delete From Route where routeid = @RouteIDDel";
            sqlCommander = new SqlCommand(strDeleteOrphanRouteID, conn);
            int delResult = -1;

            for (int j = 0; j < listOrphanRouteID.Count; j++)
            {
                sqlCommander.Parameters.AddWithValue("@RouteIDDel", listOrphanRouteID[j]);
                delResult = sqlCommander.ExecuteNonQuery();

                sqlCommander.Dispose(); // WATCH THIS OUT!! //Pls test //tested fine, even without this statement
                sqlCommander = new SqlCommand(strDeleteOrphanRouteID, conn);
            }

            ///////////////////////////////////////////////////////////////////////////////////

            conn.Close();
            ///////////////////////SWEEPING OPERATION ENDS////////////////////////////////////////

            //If the customer is being redirected here from ShowFavouriteLocation page
            string routeidFav = "";
            string originFav = "";
            string destFav = "";

            if (Request.QueryString["routeid"] != null)   
            {
                //reopen connection
                conn.Open();

                SqlCommand sqlCommRoute;

                routeidFav = Request.QueryString["routeid"];
                SqlDataReader dtrRoute;

                string strFetchExRoute = "Select routeid, origin, destination from route where routeid = @routeid";
                sqlCommRoute = new SqlCommand(strFetchExRoute, conn);
                sqlCommRoute.Parameters.AddWithValue("@routeid", routeidFav);
                dtrRoute = sqlCommRoute.ExecuteReader();

                if (dtrRoute.HasRows)
                {
                    while (dtrRoute.Read())
                    {
                        originFav = dtrRoute["Origin"].ToString();
                        destFav = dtrRoute["Destination"].ToString();
                    }
                }

                //after read data from db
                txtPckAdd.Text = originFav;
                txtDest.Text = destFav;

                //disable textboxes
                txtPckAdd.Enabled = false;
                txtDest.Enabled = false;

                conn.Close();
            }
            else
            {
                // customer is not being redirected here, but come here intentionally
            }


            if (!IsPostBack)
            {
                lblMsg.Text = "";

                //set to today's date
                calPickupDate.SelectedDate = DateTime.Today;
            }

            
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchPickupAddress(string prefixText, int count)
        {

            //System.Diagnostics.Debug.WriteLine(prefixText);

            //HttpResponse.Write("");

            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["WebDBConString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct destination, origin from route rou, customer c, reservation rsv where rou.routeid = rsv.routeid and rsv.customerid = c.customerid and " +
                    "origin like @origin + '%'" + " OR destination like @destination + '%'";
                    cmd.Parameters.AddWithValue("@origin", prefixText);
                    cmd.Parameters.AddWithValue("@destination", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> addresses = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            // all origins and destinations are provided as suggestions because
                            // customer might want to travel from a previous destination to previous origin this time 
                            addresses.Add(sdr["Origin"].ToString());
                            addresses.Add(sdr["destination"].ToString());
                        }
                        sdr.Close();
                    }

                    

                    conn.Close();
                    
                    return addresses;
                }

            }
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime currentTime = DateTime.Now;
            DateTime inputtedDate = DateTime.Now; //initial value assigned
            DateTime inputtedTime = DateTime.Now; //initial value assigned
            DateTime inputtedDateTimeCombi = DateTime.Now; //initial value assigned

            ///////////////////////////////////////////////////
            inputtedDate = calPickupDate.SelectedDate;

            string inputtedDateStr = "";
            inputtedDateStr = String.Format("{0:dd MM yyyy}", inputtedDate);
            /////////////////////////////////////////////////////////////////

            //////////////////////////////////////////////////////////////////////////////////////////
            inputtedTime = DateTime.Parse(string.Format("{0}:{1}:{2} {3}", timeSelPckTime.Hour, timeSelPckTime.Minute, timeSelPckTime.Second, timeSelPckTime.AmPm));

            string inputtedTimeStr = String.Format("{0:HH mm ss}", inputtedTime);
            /////////////////////////////////////////////////////////////////////////////////////////

            //append both inputDate and inputTime together
            string inputCombi = inputtedDateStr + " " + inputtedTimeStr;

            DateTime inputCombiDT = DateTime.ParseExact(inputCombi, "dd MM yyyy HH mm ss" , CultureInfo.InvariantCulture);
            //////////////////////////////////////////////////////////////////////////////////////////

            //string strDateIn = inputtedDate.ToShortDateString(); // dd/MM/yyyy

            //string strTimeIn = inputtedTime.ToShortTimeString();

            //inputtedDateTimeCombi = DateTime.ParseExact()

            
            //inputtedDateTimeCombi = DateTime.Parse(string.Format("{0}:{1}:{2} {3}", timeSelPckTime.Hour, timeSelPckTime.Minute, timeSelPckTime.Second, timeSelPckTime.AmPm));

            
            //inputtedDateTimeCombi = new DateTime(inputtedDate.Year,inputtedDate.Month,inputtedDate.Year,)

            //string dateFormat = "dd/MM/yyyy hh:mm:ss tt";

            DateTime thresholdTime;
            thresholdTime = currentTime.AddHours(2);

            //before check test value
            //Console.WriteLine("thresholdTime is: " + thresholdTime.ToString());
            //Console.WriteLine("inputtedCombi is " + inputCombiDT.ToString());

            //Response.Write("thresholdTime is: " + thresholdTime.ToString()+"<br />");
            //Response.Write("inputtedCombi is " + inputCombiDT.ToString());

            //test
            //txtPckAdd.Text = "thresholdTime is: " + thresholdTime.ToString() + "<br />" + "inputtedCombiDT is " + inputCombiDT.ToString();

            //its time to check
            int cmpResult;
            cmpResult = DateTime.Compare(inputCombiDT,thresholdTime);

            //Assume all estimated duration is 60 minutes
            int estDuration = 60;

            if (cmpResult > 0)
            {
                // the reservation is made at least 2 hours in advance, means valid
                // proceed to select taxi page

                Session["NewPickupTime"] = inputCombiDT;
                Session["NewEstArrTime"] = inputCombiDT.AddMinutes(60);
                Session["NewEstDuration"] = estDuration;
                Session["Origin"] = txtPckAdd.Text;
                Session["Destination"] = txtDest.Text;



                //WARNING! This is for temporary basis only, please use a real
                Session["CustomerID"] = "CT001";
                //////////////////////////////////////////////////////////////

                ////if (Request.QueryString["routeid"] != null && Request.QueryString["routeid"] != "")
                //if (!txtPckAdd.Enabled && !txtDest.Enabled) //which means reset button has not been pressed to unlock the textbox, integrity of the data in the textboxes remained
                //{
                //    Response.Redirect("ShowAvailableTaxi.aspx?routeid=" + Request.QueryString["routeid"]);
                //}
                //else
                //{
                    Response.Redirect("ShowAvailableTaxi.aspx");
                //}

                
            }
            else
            {
                // invalid
                lblMsg.Text = "Sorry, the reservation must be made at least 2 hours in advance of the Pickup time.";
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtDest.Text = "";
            txtPckAdd.Text = "";
            calPickupDate.SelectedDate = DateTime.Today;
            timeSelPckTime.Hour = 12;
            timeSelPckTime.Minute = 12;
            timeSelPckTime.Second = 12;

            //unlocks textboxes
            //txtPckAdd.Enabled = true;
            //txtDest.Enabled = true;

            //null the query string
            //if (Request.QueryString["routeid"] != null)
            //{
            //    Request.QueryString["routeid"] = "";
            //}
            //else
            //{

            //}
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