using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Globalization;
using System.Web.Security;
namespace WebAppAsg
{
    public partial class CreateDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlConnection con;
            string conStr = ConfigurationManager.ConnectionStrings["WebDBConnectionString"].ConnectionString;
            con = new SqlConnection(conStr);
            con.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "SELECT TOP 1 DriverID FROM Driver ORDER BY DriverID DESC";
            cmdSelect = new SqlCommand(strSelect, con);
            object i = cmdSelect.ExecuteScalar();
            if(i!=null)
            {
                String lastRowCode = i.ToString();
                String subStr = lastRowCode.Substring(2, 3);
                int ConvertedSubStr = Convert.ToInt32(subStr);
                int increCode = ConvertedSubStr + 1;
                String automatedCode = "DR" + String.Format("{0:000}", increCode);
                lblDriver.Text = automatedCode;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Membership.CreateUser(txtUsername.Text, txtPassword.Text);
                Roles.AddUserToRole(txtUsername.Text, "Driver");
            }
            catch (MembershipCreateUserException ex)
            {
                String error = ex.Message.ToString();
            }
            using (LINQDataContext dbContext = new LINQDataContext())
            {
                Driver newDriver = new Driver
                {
                    DriverID = lblDriver.Text,
                    Name = txtName.Text,
                    ICNo = txtIc1.Text + txtIc2.Text + txtIc3.Text,
                    TaxiCompany = txtCompany.Text,
                    DrivingLicenseExpiryDate = DateTime.Parse(txtDate.Text),
                    ContactNo = txtPhone1.Text + txtPhone2.Text,
                    Address = txtAddress.Text,
                    DriverStatus = "Active",
                    Gender = rbGender.SelectedValue,
                    username = txtUsername.Text,
                    password = txtRetype.Text

                };
                dbContext.Drivers.InsertOnSubmit(newDriver);
                Taxi newTaxi = new Taxi
                {
                    TaxiPlateNo = txtPlate.Text,
                    VehicleType = rbType.SelectedValue,
                    Fare = int.Parse(lblFare.Text),
                    Availability = "Available",
                    VehicleManufacturer = txtManufacturer.Text,
                    VehicleModel = txtModel.Text,
                    VehicleColour = txtColour.Text,
                    DriverID = lblDriver.Text

                };
                dbContext.Taxis.InsertOnSubmit(newTaxi);
                dbContext.SubmitChanges();
                string script = "alert(\"New Driver Record has been created!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script,true);
                Response.Redirect("~/HRManager/HRManageDriver.aspx");
            }
        }

        protected void rbType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbType.SelectedValue == "Normal")
            {
                lblFare.Text = "2";

            }else if(rbType.SelectedValue=="Large"){
                lblFare.Text = "4";
            }
        }

        protected void rbGender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtRetype_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HRManager/HRManageDriver.aspx");
        }

        
    }
}