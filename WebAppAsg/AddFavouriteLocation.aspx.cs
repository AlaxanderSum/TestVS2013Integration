using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using WebAppAsg;

namespace ProjectTaxiMgmt
{
    public partial class AddFavouriteLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblMsg.Text = "";
            txtName.Focus();

            //This is for temporary basis only
            Session["CustomerID"] = "CT001";
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowFavouriteLocation.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            Page.Validate("valiFav");

           
                string name = "";
                string origin = "";
                string dest = "";

                name = txtName.Text;
                origin = txtOrigin.Text;
                dest = txtDest.Text;

                DateTime curTime = DateTime.Now;

                SqlConnection conn;
                string strCon = ConfigurationManager.ConnectionStrings["WebDBConString"].ConnectionString;

                SqlCommand sqlCommander;

                conn = new SqlConnection(strCon);
                conn.Open();
                
            if (Page.IsValid)
            {
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
                sqlCommander.Parameters.AddWithValue("@Origin", txtOrigin.Text);
                sqlCommander.Parameters.AddWithValue("@Destination", txtDest.Text);
                sqlCommander.Parameters.AddWithValue("@TotalDistance", 10.0); // assuming always 10.0 KM
                sqlCommander.Parameters.AddWithValue("@RouteName", txtName.Text);

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
                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Your favourite location \"" + txtName.Text + "\" has been added successfully.";
                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Sorry, the system cannot add your favourite location \"" + txtName.Text + "\".";
                }
            }

            conn.Close();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtOrigin.Text = "";
            txtDest.Text = "";

            txtName.Focus();
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