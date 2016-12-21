using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace WebAppAsg
{
    public partial class DriverHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSourceID = LinqDataSource1.ID;
        
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String driverID = GridView1.SelectedValue.ToString() ;
            Response.Redirect("ManageDriverTaxi.aspx?driverid=" + driverID);

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
         
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
             String query = "%%";

    if (txtSearch.Text != String.Empty)
    {
        query = "%" + txtSearch.Text + "%";
    }
            LINQDataContext dbContext = new LINQDataContext();
           var driver=(from i in dbContext.Drivers
                         where SqlMethods.Like(i.DriverID, query) ||
                                 SqlMethods.Like(i.Name, query) ||
                                 SqlMethods.Like(i.ICNo, query) ||
                                 SqlMethods.Like(i.TaxiCompany, query)||
                                 //SqlMethods.Equals(i.DrivingLicenseExpiryDate,query)||
                                 SqlMethods.Like(i.ContactNo,query)||
                                 SqlMethods.Like(i.Address,query)||
                                 SqlMethods.Like(i.DriverStatus,query)||
                                 SqlMethods.Like(i.Gender,query)

                         select new
                         {
                             DriverID=i.DriverID,
                             Name=i.Name,
                             ICNo=i.ICNo,
                             TaxiCompany=i.TaxiCompany,
                             DrivingLicenseExpiryDate=i.DrivingLicenseExpiryDate,
                             ContactNo=i.ContactNo,
                             Address=i.Address,
                             DriverStatus=i.DriverStatus,
                             Gender=i.Gender
                             
                         });


    e.Result = driver;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HRManager/CreateDriver.aspx");

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }


  
        
    }
}