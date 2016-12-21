using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectTaxiMgmt
{
    public partial class MonthlyRsvReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportViewer1.Visible = false;

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
            string year = "";
            year = txtYear.Text;

            DateTime JanStart;
            DateTime JanEnd;
            DateTime FebStart;
            DateTime FebEnd;
            DateTime MacStart;
            DateTime MacEnd;
            DateTime AprStart;
            DateTime AprEnd;
            DateTime MayStart;
            DateTime MayEnd;
            DateTime JunStart;
            DateTime JunEnd;
            DateTime JulStart;
            DateTime JulEnd;
            DateTime AugStart;
            DateTime AugEnd;
            DateTime SepStart;
            DateTime SepEnd;
            DateTime OctStart;
            DateTime OctEnd;
            DateTime NovStart;
            DateTime NovEnd;
            DateTime DecStart;
            DateTime DecEnd;

            JanStart = DateTime.ParseExact(year + "-01-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime JanEndDate = new DateTime(JanStart.Year, JanStart.Month, DateTime.DaysInMonth(JanStart.Year, JanStart.Month));
            string strJanEnd = String.Format("{0:yyyy-MM-dd}", JanEndDate);
            string strJanEndActual = strJanEnd + " 23 59 59";
            JanEnd = DateTime.ParseExact(strJanEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["JanStart"] = JanStart;
            Session["JanEnd"] = JanEnd;

            FebStart = DateTime.ParseExact(year + "-02-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime FebEndDate = new DateTime(FebStart.Year, FebStart.Month, DateTime.DaysInMonth(FebStart.Year, FebStart.Month));
            string strFebEnd = String.Format("{0:yyyy-MM-dd}", FebEndDate);
            string strFebEndActual = strFebEnd + " 23 59 59";
            FebEnd = DateTime.ParseExact(strFebEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["FebStart"] = FebStart;
            Session["FebEnd"] = FebEnd;

            MacStart = DateTime.ParseExact(year + "-03-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime MacEndDate = new DateTime(MacStart.Year, MacStart.Month, DateTime.DaysInMonth(MacStart.Year, MacStart.Month));
            string strMacEnd = String.Format("{0:yyyy-MM-dd}", MacEndDate);
            string strMacEndActual = strMacEnd + " 23 59 59";
            MacEnd = DateTime.ParseExact(strMacEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["MacStart"] = MacStart;
            Session["MacEnd"] = MacEnd;

            AprStart = DateTime.ParseExact(year + "-04-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime AprEndDate = new DateTime(AprStart.Year, AprStart.Month, DateTime.DaysInMonth(AprStart.Year, AprStart.Month));
            string strAprEnd = String.Format("{0:yyyy-MM-dd}", AprEndDate);
            string strAprEndActual = strAprEnd + " 23 59 59";
            AprEnd = DateTime.ParseExact(strAprEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["AprStart"] = AprStart;
            Session["AprEnd"] = AprEnd;

            MayStart = DateTime.ParseExact(year + "-05-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime MayEndDate = new DateTime(MayStart.Year, MayStart.Month, DateTime.DaysInMonth(MayStart.Year, MayStart.Month));
            string strMayEnd = String.Format("{0:yyyy-MM-dd}", MayEndDate);
            string strMayEndActual = strMayEnd + " 23 59 59";
            MayEnd = DateTime.ParseExact(strMayEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["MayStart"] = MayStart;
            Session["MayEnd"] = MayEnd;

            JunStart = DateTime.ParseExact(year + "-06-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime JunEndDate = new DateTime(JunStart.Year, JunStart.Month, DateTime.DaysInMonth(JunStart.Year, JunStart.Month));
            string strJunEnd = String.Format("{0:yyyy-MM-dd}", JunEndDate);
            string strJunEndActual = strJunEnd + " 23 59 59";
            JunEnd = DateTime.ParseExact(strJunEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["JunStart"] = JunStart;
            Session["JunEnd"] = JunEnd;

            JulStart = DateTime.ParseExact(year + "-07-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime JulEndDate = new DateTime(JulStart.Year, JulStart.Month, DateTime.DaysInMonth(JulStart.Year, JulStart.Month));
            string strJulEnd = String.Format("{0:yyyy-MM-dd}", JulEndDate);
            string strJulEndActual = strJulEnd + " 23 59 59";
            JulEnd = DateTime.ParseExact(strJulEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["JulStart"] = JulStart;
            Session["JulEnd"] = JulEnd;

            AugStart = DateTime.ParseExact(year + "-08-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime AugEndDate = new DateTime(AugStart.Year, AugStart.Month, DateTime.DaysInMonth(AugStart.Year, AugStart.Month));
            string strAugEnd = String.Format("{0:yyyy-MM-dd}", AugEndDate);
            string strAugEndActual = strAugEnd + " 23 59 59";
            AugEnd = DateTime.ParseExact(strAugEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["AugStart"] = AugStart;
            Session["AugEnd"] = AugEnd;

            SepStart = DateTime.ParseExact(year + "-09-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime SepEndDate = new DateTime(SepStart.Year, SepStart.Month, DateTime.DaysInMonth(SepStart.Year, SepStart.Month));
            string strSepEnd = String.Format("{0:yyyy-MM-dd}", SepEndDate);
            string strSepEndActual = strSepEnd + " 23 59 59";
            SepEnd = DateTime.ParseExact(strSepEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["SepStart"] = SepStart;
            Session["SepEnd"] = SepEnd;

            OctStart = DateTime.ParseExact(year + "-10-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime OctEndDate = new DateTime(OctStart.Year, OctStart.Month, DateTime.DaysInMonth(OctStart.Year, OctStart.Month));
            string strOctEnd = String.Format("{0:yyyy-MM-dd}", OctEndDate);
            string strOctEndActual = strOctEnd + " 23 59 59";
            OctEnd = DateTime.ParseExact(strOctEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["OctStart"] = OctStart;
            Session["OctEnd"] = OctEnd;

            NovStart = DateTime.ParseExact(year + "-11-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime NovEndDate = new DateTime(NovStart.Year, NovStart.Month, DateTime.DaysInMonth(NovStart.Year, NovStart.Month));
            string strNovEnd = String.Format("{0:yyyy-MM-dd}", NovEndDate);
            string strNovEndActual = strNovEnd + " 23 59 59";
            NovEnd = DateTime.ParseExact(strNovEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["NovStart"] = NovStart;
            Session["NovEnd"] = NovEnd;

            DecStart = DateTime.ParseExact(year + "-12-01 00 00 00", "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            DateTime DecEndDate = new DateTime(DecStart.Year, DecStart.Month, DateTime.DaysInMonth(DecStart.Year, DecStart.Month));
            string strDecEnd = String.Format("{0:yyyy-MM-dd}", DecEndDate);
            string strDecEndActual = strDecEnd + " 23 59 59";
            DecEnd = DateTime.ParseExact(strDecEndActual, "yyyy-MM-dd HH mm ss", CultureInfo.InvariantCulture);
            Session["DecStart"] = DecStart;
            Session["DecEnd"] = DecEnd;

            ReportViewer1.Visible = true;
            Response.Redirect("MonthlyRsvReport.aspx?redirect=yes");
        }
    }
}