using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace WebAppAsg
{
    public partial class ManageDriverTaxi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDriverID.Text = Request.QueryString["driverid"];
            //LINQDataContext dbContext = new LINQDataContext();
            //var retrievetaxi = (from a in dbContext.Taxis
            //                    where a.DriverID == lblDriverID.Text
            //                    select a).FirstOrDefault();

            //txtColour.Text = retrievetaxi.VehicleColour;
            //txtFare.Text = retrievetaxi.Fare.ToString();
            
          



        }

        protected void FormView1_ModeChanged(object sender, EventArgs e)
        {
           
            //if ((FormView1.FindControl("DropDownList1") as DropDownList).Text == "Normal")
            //{
            //    (FormView1.FindControl("FareTextBox") as TextBox).Text = "2";
            //}
            //else if ((FormView1.FindControl("DropDownList1") as DropDownList).Text == "Large")
            //{
            //    (FormView1.FindControl("FareTextBox") as TextBox).Text = "4";
            //}
        }

        protected void FormView1_PreRender(object sender, EventArgs e)
        {
            if (FormView1.CurrentMode == FormViewMode.Edit)
            {
                DropDownList ddl1 = FormView1.FindControl("DropDownList1") as DropDownList;
                TextBox tb = FormView1.FindControl("FareTextBox") as TextBox;

                if (ddl1.SelectedValue == "Normal")
                {
                    tb.Text = "2";
                }
                else if (ddl1.SelectedValue == "Large")
                {
                    tb.Text = "4";
                }
                else { }

            }
            else { }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FareTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HRManager/HRManageDriver.aspx");

        }

    
        //protected void rbType_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (rbType.SelectedValue == "Normal")
        //    {
        //        txtFare.Text = "2";

        //    }
        //    else if (rbType.SelectedValue == "Large")
        //    {
        //        txtFare.Text = "4";
        //    }
        //}
   
    }
}