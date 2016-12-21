using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
namespace WebAppAsg
{
    public partial class SendArrivalEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Session["username"].ToString();
            String password = Session["password"].ToString();
            LINQDataContext dbContext = new LINQDataContext();
            var pass = (from i in dbContext.Drivers
                        where i.username == username && i.password == password
                        select i).FirstOrDefault();
            TextBoxDriverID.Text = pass.DriverID;
            
            Timer1.Enabled = true;

            SqlConnection conBook;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conBook = new SqlConnection(connStr);
            conBook.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select t.TaxiPlateNo,t.VehicleModel,t.VehicleColour, d.Name from Taxi t, Driver d where t.DriverID=d.DriverID and t.DriverID=@driverid";
            cmdSelect = new SqlCommand(strSelect, conBook);
            cmdSelect.Parameters.AddWithValue("@driverid",TextBoxDriverID.Text);

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    TextBoxName.Text=dtr["Name"].ToString();
                    TextBoxTaxiNo.Text=dtr["TaxiPlateNo"].ToString();
                    lblModel.Text = dtr["VehicleModel"].ToString();
                    lblColor.Text = dtr["VehicleColour"].ToString();
                   
                }

            }
            lblDriver.Text = TextBoxName.Text;
            lblTaxiNo.Text = TextBoxTaxiNo.Text;
            dtr.Close();

            string strSelect2;
            SqlCommand cmdSelect2;

            strSelect2 = "Select b.ReservationID,c.CustomerID,c.Name,c.EmailAddress,r.Origin, r.Destination,p.PickUpTime from Reservation b, Customer c,Route r,PickUp p where b.TaxiPlateNo=@TaxiNo and b.CustomerID=c.CustomerID and b.RouteID=r.RouteID and r.RouteID=p.RouteID and p.Status=@status";
            cmdSelect2 = new SqlCommand(strSelect2, conBook);
            cmdSelect2.Parameters.AddWithValue("@status", "Incomplete");
            cmdSelect2.Parameters.AddWithValue("@TaxiNo", TextBoxTaxiNo.Text);

            SqlDataReader dtr2;
            dtr2 = cmdSelect2.ExecuteReader();

            //int minTimeRange;
            //int[] minTimeRange = new int[] {};
            List<int> minTimeRange = new List<int>();
            List<string> list = new List<string>();
            List<string> reservationlist = new List<string>();
            List<string> customerlist = new List<string>();
            List<string> customernamelist = new List<string>();
            List<string> originlist = new List<string>();
            List<string> destinationlist = new List<string>();
            List<string> dateList = new List<string>();
            List<string> emailList = new List<string>();
           
            if (dtr2.HasRows)
            {
                while (dtr2.Read())
                {  

                    DateTime time=(DateTime)dtr2["PickUpTime"];
                    if (time.ToShortDateString() == DateTime.Now.ToShortDateString() && DateTime.Compare(time, DateTime.Now) > 0)
                    {
                        TimeSpan diff = time - DateTime.Now;
                        minTimeRange.Add((int)diff.TotalSeconds);
                      
                        list.Add(time.ToShortTimeString());
                        reservationlist.Add(dtr2["ReservationID"].ToString());
                        customerlist.Add(dtr2["CustomerID"].ToString());
                        customernamelist.Add(dtr2["Name"].ToString());
                        originlist.Add(dtr2["Origin"].ToString());
                        destinationlist.Add(dtr2["Destination"].ToString());
                        dateList.Add(time.ToShortDateString());
                        emailList.Add(dtr2["EmailAddress"].ToString());

                    }
                }

            }
            for (int j = 0; j < minTimeRange.Count;j++)
            {
                if(minTimeRange.Min()==minTimeRange[j])
                {
                    lblReservationID.Text = reservationlist[j];
                    lblCustomerID.Text = customerlist[j];
                    lblCustName.Text = customernamelist[j];
                    lblOrigin.Text = originlist[j];
                    lblDestination.Text = destinationlist[j];
                    lblPickUpDate.Text = dateList[j];
                    lblPickUpTime.Text = list[j];
                    lblEmail.Text = emailList[j];
                  
                }
            }
                

            dtr2.Close();

          conBook.Close();

            if(lblReservationID.Text.CompareTo("")==0)
            {
                btnSend.Enabled = false;
                lblEmail.Visible = true;
                lblEmail.Text = "No available pick up at current time";
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.Now;
            lblTime.Text = dateTime.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress("taxicabsttv@gmail.com");
                Msg.To.Add(lblEmail.Text);
                Msg.Subject = "Arrival Details";
                string str = "Hi <span style='color:blue;'>" + lblCustName.Text + "</span>, the content showed below are the arrival details.<br/>" +
                    "Please be prepared, we are going to fetch you now :D<br/><br/>" +
                    "<table style=\"width:60%\" >" +
                    "<tr><td>Reservation ID</td> <td>:</td>" + "<td>" + lblReservationID.Text + "</td></tr>" +
                    "<tr><td>Customer ID</td> <td>:</td>" + "<td>" + lblCustomerID.Text + "</td></tr>" +
                    "<tr><td>Origin</td> <td>:</td>" + "<td>" + lblOrigin.Text + "</td></tr>" +
                    "<tr><td>Destination</td> <td>:</td>" + "<td>" + lblDestination.Text + "</td></tr>" +
                    "<tr><td>Pick Up Date</td> <td>:</td>" + "<td>" + lblPickUpDate.Text + "</td></tr>" +
                    "<tr><td>Pick Up Time</td> <td>:</td>" + "<td>" + lblPickUpTime.Text + "</td></tr>" +
                    "<tr><td>Your Driver</td> <td>:</td>" + "<td>" + lblDriver.Text + "</td></tr>" +
                    "<tr><td>Taxi Plate Number</td> <td>:</td>" + "<td>" + lblTaxiNo.Text + "</td></tr>" +
                    "<tr><td>Vehicle Model</td> <td>:</td>" + "<td>" + lblModel.Text + "</td></tr>" +
                    "<tr><td>Vehicle Colour</td> <td>:</td>" + "<td>" + lblColor.Text + "</td></tr>" +
                    "</table><br/>From EzCab<br/><br/>";
                Msg.Body = str;
                Msg.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = "taxicabsttv@gmail.com";
                NetworkCred.Password = "taxicabSTTV123";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(Msg);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The email is delivered successfully.')", true);
            }
            catch (SmtpFailedRecipientException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The email is failed to be delivered.')", true);
            }
        }
    }
}