using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Payment : System.Web.UI.Page
    {
        private string amount;
        private string host;
        private string regNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

           
            PaymentT myPayment = (PaymentT)Session["MyPayment"];
            this.amount = String.Format("{0:0.00}", myPayment.TotalAmount);
            string hostName = Request.Url.GetLeftPart(UriPartial.Authority);
            this.host = hostName + "/";
            this.regNo = myPayment.ReservationID;
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            
           

            
        }


        public string Amounts { get { return amount; } }
        public string Host { get { return host; } }
        public string RegNo { get { return regNo; } }
    }
    
}