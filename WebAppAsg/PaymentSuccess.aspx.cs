using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = Session["TotalAmount"].ToString();            
            Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('OnlineReceipt.aspx','_newtab');", true);
            
        }
    }
}