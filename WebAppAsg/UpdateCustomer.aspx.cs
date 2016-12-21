using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAsg
{
    public partial class UpdateCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Session["username"].ToString();
            String password = Session["password"].ToString();
            LINQDataContext dbContext = new LINQDataContext();
            var pass = (from i in dbContext.Customers
                        where i.username == username && i.password == password
                        select i).FirstOrDefault();
            lblCustomerID.Text = pass.CustomerID;
        }
        protected void FormView1_PreRender(object sender, EventArgs e)
        {
            if (FormView1.CurrentMode == FormViewMode.ReadOnly)
            {
                Label RealPhone1 = FormView1.FindControl("lblPhone1") as Label;
                Label RealPhone2 = FormView1.FindControl("lblPhone2") as Label;
                Label lblPhone1 = FormView1.FindControl("HomePhoneNoLabel") as Label;
                Label lblPhone2 = FormView1.FindControl("HomePhoneNoLabel") as Label;
                lblPhone1.Text.Substring(0, 2);
                lblPhone2.Text.Substring(2, 7);
                RealPhone1.Text = lblPhone1.Text.Substring(0, 2);
                RealPhone2.Text = lblPhone2.Text.Substring(2, 7);
                Label RealPhone3 = FormView1.FindControl("lblPhone3") as Label;
                Label RealPhone4 = FormView1.FindControl("lblPhone4") as Label;
                Label lblPhone3 = FormView1.FindControl("MobilePhoneNoLabel") as Label;
                Label lblPhone4 = FormView1.FindControl("MobilePhoneNoLabel") as Label;
                lblPhone3.Text.Substring(0, 2);
                lblPhone4.Text.Substring(2, 7);
                RealPhone3.Text = lblPhone3.Text.Substring(0, 3);
                RealPhone4.Text = lblPhone4.Text.Substring(3, 7);
            }

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/custHome.aspx");
                
        }
    }
}