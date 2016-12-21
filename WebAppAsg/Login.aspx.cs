using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppAsg;
namespace WebAppAsg
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtLogin_Click(object sender, EventArgs e)
        {
            Session["username"] = txtUsername.Text;
            Session["password"] = txtPassword.Text;
           
            if (Membership.ValidateUser(txtUsername.Text, txtPassword.Text))
            {
                if (Roles.IsUserInRole(txtUsername.Text, "Customer"))
                {
                    FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, false);
                    Response.Redirect("~/custHome.aspx");
                }
                else if (Roles.IsUserInRole(txtUsername.Text, "Driver"))
                {
                    
                    FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, false);
                    Response.Redirect("~/SendArrivalEmail.aspx");
                }
                else if (Roles.IsUserInRole(txtUsername.Text, "HRManager"))
                {
                    FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, false);
                    Response.Redirect("~/Homepage.aspx");
                }
            }
            else
            {

                string scriptText = "alert('Invalid user! Try again.')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
            }
        }

        protected void txtClear_Click(object sender, EventArgs e)
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
        }
    }
}