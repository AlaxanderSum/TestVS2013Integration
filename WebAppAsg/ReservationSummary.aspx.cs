using Assignment;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectTaxiMgmt
{
    public partial class ReservationSummary : System.Web.UI.Page
    {
        //shared variable
        string newRsvID = "";
        string newRouteID = "";
        //decimal totalCharges = 0.00M;
        //double douTotalCharges = 0.00;
        double totalCharges = 0.00;

        protected void Page_Load(object sender, EventArgs e)
        {

            //record current date and time for ReservationTime
            Session["ReservationTime"] = DateTime.Now;

            //get values
            DateTime reservationTime = (DateTime)Session["ReservationTime"];
            DateTime pickUpTime = (DateTime)Session["NewPickupTime"];
            DateTime estArrTime = (DateTime)Session["NewEstArrTime"];

           
            // populate labels
            lblRsvDate.Text = reservationTime.ToShortDateString();
            lblRsvTime.Text = reservationTime.ToShortTimeString();
            lblPckDate.Text = pickUpTime.ToShortDateString();
            lblPckTime.Text = pickUpTime.ToShortTimeString();
            lblPckAddress.Text = Session["Origin"].ToString();
            lblPckDest.Text = Session["Destination"].ToString();
            lblEstArrTime.Text = estArrTime.ToString();// Pls check output length suitability

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;
            SqlCommand sqlCommander;
            conn = new SqlConnection(strCon);
            conn.Open();
            string strSelectTaxi = "Select t.TaxiPlateNo, VehicleType, Fare, VehicleManufacturer, VehicleModel, VehicleColour, t.DriverID, d.Name from Taxi t, Driver d where t.driverID = d.driverID and t.TaxiPlateNo = @TaxiPlateNo";
            sqlCommander = new SqlCommand(strSelectTaxi, conn);
            sqlCommander.Parameters.AddWithValue("@TaxiPlateNo", Session["SelTaxiPlateNo"].ToString());
            SqlDataReader dtrTaxi;
            dtrTaxi = sqlCommander.ExecuteReader();

            string vhMake = "";
            string vhModel = "";
            string vhType = "";
            string vhColour = "";
            string vhPlateNo = "";
            string vhFare = "";
            string drvID = "";
            string drvName = "";

            decimal fareDc = 0.00M;

            if(dtrTaxi.HasRows){
                while(dtrTaxi.Read()){
                    vhMake = dtrTaxi["VehicleManufacturer"].ToString();
                    vhModel = dtrTaxi["VehicleModel"].ToString();
                    vhType = dtrTaxi["VehicleType"].ToString();
                    vhColour = dtrTaxi["VehicleColour"].ToString();
                    vhPlateNo = dtrTaxi["TaxiPlateNo"].ToString();
                    vhFare = dtrTaxi["Fare"].ToString();
                    fareDc = (decimal)dtrTaxi["Fare"];
                    drvID = dtrTaxi["DriverID"].ToString();
                    drvName = dtrTaxi["Name"].ToString();
                }
            }

            dtrTaxi.Close();

            // Reservation part for display purpose and generated ID will be stored
            // as class variable and will be used to create a new Reservation record below
            ////////////////////////////////////////////////////////////////////////////////////////////////
            string strSelectCurRsvID = "Select ReservationID from Reservation order by ReservationID desc";
            sqlCommander = new SqlCommand(strSelectCurRsvID, conn);
            //string currentRsvID = sqlCommander.ExecuteScalar().ToString();
            string currentRsvID = "";
            SqlDataReader dtrReservation;
            dtrReservation = sqlCommander.ExecuteReader();

            if (dtrReservation.HasRows)
            { //current record(s) exists in the table

                //manually advance pointer by one step
                dtrReservation.Read();
                currentRsvID = dtrReservation["ReservationID"].ToString();

                //processing new Reservation ID
                string rsvIDCurNumeric = currentRsvID.Substring(2, 7);

                int newRsvIDNumeric = Int32.Parse(rsvIDCurNumeric) + 1;
                string newRsvIDNumericStr = newRsvIDNumeric.ToString();

                while (newRsvIDNumericStr.Length != 7)
                {
                    newRsvIDNumericStr = "0" + newRsvIDNumericStr;
                }

                

                this.newRsvID = "RS" + newRsvIDNumericStr;
            }
            else //completely empty Reservation table
            {
                this.newRsvID = "RS0000001";
            }

            dtrReservation.Close();
            /////////////////////////////////////////////////////////////////////



            //try process decimal value
            fareDc = Math.Round(fareDc, 2); // OK


            //if (!IsPostBack)
            //{
            //    //generate new routeID
            //    //////////////////////////////////////////////////////////////////////////////////
            //    string strSelectCurRouteID = "Select RouteID from Route order by RouteID desc";
            //    sqlCommander = new SqlCommand(strSelectCurRouteID, conn);
            //    //string currentRouteID = sqlCommander.ExecuteScalar().ToString();
            //    string currentRouteID = "";
            //    SqlDataReader dtrRoute;
            //    dtrRoute = sqlCommander.ExecuteReader();

            //    if (dtrRoute.HasRows)
            //    {

            //        dtrRoute.Read();
            //        currentRouteID = dtrRoute["RouteID"].ToString();

            //        //processing new Route ID
            //        string routeCurNumeric = currentRouteID.Substring(1, 7);

            //        int newRouteNumeric = Int32.Parse(routeCurNumeric) + 1;
            //        string newRouteNumericStr = newRouteNumeric.ToString();

            //        while (newRouteNumericStr.Length != 7)
            //        {
            //            newRouteNumericStr = "0" + newRouteNumericStr;
            //        }

            //        this.newRouteID = "R" + newRouteNumericStr;


            //    }
            //    else //empty table
            //    {
            //        this.newRouteID = "R0000001";
            //    }
            //    dtrRoute.Close();
            //    ////////////////////////////////////////////////////////////////////////

            //    //Now, Create new route record
            //    string strCreateRoute = "Insert Into Route (RouteID, Origin, Destination, TotalDistance, RouteName) Values(@RouteID, @Origin, @Destination, @TotalDistance, @RouteName)";

            //    sqlCommander = new SqlCommand(strCreateRoute, conn);
            //    sqlCommander.Parameters.AddWithValue("@RouteID", this.newRouteID);
            //    sqlCommander.Parameters.AddWithValue("@Origin", Session["Origin"]);
            //    sqlCommander.Parameters.AddWithValue("@Destination", Session["Destination"]);
            //    sqlCommander.Parameters.AddWithValue("@TotalDistance", 10.0); // assuming always 10.0 KM
            //    sqlCommander.Parameters.AddWithValue("@RouteName", ""); //only used in adding favourite location manually

            //    int createResult = -1;

            //    createResult = sqlCommander.ExecuteNonQuery();
            //}
            /////////////////////////////////////////////////////////////////////////
            
            //calculate total charges
            //TotalDistance * Fare

            //double douTotalCharges = 0.0;
            

            //SqlDataReader dtrCalc;

            //string strCalculateCharges = "Select (r.TotalDistance * t.Fare) as \"totalCharges\" from route r, taxi t where routeid = @RouteIDCalc and taxiplateno = @TaxiPlateNoCalc";
            //sqlCommander = new SqlCommand(strCalculateCharges, conn);
            //sqlCommander.Parameters.AddWithValue("@RouteIDCalc", this.newRouteID);
            //sqlCommander.Parameters.AddWithValue("@TaxiPlateNoCalc", Session["SelTaxiPlateNo"]);
            //dtrCalc = sqlCommander.ExecuteReader();
            ////this.douTotalCharges = (double)sqlCommander.ExecuteScalar(); //WATCH THIS OUT

            ////douTotalCharges = Math.Round(douTotalCharges*1.00, 2);

            //if (dtrCalc.HasRows)
            //{
            //    while (dtrCalc.Read())
            //    {
            //        //douTotalCharges = (double)dtrCalc["totalCharges"];
            //        totalCharges = (double)dtrCalc["totalCharges"];
            //    }
            //}

            //this.totalCharges = Decimal.Parse(douTotalCharges.ToString());
            //this.totalCharges = Math.Round(this.totalCharges, 2, MidpointRounding.AwayFromZero);

            //Vehicle
            lblVhMake.Text = vhMake;
            lblVhModel.Text = vhModel;
            lblVhType.Text = vhType;
            lblvhColour.Text = vhColour;
            lblVhPlateNo.Text = vhPlateNo;
            //lblFare.Text = vhFare;
            lblFare.Text = fareDc.ToString();
            lblDrvID.Text = drvID;
            lblDrvName.Text = drvName;
            lblRsvID.Text = this.newRsvID;

            //testting by injecting values WARNING TEST ONLY
           // this.totalCharges = 123.4569;
            ///////////////////////////////////////////////

            //lblTotalCharges.Text = String.Format("{0:0.00}", this.totalCharges);

            conn.Close();
            

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;

            SqlCommand sqlCommander;

            conn = new SqlConnection(strCon);
            conn.Open();

            //string newRouteID = "";

            //if query string got value, reuse the routeid selected from ShowFavouriteLocation.aspx page
            //if (Request.QueryString["routeid"] != null)
            //{
            //    newRouteID = Request.QueryString["routeid"];
            //}
            //else
            //{ //query is null
                ////generate new routeID
                ////////////////////////////////////////////////////////////////////////////////////
                //string strSelectCurRouteID = "Select RouteID from Route order by RouteID desc";
                //sqlCommander = new SqlCommand(strSelectCurRouteID, conn);
                //string currentRouteID = sqlCommander.ExecuteScalar().ToString();

                ////processing new Route ID
                //string routeCurNumeric = currentRouteID.Substring(1, 7);

                //int newRouteNumeric = Int32.Parse(routeCurNumeric) + 1;
                //string newRouteNumericStr = newRouteNumeric.ToString();

                //while (newRouteNumericStr.Length != 7)
                //{
                //    newRouteNumericStr = "0" + newRouteNumericStr;
                //}

                //newRouteID = "R" + newRouteNumericStr;


                //////////////////////////////////////////////////////////////////////////

                ////Now, Create new route record
                //string strCreateRoute = "Insert Into Route (RouteID, Origin, Destination, TotalDistance, RouteName) Values(@RouteID, @Origin, @Destination, @TotalDistance, @RouteName)";

                //sqlCommander = new SqlCommand(strCreateRoute, conn);
                //sqlCommander.Parameters.AddWithValue("@RouteID", newRouteID);
                //sqlCommander.Parameters.AddWithValue("@Origin", Session["Origin"]);
                //sqlCommander.Parameters.AddWithValue("@Destination", Session["Destination"]);
                //sqlCommander.Parameters.AddWithValue("@TotalDistance", 10.0); // assuming always 10.0 KM
                //sqlCommander.Parameters.AddWithValue("@RouteName", ""); //only used in adding favourite location manually

                //int createResult = -1;

                //createResult = sqlCommander.ExecuteNonQuery();

                //here
            //}

            //no check for creation status
            //////////////////////////////////////////////////////////////////////////////////////////////

            //generate new routeID
            //////////////////////////////////////////////////////////////////////////////////
            string strSelectCurRouteID = "Select RouteID from Route order by RouteID desc";
            sqlCommander = new SqlCommand(strSelectCurRouteID, conn);
            //string currentRouteID = sqlCommander.ExecuteScalar().ToString();
            string currentRouteID = "";
            SqlDataReader dtrRoute;
            dtrRoute = sqlCommander.ExecuteReader();

            if (dtrRoute.HasRows)
            {

                dtrRoute.Read();
                currentRouteID = dtrRoute["RouteID"].ToString();

                //processing new Route ID
                string routeCurNumeric = currentRouteID.Substring(1, 7);

                int newRouteNumeric = Int32.Parse(routeCurNumeric) + 1;
                string newRouteNumericStr = newRouteNumeric.ToString();

                while (newRouteNumericStr.Length != 7)
                {
                    newRouteNumericStr = "0" + newRouteNumericStr;
                }

                this.newRouteID = "R" + newRouteNumericStr;


            }
            else //empty table
            {
                this.newRouteID = "R0000001";
            }
            dtrRoute.Close();
            ////////////////////////////////////////////////////////////////////////

            //Now, Create new route record
            string strCreateRoute = "Insert Into Route (RouteID, Origin, Destination, TotalDistance, RouteName) Values(@RouteID, @Origin, @Destination, @TotalDistance, @RouteName)";

            sqlCommander = new SqlCommand(strCreateRoute, conn);
            sqlCommander.Parameters.AddWithValue("@RouteID", this.newRouteID);
            sqlCommander.Parameters.AddWithValue("@Origin", Session["Origin"]);
            sqlCommander.Parameters.AddWithValue("@Destination", Session["Destination"]);
            sqlCommander.Parameters.AddWithValue("@TotalDistance", 10.0); // assuming always 10.0 KM
            sqlCommander.Parameters.AddWithValue("@RouteName", ""); //only used in adding favourite location manually

            int createResult = -1;

            createResult = sqlCommander.ExecuteNonQuery();

            //calc total charges
            SqlDataReader dtrCalc;

            string strCalculateCharges = "Select (r.TotalDistance * t.Fare) as \"totalCharges\" from route r, taxi t where routeid = @RouteIDCalc and taxiplateno = @TaxiPlateNoCalc";
            sqlCommander = new SqlCommand(strCalculateCharges, conn);
            sqlCommander.Parameters.AddWithValue("@RouteIDCalc", this.newRouteID);
            sqlCommander.Parameters.AddWithValue("@TaxiPlateNoCalc", Session["SelTaxiPlateNo"]);
            dtrCalc = sqlCommander.ExecuteReader();
            //this.douTotalCharges = (double)sqlCommander.ExecuteScalar(); //WATCH THIS OUT

            //douTotalCharges = Math.Round(douTotalCharges*1.00, 2);

            if (dtrCalc.HasRows)
            {
                while (dtrCalc.Read())
                {
                    //douTotalCharges = (double)dtrCalc["totalCharges"];
                    totalCharges = (double)dtrCalc["totalCharges"];
                }
            }

            dtrCalc.Close();

            //PickUp Part

            //generation of new PickUpID
            string strSelectCurPickUpID = "Select PickUpID from PickUp order by PickUpID desc";
            sqlCommander = new SqlCommand(strSelectCurPickUpID, conn);
            //string currentPickUpID = sqlCommander.ExecuteScalar().ToString();
            string currentPickUpID = "";
            string newPickUpID = "";
            SqlDataReader dtrPickUp;
            dtrPickUp = sqlCommander.ExecuteReader();

            if(dtrPickUp.HasRows){ //PickUp table has records

                dtrPickUp.Read();
                currentPickUpID = dtrPickUp["PickUpID"].ToString();

                //processing new PickUp ID
                string pickUpCurNumeric = currentPickUpID.Substring(2, 7);

                int newPickUpNumeric = Int32.Parse(pickUpCurNumeric) + 1;
                string newPickUpNumericStr = newPickUpNumeric.ToString();

                while (newPickUpNumericStr.Length != 7)
                {
                    newPickUpNumericStr = "0" + newPickUpNumericStr;
                }

                

                newPickUpID = "PU" + newPickUpNumericStr;
            }
            else //Pickup table is empty
            {
                newPickUpID = "PU0000001";
            }

            dtrPickUp.Close();

            //create new PickUp record
            string strCreatePickUp = "Insert Into PickUp (PickupID, PickupTime, EstimatedArrivalTime, ArrivalTime, Status, RouteID) Values(@PickUpID, @PickUpTime, @EstimatedArrivalTime, @ArrivalTime, @Status, @RouteID)";
            sqlCommander = new SqlCommand(strCreatePickUp, conn);

            sqlCommander.Parameters.AddWithValue("@PickUpID", newPickUpID);
            sqlCommander.Parameters.AddWithValue("@PickUpTime", Session["NewPickupTime"]);
            sqlCommander.Parameters.AddWithValue("@EstimatedArrivalTime", Session["NewEstArrTime"]);
            sqlCommander.Parameters.AddWithValue("@ArrivalTime", Session["NewEstArrTime"]); // Since there is no pickup module, assume this actual arrival time equals to estimated arrival time
            sqlCommander.Parameters.AddWithValue("@Status", "Incomplete");
            sqlCommander.Parameters.AddWithValue("@RouteID", newRouteID);

            int createPickUpResult = -1;
            createPickUpResult = sqlCommander.ExecuteNonQuery();

            //assume no checking for creation result.


            //disabled because already run in pageload(), this is to increase performance
            //// Reservation part
            //string strSelectCurRsvID = "Select ReservationID from Reservation order by ReservationID desc";
            //sqlCommander = new SqlCommand(strSelectCurRsvID, conn);
            //string currentRsvID = sqlCommander.ExecuteScalar().ToString();

            ////processing new Reservation ID
            //string rsvIDCurNumeric = currentRsvID.Substring(2, 7);

            //int newRsvIDNumeric = Int32.Parse(rsvIDCurNumeric) + 1;
            //string newRsvIDNumericStr = newRsvIDNumeric.ToString();

            //while (newRsvIDNumericStr.Length != 7)
            //{
            //    newRsvIDNumericStr = "0" + newRsvIDNumericStr;
            //}

            //string newRsvID = "RS" + newRsvIDNumericStr;


            ////calculate total charges
            ////TotalDistance * Fare

            //string strCalculateCharges = "Select (r.TotalDistance * t.Fare) from route r, taxi t where routeid = @RouteIDCalc and taxiplateno = @TaxiPlateNoCalc";
            //sqlCommander = new SqlCommand(strCalculateCharges, conn);
            //sqlCommander.Parameters.AddWithValue("@RouteIDCalc", newRouteID);
            //sqlCommander.Parameters.AddWithValue("@TaxiPlateNoCalc", Session["SelTaxiPlateNo"]);
            //double totalCharges = (double)sqlCommander.ExecuteScalar(); //WATCH THIS OUT




            //create new reservation record
            string strCreateRsvID = "Insert Into Reservation (ReservationID, ReservationTime, TotalCharges, ReservationStatus, CustomerID, RouteID, TaxiPlateNo) "+
                "Values(@ReservationID, @ReservationTime, @TotalCharges, @ReservationStatus, @CustomerID, @RouteID, @TaxiPlateNo)";
            
            sqlCommander = new SqlCommand(strCreateRsvID, conn);

            sqlCommander.Parameters.AddWithValue("@ReservationID", this.newRsvID);
            sqlCommander.Parameters.AddWithValue("@ReservationTime", Session["ReservationTime"]);
            sqlCommander.Parameters.AddWithValue("@TotalCharges", totalCharges); //WATCH THIS OUT
            sqlCommander.Parameters.AddWithValue("@ReservationStatus", "Incomplete"); //always "Incomplete" yet, because haven't paid.
            sqlCommander.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]); 
            sqlCommander.Parameters.AddWithValue("@RouteID", newRouteID);
            sqlCommander.Parameters.AddWithValue("@TaxiPlateNo", Session["SelTaxiPlateNo"]);

            int createReservationResult = -1;
            createReservationResult = sqlCommander.ExecuteNonQuery();

            //END, Reservation stored

            //assume no checking for creation result.


            conn.Close();

            HttpContext.Current.Session["myPayment"] = this;
            PaymentT payment = new PaymentT();
            payment.ReservationID = this.newRsvID;
            payment.PlateNumber = lblVhPlateNo.Text;
            payment.TotalAmount = totalCharges;
            payment.Origin = lblPckAddress.Text;
            payment.Destination = lblPckDest.Text;
            payment.ReservationDateTime = (DateTime)Session["ReservationTime"];
            payment.PickUpDateTime = (DateTime)Session["NewPickupTime"];
            payment.CarModel = lblVhModel.Text;
            payment.PickUpAddress = lblPckAddress.Text;
            payment.DriverName = lblDrvName.Text;

            Session["MyPayment"] = (PaymentT)payment;

            Response.Redirect("Payment.aspx");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //a confirmation msg or what?
            Response.Redirect("MakeReservation.aspx");
        }

        protected void lblAddToFav_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AddFavouriteLocation.aspx?redirect=true");
            divAddNewFavLoc.Style.Clear();
            txtNewFavLocName.Focus();
        }

        protected void btnAddFavLoc_Click(object sender, EventArgs e)
        {

            divAddNewFavLoc.Style.Clear();

            DateTime curTime = DateTime.Now;

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;

            SqlCommand sqlCommander;

            conn = new SqlConnection(strCon);
            conn.Open();

            //create a new route record first
            //generate new routeID
            //////////////////////////////////////////////////////////////////////////////////
            string strSelectCurRouteID = "Select RouteID from Route order by RouteID desc";
            sqlCommander = new SqlCommand(strSelectCurRouteID, conn);
            //string currentRouteID = sqlCommander.ExecuteScalar().ToString();
            string currentRouteID = "";
            SqlDataReader dtrRoute;
            dtrRoute = sqlCommander.ExecuteReader();
            string newRouteID = "";

            if (dtrRoute.HasRows)
            {
                //wrong because this will causes the string to be replaced and replaced until replaced with the
                //the last value, which is the oldest or first ID.
                //while (dtrRoute.Read())
                //{
                //    currentRouteID = dtrRoute["RouteID"].ToString();
                //}

                //mannually advance the dtrRoute by only one step from record 0 to record 1
                //which is the first record.
                dtrRoute.Read();
                currentRouteID = dtrRoute["RouteID"].ToString();

                //processing new Route ID

                string routeCurNumeric = currentRouteID.Substring(1, 7);

                int newRouteNumeric = Int32.Parse(routeCurNumeric) + 1;
                string newRouteNumericStr = newRouteNumeric.ToString();

                while (newRouteNumericStr.Length != 7)
                {
                    newRouteNumericStr = "0" + newRouteNumericStr;
                }

                newRouteID = "R" + newRouteNumericStr;


            }
            else //empty table
            {
                newRouteID = "R0000001";
            }

            dtrRoute.Close();
            ////////////////////////////////////////////////////////////////////////

            //Now, Create new route record
            string strCreateRoute = "Insert Into Route (RouteID, Origin, Destination, TotalDistance, RouteName) Values(@RouteID, @Origin, @Destination, @TotalDistance, @RouteName)";

            sqlCommander = new SqlCommand(strCreateRoute, conn);
            sqlCommander.Parameters.AddWithValue("@RouteID", newRouteID);
            sqlCommander.Parameters.AddWithValue("@Origin", Session["Origin"].ToString());
            sqlCommander.Parameters.AddWithValue("@Destination", Session["Destination"].ToString());
            sqlCommander.Parameters.AddWithValue("@TotalDistance", 10.0); // assuming always 10.0 KM
            sqlCommander.Parameters.AddWithValue("@RouteName", txtNewFavLocName.Text);

            int createResult = -1;

            createResult = sqlCommander.ExecuteNonQuery();

            string strCreateFavLoc = "Insert into FavouriteLocation (RouteID, CustomerID, DateAdded) values(@RouteID, @CustomerID, @DateAdded)";
            sqlCommander = new SqlCommand(strCreateFavLoc, conn);
            sqlCommander.Parameters.AddWithValue("@RouteID", newRouteID);
            sqlCommander.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            sqlCommander.Parameters.AddWithValue("@DateAdded", curTime);

            int createFavLocResult = -1;

            createFavLocResult = sqlCommander.ExecuteNonQuery();

            if (createFavLocResult > 0)
            {
                lblAddFavLocMsg.ForeColor = Color.Green;
                lblAddFavLocMsg.Text = "Your favourite location \"" + txtNewFavLocName.Text + "\" has been added successfully.";
                btnClose.Visible = true;
            }
            else
            {
                lblAddFavLocMsg.ForeColor = Color.Red;
                lblAddFavLocMsg.Text = "Sorry, the system cannot add your favourite location \"" + txtNewFavLocName.Text + "\".";
            }

            conn.Close();
        }

        protected void btnCancelAddFavLoc_Click(object sender, EventArgs e)
        {
            txtNewFavLocName.Text = "";
            divAddNewFavLoc.Style.Add("visibility", "hidden");
            divAddNewFavLoc.Style.Add("display", "none");
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            txtNewFavLocName.Text = "";
            divAddNewFavLoc.Style.Add("visibility", "hidden");
            divAddNewFavLoc.Style.Add("display", "none");
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