using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppAsg;

namespace ProjectTaxiMgmt
{
    public partial class custHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String username = Session["username"].ToString();
            //String password = Session["password"].ToString();
            //LINQDataContext dbContext = new LINQDataContext();
            //var pass = (from i in dbContext.Customers
            //            where i.username == username && i.password == password
            //            select i).FirstOrDefault();
            //Session["CustomerID"] = pass.CustomerID;
        }

        protected void btnRsv_Click(object sender, EventArgs e)
        {
            Response.Redirect("MakeReservation.aspx");
        }

        protected void btnAddFav_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddFavouriteLocation.aspx");
        }

        protected void viewFav_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowFavouriteLocation.aspx");
        }

        protected void btnPastHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("PastBookingHistory.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateCustomer.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}