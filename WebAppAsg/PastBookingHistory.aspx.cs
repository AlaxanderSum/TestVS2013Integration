using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectTaxiMgmt
{
    public partial class PastBookingHistory : System.Web.UI.Page
    {

        string strSearchQuery = "";

        //used for recognizing parameters to add
        Boolean bRsvID = false;
        Boolean bRsvDate = false;
        Boolean bOrigin = false;
        Boolean bDest = false;
        Boolean bVhType = false;
        Boolean bVhPlateNo = false;
        Boolean bDateRange = false;
        Boolean bRsvStatus = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                resetControls();
            }
            

        }

        protected void resetControls()
        {
            //disable all controls
            chkRsvID.Checked = false;
            chkRsvDate.Checked = false;
            chkOrigin.Checked = false;
            chkDest.Checked = false;
            chkVhType.Checked = false;
            chkVhPlateNo.Checked = false;
            chkDateRange.Checked = false;
            chkRsvStatus.Checked = false;

            //disable all input controls
            txtRsvID.Enabled = false;
            calRsvDate.Enabled = false;
            txtOrigin.Enabled = false;
            txtDest.Enabled = false;
            ddlVhType.Enabled = false;
            txtPlateNo.Enabled = false;
            calDateRangeFrom.Enabled = false;
            calDateRangeTo.Enabled = false;
            ddlRsvStatus.Enabled = false;

            this.bRsvID = false;
            this.bRsvDate = false;
            this.bOrigin = false;
            this.bDest = false;
            this.bVhType = false;
            this.bVhPlateNo = false;
            this.bDateRange = false;
            this.bRsvStatus = false;

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //for fail safe purpose
            this.strSearchQuery = "";

            //assign prefix
            this.strSearchQuery = "Select rsv.ReservationID, ReservationTime, Origin, Destination, TotalCharges, ReservationStatus" +
                " from reservation rsv, " +
                "route r, pickup pk,  customer c, taxi t, driver d" +
                " where rsv.customerid = c.customerid and " +
                "rsv.routeid = r.routeid and r.routeid = pk.routeid and t.taxiplateno = rsv.taxiplateno and t.driverid = d.driverid" +
                " and (@reservationID IS NULL or rsv.reservationID = @reservationID)" +
                " and (@RsvDate is null or (cast(ReservationTime as Date) = cast(@RsvDate as Date)))" +
                " and (@Origin is null or origin = @Origin)" +
                " and (@Destination is null or Destination = @Destination)" +
                " and (@VehicleType is null or VehicleType = @VehicleType)" +
                " and (@PlateNo is null or t.TaxiPlateNo = @PlateNo)" +
                " and (@RsvStatus is null or rsv.ReservationStatus = @RsvStatus)";
                //" and rsv.ReservationTime between (@DateStart is null or @DateStart) and (@DateEnd is null or @DateEnd)";
            

            //after that

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;
            SqlCommand sqlCommander;
            conn = new SqlConnection(strCon);
            conn.Open();

            sqlCommander = new SqlCommand(this.strSearchQuery, conn);

            //check one by one

            //WARNING the date range must be checked first in order to determine whether the dateRange part of the 
            //sql query will be added, before assigning other parameters, otherwise any parameters assigned before,
            //the append of dateRange query will be lost because a new sqlcommand need to be created with the change 
            //of SQL query.
            if (chkDateRange.Checked)
            {
                string strDateRange = " and reservationtime between @DateStart and @DateEnd";
                bDateRange = true;

                DateTime dateStart = calDateRangeFrom.SelectedDate;
                DateTime dateEnd = calDateRangeTo.SelectedDate;

                string strDateStart = String.Format("{0:dd MM yyyy}", dateStart);
                string strDateEnd = String.Format("{0:dd MM yyyy}", dateEnd);

                DateTime dateStartSub = DateTime.ParseExact(strDateStart + " 00 00 00", "dd MM yyyy HH mm ss", CultureInfo.InvariantCulture);
                DateTime dateEndSub = DateTime.ParseExact(strDateEnd + " 23 59 59", "dd MM yyyy HH mm ss", CultureInfo.InvariantCulture);


                //now pass in

                sqlCommander = new SqlCommand(this.strSearchQuery + strDateRange, conn);
                sqlCommander.Parameters.AddWithValue("@DateStart", dateStartSub);
                sqlCommander.Parameters.AddWithValue("@DateEnd", dateEndSub);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@DateStart", null);
                //sqlCommander.Parameters.AddWithValue("@DateEnd", null);
                sqlCommander.Parameters.Add("@DateStart", SqlDbType.DateTime).Value = DBNull.Value;
                sqlCommander.Parameters.Add("@DateEnd", SqlDbType.DateTime).Value = DBNull.Value;
            }

            //////////////////////////////////////////////////////////////////////////////////
            if (chkRsvID.Checked)
            {
                bRsvID = true;
                sqlCommander.Parameters.AddWithValue("@reservationID", txtRsvID.Text);


            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@reservationID", null);
                sqlCommander.Parameters.Add("@reservationID", SqlDbType.VarChar).Value = DBNull.Value;
            }

            if (chkRsvDate.Checked)
            {
                bRsvDate = true;
                sqlCommander.Parameters.AddWithValue("@RsvDate", calRsvDate.SelectedDate);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@RsvDate", null);
                sqlCommander.Parameters.Add("@RsvDate", SqlDbType.DateTime).Value = DBNull.Value;
            }

            if (chkOrigin.Checked)
            {
                bOrigin = true;
                sqlCommander.Parameters.AddWithValue("@Origin", txtOrigin.Text);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@Origin", null);
                sqlCommander.Parameters.Add("@Origin", SqlDbType.VarChar).Value = DBNull.Value;
            }

            if (chkDest.Checked)
            {
                bDest = true;
                sqlCommander.Parameters.AddWithValue("@Destination", txtDest.Text);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@Destination", null);
                sqlCommander.Parameters.Add("@Destination", SqlDbType.VarChar).Value = DBNull.Value;
            }

            if (chkVhType.Checked)
            {
                bVhType = true;
                sqlCommander.Parameters.AddWithValue("@VehicleType", ddlVhType.SelectedItem.Value);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@VehicleType", null);
                sqlCommander.Parameters.Add("@VehicleType", SqlDbType.VarChar).Value = DBNull.Value;
            }

            if (chkVhPlateNo.Checked)
            {
                bVhPlateNo = true;
                sqlCommander.Parameters.AddWithValue("@PlateNo", txtPlateNo.Text);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@PlateNo", null);
                sqlCommander.Parameters.Add("@PlateNo", SqlDbType.VarChar).Value = DBNull.Value;
            }

            if (chkRsvStatus.Checked)
            {
                bRsvStatus = true;
                sqlCommander.Parameters.AddWithValue("@RsvStatus", ddlRsvStatus.SelectedItem.Value);
            }
            else
            {
                //sqlCommander.Parameters.AddWithValue("@RsvStatus", null);
                sqlCommander.Parameters.Add("@RsvStatus", SqlDbType.VarChar).Value = DBNull.Value;
            }


            //after assigning all the parameters
            SqlDataReader dtrResult;

            dtrResult = sqlCommander.ExecuteReader();

            if (dtrResult.HasRows)
            {
                //while (dtrResult.Read())
                //{

                //}

                //detach previous SqlDataSource
                gvResult.DataSourceID = "";

                //bind to grid view
                gvResult.DataSource = dtrResult;
                gvResult.DataBind();
            }
            else
            {
                gvResult.DataSourceID = "";
                gvResult.DataSource = "";
                gvResult.DataBind();
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            resetControls();
            this.strSearchQuery = "";
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            gvResult.DataSource = null;
            gvResult.DataSourceID = "SqlDataSource1";
            gvResult.DataBind();
        }

        protected void chkRsvID_CheckedChanged(object sender, EventArgs e)
        {
            if (chkRsvID.Checked)
            {
                txtRsvID.Enabled = true;
            }
            else
            {
                txtRsvID.Enabled = false;
            }
        }

        protected void chkRsvDate_CheckedChanged(object sender, EventArgs e)
        {
            if (chkRsvDate.Checked)
            {
                calRsvDate.Enabled = true;
            }
            else
            {
                calRsvDate.Enabled = false;
            }
        }

        protected void chkOrigin_CheckedChanged(object sender, EventArgs e)
        {
            if (chkOrigin.Checked)
            {
                txtOrigin.Enabled = true;
                txtOrigin.Focus();
            }
            else
            {
                txtOrigin.Enabled = false;
            }

        }

        protected void chkDest_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDest.Checked)
            {
                txtDest.Enabled = true;
                txtDest.Focus();
            }
            else
            {
                txtDest.Enabled = false;
            }
        }

        protected void chkVhType_CheckedChanged(object sender, EventArgs e)
        {
            if (chkVhType.Checked)
            {
                ddlVhType.Enabled = true;
            }
            else
            {
                ddlVhType.Enabled = false;
            }
        }

        protected void chkVhPlateNo_CheckedChanged(object sender, EventArgs e)
        {
            if (chkVhPlateNo.Checked)
            {
                txtPlateNo.Enabled = true;
                txtPlateNo.Focus();
            }
            else
            {
                txtPlateNo.Enabled = false;
            }
        }

        protected void chkDateRange_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDateRange.Checked)
            {
                calDateRangeFrom.Enabled = true;
                calDateRangeTo.Enabled = true;
            }
            else
            {
                calDateRangeFrom.Enabled = false;
                calDateRangeTo.Enabled = false;
            }
        }

        protected void chkRsvStatus_CheckedChanged(object sender, EventArgs e)
        {
            if (chkRsvStatus.Checked)
            {
                ddlRsvStatus.Enabled = true;
            }
            else
            {
                ddlRsvStatus.Enabled = false;
            }
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