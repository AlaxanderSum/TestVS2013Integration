using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebAppAsg
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Membership.CreateUser("zkteoh", "zk1234567");
            Roles.AddUserToRole("zkteoh", "Driver");
            Membership.CreateUser("teohyun", "ty1234567");
            Roles.AddUserToRole("teohyun", "Driver");
            Membership.CreateUser("maokai", "mk1234567");
            Roles.AddUserToRole("maokai", "Driver");
        }
    }
}