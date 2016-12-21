using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class DisplayTaxiDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            //HttpContext.Current.Session["myPayment"] = this;
            //PaymentT payment = new PaymentT();
            //payment.ReservationID = "RS0000001";
            //payment.PlateNumber = "PKS6321";
            //payment.TotalAmount = 10.00000;
            //payment.Origin = "Danau Kota";
            //payment.Destination = "Setapak Central Mall";
            //payment.ReservationDateTime = System.DateTime.Now;
            //payment.PickUpDateTime = System.DateTime.Now;
            //payment.CarModel = "Saga";
            //payment.DriverName = "Teoh Zhang Kuan";

            //Session["MyPayment"] = (PaymentT)payment;


            try
            {
                PaymentT myPayment = (PaymentT)Session["MyPayment"];
                lblPlateNo.Text = myPayment.PlateNumber;
                lblOrigin.Text = myPayment.Origin;
                lblDestination.Text = myPayment.Destination;
                lblVehicleModel.Text = myPayment.CarModel;
                lblDriverName.Text = myPayment.DriverName;
                lblWaitTime.Text = "Approximately 15minutes";
                Label1.Text = Convert.ToDateTime(myPayment.PickUpDateTime).ToString("dd/MM/yyyy") + " " + myPayment.PickUpDateTime.AddMinutes(15).ToShortTimeString();
                //Label1.Text = myPayment.PickUpDateTime.ToShortDateString() + " " + myPayment.PickUpDateTime.AddMinutes(15).ToShortTimeString();


                try
                {
                    SqlConnection conBook;
                    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    conBook = new SqlConnection(connStr);
                    conBook.Open();

                    string strSelect;
                    SqlCommand cmdSelect;

                    strSelect = "Select VehicleColour, VehicleType FROM Taxi  WHERE TaxiPlateNo = @PlateNo";

                    cmdSelect = new SqlCommand(strSelect, conBook);

                    cmdSelect.Parameters.AddWithValue("@PlateNo", myPayment.PlateNumber);
                    SqlDataReader dtr;
                    dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            lblVehicleColor.Text = dtr["VehicleColour"].ToString();
                            lblVehicleType.Text = dtr["VehicleType"].ToString();



                        }
                    }




                    //conBook.Close();
                    dtr.Close();

                    strSelect = "Select ContactNo From Driver WHERE Name = @Name";
                    cmdSelect = new SqlCommand(strSelect, conBook);
                    cmdSelect.Parameters.AddWithValue("@Name", myPayment.DriverName);
                    dtr = cmdSelect.ExecuteReader();
                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            lblDriveContact.Text = dtr["ContactNo"].ToString();
                        }
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
               
            
                    
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('OnlineReceipt.aspx','_newtab')", true);
                
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Payment.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("custHome.aspx");
        }

        
    }
}