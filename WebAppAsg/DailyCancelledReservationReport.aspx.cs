using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectTaxiMgmt
{
    public partial class DailyCancelledReservationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportViewer1.Visible = false;

            DateTime defaultDate = DateTime.Now.AddDays(-1);

            calRepDate.SelectedDate = defaultDate;

            if (Session["DCRReportDate"] != null)
            {
                calRepDate.SelectedDate = (DateTime)Session["DCRReportDate"];
            }

            if (Request.QueryString["redirect"] != null)
            {
                if (Request.QueryString["redirect"].Equals("yes"))
                {
                    ReportViewer1.Visible = true;
                }
            }

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {

            DateTime selectedDate = calRepDate.SelectedDate;
            Session["DCRReportDate"] = selectedDate;
            ReportViewer1.Visible = true;
            Response.Redirect("DailyCancelledReservationReport.aspx?redirect=yes");
            
            //ReportViewer1.DataBind();
            //ReportViewer1.LocalReport.
            //ReportViewer1.LocalReport.Refresh();
        }

        protected void calRepDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = calRepDate.SelectedDate;
            Session["DCRReportDate"] = selectedDate;
        }


    }
}