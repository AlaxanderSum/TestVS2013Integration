using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Printing;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class OnlineReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {

                    PaymentT myPayment = (PaymentT)Session["MyPayment"];
                    Boolean valid = false;
                    do
                    {
                        String date = DateTime.Now.ToString("ddMMyyyy");
                        String randomNo = GenerateRandomNo().ToString("0000");
                        String paymentID = "PD" + date + randomNo;
                        myPayment.PaymentID = paymentID;

                        try
                        {
                            SqlConnection conBook;
                            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                            conBook = new SqlConnection(connStr);
                            conBook.Open();

                            string strSelect;
                            SqlCommand cmdSelect;


                            strSelect = "Select PaymentID FROM payment WHERE PaymentID = @PayID";
                            cmdSelect = new SqlCommand(strSelect, conBook);

                            cmdSelect.Parameters.AddWithValue("@PayID", paymentID);
                            SqlDataReader dtr;
                            dtr = cmdSelect.ExecuteReader();

                            if (dtr.HasRows)
                            {
                                while (dtr.Read())
                                {
                                    valid = true;


                                }
                            }


                            conBook.Close();
                            dtr.Close();
                        }
                        catch (Exception ex)
                        {

                        }
                    } while (valid);


                    DateTime PaymentDateTime = System.DateTime.Now;
                    lblPaymentID.Text = myPayment.PaymentID;
                    lblPaymentDate.Text = Convert.ToDateTime(PaymentDateTime).ToString("dd/MM/yyyy");
                    // double payAmt = myPayment.TotalAmount;

                    //lblPaymentAmount.Text = "RM " + myPayment.TotalAmount.ToString({"0.00");
                    lblPaymentAmount.Text = "RM " + String.Format("{0:0.00}", myPayment.TotalAmount);
                    //lblPaymentAmount.Text = "RM " + Math.Round(payAmt, 2);
                    lblPaymentTime.Text = PaymentDateTime.ToShortTimeString();

                    lblTaxiPlate.Text = myPayment.PlateNumber;

                    lblReservationID.Text = myPayment.ReservationID;
                    lblReservationDate.Text = myPayment.ReservationDateTime.ToShortDateString();
                    lblReservationTime.Text = myPayment.ReservationDateTime.ToShortTimeString();

                    lblOrigin.Text = myPayment.Origin;
                    lblDestination.Text = myPayment.Destination;

                    lblPickUpDate.Text = myPayment.PickUpDateTime.ToShortDateString();
                    lblPickUpTime.Text = myPayment.PickUpDateTime.ToShortTimeString();

                    try
                    {
                        SqlConnection connBook;
                        string connnStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        connBook = new SqlConnection(connnStr);
                        connBook.Open();


                        string strInsert;
                        SqlCommand cmdInsert;

                        strInsert = "Insert Into Payment(PaymentID,PaymentDate,PaymentAmount,ReservationID) Values(@payID,@payDate,@payAmt,@ReservationID)";

                        cmdInsert = new SqlCommand(strInsert, connBook);

                        cmdInsert.Parameters.AddWithValue("@payID", myPayment.PaymentID);
                        cmdInsert.Parameters.AddWithValue("@payDate", PaymentDateTime);
                        cmdInsert.Parameters.AddWithValue("@payAmt", myPayment.TotalAmount.ToString());
                        cmdInsert.Parameters.AddWithValue("@ReservationID", myPayment.ReservationID);

                        int n = cmdInsert.ExecuteNonQuery();

                        string strUpdate;
                        SqlCommand cmdUpdate;

                        strUpdate = "Update Reservation Set ReservationStatus ='Complete' WHERE ReservationID = @ReservationID";

                        cmdUpdate = new SqlCommand(strUpdate, connBook);

                        cmdUpdate.Parameters.AddWithValue("@ReservationID", myPayment.ReservationID);

                        cmdUpdate.ExecuteNonQuery();



                        connBook.Close();
                    }
                    catch (Exception ex)
                    {

                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }

            }
        }

        public int GenerateRandomNo()
        {
            int min = 0000;
            int max = 9999;
            Random rdm = new Random();
            return rdm.Next(min, max);
        }

        
    }
}