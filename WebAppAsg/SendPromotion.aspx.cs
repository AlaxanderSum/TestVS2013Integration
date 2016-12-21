using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Net.Mail;
using System.Collections;

namespace WebAppAsg
{
    public partial class SendPromotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divReceipient.Visible = false;
            lblEmailAdd.Visible = false;
            lblNotificationID.Visible = false;
            TextAreaReceipient.Value = "";
            lblCustID.Visible = false;

            SqlConnection conBook;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conBook = new SqlConnection(connStr);
            conBook.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "SELECT TOP 1 NotificationID FROM SMSNotification ORDER BY NotificationID DESC";
            cmdSelect = new SqlCommand(strSelect, conBook);
            object o = cmdSelect.ExecuteScalar();
            if (o != null)
            {
                String lastRowCode = o.ToString();
                String substr = lastRowCode.Substring(3, 5);
                int Convertedsubstr = Convert.ToInt32(substr);
                int increCode = Convertedsubstr + 1;
                String automatedCode = "NTF" + String.Format("{0:00000}", increCode);
               lblNotificationID.Text = automatedCode;
              // Session["NotiID"] = lblNotificationID.Text;
                //Session["NotiID"] = automatedCode;
               

            }
            conBook.Close();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (tbxSummary.Text.CompareTo("") == 0)
            {
                lblError.Text = "Please search a promotion ID.";
            }
            else
            {
                lblError.Text = "";
                divReceipient.Visible = true;

                SqlConnection conBook;
                string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                conBook = new SqlConnection(connStr);
                conBook.Open();

                string strSelect;
                SqlCommand cmdSelect;
                strSelect = "Select EmailAddress,CustomerID from Customer";
                cmdSelect = new SqlCommand(strSelect, conBook);

                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();


                if (dtr.HasRows)
                {

                    while (dtr.Read())
                    {
                        TextAreaReceipient.Value += dtr["EmailAddress"].ToString() + "\\\n";
                        lblEmailAdd.Text += dtr["EmailAddress"].ToString() + ";";
                        lblCustID.Text += dtr["CustomerID"].ToString() + ";";
                        
                    }

                }

                conBook.Close();
                dtr.Close();

            }
        }

        protected void btnSendPromo_Click(object sender, EventArgs e)
        {
            int counter = 0;
            foreach (var address in lblCustID.Text.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
            {
                counter++;
            }
            SqlConnection conBook;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conBook = new SqlConnection(connStr);
            conBook.Open();

            List<string> list = new List<string>();
           
            for (int i = 0; i < counter; i++)
            {
                string currentID = lblNotificationID.Text;
                list.Add(currentID);
                String substr = currentID.Substring(3, 5);
                int Convertedsubstr = Convert.ToInt32(substr);
                int increCode = Convertedsubstr + 1;
                String automatedCode = "NTF" + String.Format("{0:00000}", increCode);
                lblNotificationID.Text = automatedCode;
            }
               
            string strInsert;
            SqlCommand cmdInsert;

            string strInsert2;
            SqlCommand cmdInsert2;

            List<string> list2 = new List<string>();

            foreach (var custid in lblCustID.Text.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
            {
                list2.Add(custid);
            }
            for (int i = 0; i < list.Count;i++ )
                {
                    strInsert = "Insert Into SMSNotification (NotificationID, Content, DateCreated,TimeCreated,PromotionID ) Values (@NotificationID, @Content, @DateCreated,@TimeCreated,@PromotionID)";

                    strInsert2 = "Insert Into CustomerNotification (NotificationID, CustomerID,Status) Values (@NotiID2, @CustomerID,@Status)";
            

                    cmdInsert = new SqlCommand(strInsert, conBook);
                    cmdInsert2 = new SqlCommand(strInsert2, conBook);

                    cmdInsert.Parameters.AddWithValue("@NotificationID", list.ElementAt(i));
                    cmdInsert.Parameters.AddWithValue("@Content", tbxSummary.Text + TextAreaDescrip);
                    cmdInsert.Parameters.AddWithValue("@DateCreated", DateTime.Now.Date);
                    cmdInsert.Parameters.AddWithValue("@TimeCreated", DateTime.Now);
                    cmdInsert.Parameters.AddWithValue("@PromotionID", DropDownList1.SelectedValue);

                    cmdInsert2.Parameters.AddWithValue("@NotiID2", list.ElementAt(i));
                    cmdInsert2.Parameters.AddWithValue("@CustomerID", list2.ElementAt(i));
                    cmdInsert2.Parameters.AddWithValue("Status", "Success");

                    cmdInsert.ExecuteNonQuery();
                    cmdInsert2.ExecuteNonQuery(); //insert custpromo
                }

             conBook.Close();
            
            
             MailMessage Msg = new MailMessage();
             Msg.From = new MailAddress("taxicabsttv@gmail.com");
             //Msg.To.Add();
             string addresses = lblEmailAdd.Text;
             foreach (var address in addresses.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
             {
                 Msg.To.Add(address);
             }
             Msg.Subject = tbxSummary.Text;
             Msg.Body = TextAreaDescrip.Value;

             System.Net.Mail.Attachment attachment;
             attachment = new System.Net.Mail.Attachment(Server.MapPath("~/Images/") + "PromotionImage.jpg");
             Msg.Attachments.Add(attachment);

             Msg.IsBodyHtml = true;

             try
             { 
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

             string scriptText = "alert('The email is delivered successfully.'); window.location='" + Request.ApplicationPath + "SendPromotion.aspx"+"'";
             ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
             }
             catch (SmtpFailedRecipientException ex)
             {
               
                 string strUpdate;
                 SqlCommand cmdUpdate;

                 strUpdate = "Update CustomerNotification Set Status=@status where NotificationID=@NotificationID3";

                 cmdUpdate = new SqlCommand(strUpdate, conBook);
                 cmdUpdate.Parameters.AddWithValue("@Status", "Unsucess");
                 cmdUpdate.Parameters.AddWithValue("@NotificationID3", lblNotificationID.Text);

                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The email is failed to be delivered.')", true);
                 // ex.FailedRecipient and ex.GetBaseException() should give you enough info.
             }
           
        }

        protected void btnSearchPromo_Click(object sender, EventArgs e)
        {
            SqlConnection conBook;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conBook = new SqlConnection(connStr);
            conBook.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select Image from Promotion where PromotionID=@Id";
            cmdSelect = new SqlCommand(strSelect, conBook);
            cmdSelect.Parameters.AddWithValue("@Id", DropDownList1.SelectedValue);

            Object o = cmdSelect.ExecuteScalar();
            byte[] bytes = (byte[])o;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            Image1.ImageUrl = "data:image/png;base64," + base64String;

            string filePath = Server.MapPath("~/Images/") + "PromotionImage.jpg";
            File.WriteAllBytes(filePath, Convert.FromBase64String(base64String));

            string strSelect2;
            SqlCommand cmdSelect2;
            strSelect2 = "Select PromotionDescription,PromotionSummary from Promotion where PromotionID=@Id";
            cmdSelect2 = new SqlCommand(strSelect2, conBook);
            cmdSelect2.Parameters.AddWithValue("@Id", DropDownList1.SelectedValue);

            SqlDataReader dtr;
            dtr = cmdSelect2.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                   TextAreaDescrip.Value = dtr["PromotionDescription"].ToString();
                   tbxSummary.Text = dtr["PromotionSummary"].ToString();
                                      
                }

            }


            conBook.Close();


        }
    }
}