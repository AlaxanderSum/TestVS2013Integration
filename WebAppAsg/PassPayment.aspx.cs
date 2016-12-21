using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class PassPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["myPayment"] = this;
            PaymentT payment = new PaymentT();
            payment.ReservationID = "RS0000001";
            payment.PlateNumber = "PKS6321";
            payment.TotalAmount = 10.00000;
            payment.Origin = "Danau Kota";
            payment.Destination = "Setapak Central Mall";
            payment.ReservationDateTime = System.DateTime.Today;
            payment.PickUpDateTime = System.DateTime.Today;
            payment.CarModel = "Saga";
            payment.DriverName = "Chong Seng Hao";

            Session["MyPayment"] = (PaymentT)payment;
            
            Response.Redirect("Payment.aspx");
        }
    }
}