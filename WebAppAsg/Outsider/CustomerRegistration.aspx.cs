using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace WebAppAsg
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string conStr = ConfigurationManager.ConnectionStrings["WebDBConnectionString"].ConnectionString;
            con = new SqlConnection(conStr);
            con.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "SELECT TOP 1 CustomerID FROM Customer ORDER BY CustomerID DESC";
            cmdSelect = new SqlCommand(strSelect, con);
            object i = cmdSelect.ExecuteScalar();
            if (i != null)
            {
                String lastRowCode = i.ToString();
                String subStr = lastRowCode.Substring(2, 3);
                int ConvertedSubStr = Convert.ToInt32(subStr);
                int increCode = ConvertedSubStr + 1;
                String automatedCode = "CT" + String.Format("{0:000}", increCode);
                lblCustomerID.Text = automatedCode;
            }
        }

        protected void rbGender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                Membership.CreateUser(txtUsername.Text, txtPassword.Text);
                Roles.AddUserToRole(txtUsername.Text, "Customer");
            }
            catch (MembershipCreateUserException ex)
            {
                String error = ex.Message.ToString();
            }
            using (LINQDataContext dbContext = new LINQDataContext())
            {

                Customer newCustomer = new Customer
                {
                    CustomerID = lblCustomerID.Text,
                    IcNumber = txtIc1.Text + txtIc2.Text + txtIc3.Text,
                    Name = txtName.Text,
                    Address = txtAddress.Text,
                    PostCode = txtPostCode.Text,
                    State = ddlState.SelectedValue,
                    Gender = rbGender.SelectedValue,
                    HomePhoneNo = txtPhone1.Text + txtPhone2.Text,
                    MobilePhoneNo = txtPhone11.Text + txtPhone22.Text,
                    EmailAddress = txtEmail.Text,
                    username = txtUsername.Text,
                    password = txtRetype.Text
                };

                dbContext.Customers.InsertOnSubmit(newCustomer);
                dbContext.SubmitChanges();
                string script = "alert(\"You Have Successful Create A New Account!Back To Login.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void txtCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
