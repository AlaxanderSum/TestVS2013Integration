using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebAppAsg
{
    public partial class AddPromotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conBook;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conBook = new SqlConnection(connStr);
            conBook.Open();
          
            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "SELECT TOP 1 PromotionID FROM Promotion ORDER BY PromotionID DESC";
            cmdSelect = new SqlCommand(strSelect, conBook);
            object o= cmdSelect.ExecuteScalar();
            if(o!=null)
            {
                String lastRowCode=o.ToString();
                String substr = lastRowCode.Substring(2, 5);
                int Convertedsubstr = Convert.ToInt32(substr);
                int increCode = Convertedsubstr+1;
                String automatedCode = "PR" + String.Format("{0:00000}", increCode);
                txtPromotionID.Text = automatedCode;
                
            }
            txtImage.Enabled = false;
            

        }
        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                Session["Image"] = FileUpload1.PostedFile;
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
                lblStatus.Text = "";
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null)
            {
                try
                {
                    Session["Image"] = FileUpload1.PostedFile;
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    txtImage.Text = fileName;
                    //Save files to images folder
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                    this.Image1.ImageUrl = "~/Images/" + fileName;
                    lblStatus.Text = "";
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            FileUpload1.Attributes.Clear();
            Image1.ImageUrl = null;
            lblStatus.Text = "";
            txtImage.Text = "";
            txtSummary.Text = "";
            TextAreaDescrip.Value = "";

        }


        protected void btnCreate_Click(object sender, EventArgs e)
        {
            // FileUpload1 = (FileUpload)Session["Image"];

            HttpPostedFile postedFile = (HttpPostedFile)Session["Image"];
            if (postedFile != null)
            {
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);

                int fileSize = postedFile.ContentLength;
                byte[] imgarray = new byte[fileSize];

                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {

                    postedFile.InputStream.Read(imgarray, 0, fileSize);

                    SqlConnection conBook;
                    string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                    conBook = new SqlConnection(connStr);
                    conBook.Open();

                    string strInsert;
                    SqlCommand cmdInsert;
                    strInsert = "Insert Into Promotion (PromotionID,PromotionDescription,PromotionSummary, Image,PromotionStatus,StaffID ) Values (@Id,@description,@summary, @Image,@promostatus,@staffid )";

                    cmdInsert = new SqlCommand(strInsert, conBook);

                    cmdInsert.Parameters.AddWithValue("@Id", txtPromotionID.Text);
                    cmdInsert.Parameters.AddWithValue("@description", TextAreaDescrip.Value);
                    cmdInsert.Parameters.AddWithValue("@summary", txtSummary.Text);
                    cmdInsert.Parameters.AddWithValue("@Image", SqlDbType.Image).Value = imgarray;
                    cmdInsert.Parameters.AddWithValue("@promostatus", 'Y');
                    cmdInsert.Parameters.AddWithValue("@staffid", "ST001");

                    /*Step 3: Execute command to insert*/
                    int n = cmdInsert.ExecuteNonQuery();
                    if (n > 0)
                    {
                        string scriptText = "alert('New Promotion Successfully Added!'); window.location='" + Request.ApplicationPath + "AddPromotion.aspx" + "'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                    }


                }

                else
                {
                    lblStatus.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                }

            }
            else
            {
                lblStatus.Text = "Please choose a promotion image.";
            }
        }
        
    }
}