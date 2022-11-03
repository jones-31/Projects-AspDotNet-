using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.SessionState;
using System.Web.Management;
using System.Net.Mail;
using System.Reflection.Emit;
using System.Drawing;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web.Services.Description;

namespace Hotelbooking
{
    public partial class registration : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //+'~' + minval + '~' + maxval
                Lbldocval.Visible = false;
                //string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select doc_name,doc_status,concat(docid,'~',minval,'~',maxval) as docno from doctype where doc_status='Active' ", con);
                    con.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();

                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, "---Select a Document---");
                   
                        
                    

                }
            }


        }

        protected void login_home_Click(object sender, EventArgs e)
        {
            Response.Redirect("home_page.aspx");
        }

        protected void register_btn_Click(object sender, EventArgs e)
        {

            //using (SqlConnection con = new SqlConnection(cs))
            //{
            //    SqlDataAdapter sqlda = new SqlDataAdapter("select * from doctype ", con);
            //    DataTable dt = new DataTable();
            //    sqlda.Fill(dt);
            //    DropDownList1.DataSource = dt;
            //    DropDownList1.DataBind();
            //}
            //-----------------------------------------------------------------------






            HttpPostedFile postedFile = docufile.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string file_extension = Path.GetExtension(postedFile.FileName);
            if (!docufile.HasFile)
            {
                Lbldocval.Visible = true;
                Lbldocval.Text = "Please upload documents";
            }

            else if (file_extension.ToLower() == ".jpg" || file_extension.ToLower() == ".bmp" || file_extension.ToLower() == ".gif"
                || file_extension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryreader = new BinaryReader(stream);
                byte[] bytes = binaryreader.ReadBytes((int)stream.Length);

                using (SqlConnection con = new SqlConnection(cs))
                {


                    string[] demo = DropDownList1.SelectedValue.Split('~');
                    docmin.Text = demo[1];
                    docmax.Text = demo[2];

                    int docmin1 = Convert.ToInt32(docmin.Text);
                    int docmax1 = Convert.ToInt32(docmax.Text);
                    string docnu = user_docno.Text.Trim();

                    //&& (docnu.Length >= docmax1)
                    if ((docnu.Length >= docmin1) && (docnu.Length <= docmax1))
                    {
                        docnu_val.Visible = false;

                        SqlCommand cmd = new SqlCommand("upload_doctbl", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emid", user_emailid.Text.Trim());
                        cmd.Parameters.AddWithValue("@docname", filename);
                        cmd.Parameters.AddWithValue("@doc_number", user_docno.Text.Trim());
                        cmd.Parameters.AddWithValue("@docimage", bytes);
                        cmd.Parameters.AddWithValue("@doctype", DropDownList1.SelectedItem.Text);
                        con.Open();


                        cmd.ExecuteNonQuery();




                        using (SqlConnection con1 = new SqlConnection(cs))
                        {


                            string uem = user_emailid.Text.Trim();
                            uem = uem.ToLower();

                            SqlCommand cmd1 = new SqlCommand("insert into useradmin" + "(user_email,user_password,mobile_no,first_name,last_name,user_address) values(@email,@password,@mobile,@fname,@lname,@address)", con1);

                            cmd1.Parameters.AddWithValue("@email", user_emailid.Text);
                            cmd1.Parameters.AddWithValue("@password", user_password.Text);
                            cmd1.Parameters.AddWithValue("@mobile", phoneno.Text);
                            cmd1.Parameters.AddWithValue("@fname", fname.Text);
                            cmd1.Parameters.AddWithValue("@lname", lname.Text);
                            cmd1.Parameters.AddWithValue("@address", addr.Text);


                            con1.Open();
                            cmd1.ExecuteNonQuery();


                            user_emailid.Text = "";
                            user_password.Text = "";
                            phoneno.Text = "";
                            addr.Text = "";
                            fname.Text = "";
                            DropDownList1.SelectedIndex = 0;
                            lname.Text = "";
                            

                            using (MailMessage mail = new MailMessage())
                            {
                                mail.From = new MailAddress("jones.goldmedalindia@gmail.com");
                                mail.To.Add(uem);
                                mail.Subject = "Congrats HOYO registration successfully done ";
                               
                                mail.Body = " <h1 style='font-family:sans-serif'>Welcome to <ins>Hoyo</ins> a place where you can find the best rooms for your stay</h1>"+
       "<br/>"+
        "<h3><i> Thank you for registering yourself with us, now you can avail the best services offered by our hotel </i><br/>"+
          "<i>Login to your account and view our exciting offers </i></h3>"+
           "<br/><h3 style='font-family:cursive;color:purple'><i>Regards Admin.</i></h3>";
                                mail.IsBodyHtml = true;


                                SmtpClient smtp = new SmtpClient();
                                smtp.Send(mail);
                                Response.Write("<script>alert('Registered successfully go back to login')</script");
                            }

                           

                        }
                    }

                    else
                    {

                        docnu_val.Visible = true;
                        docnu_val.Text = "Document number shoould be between " +" "+ docmin1 +" "+ "and"+" " + docmax1;
                    
                    }





                }





                Lbldocval.Visible = false;

            }
            else
            {
                Lbldocval.Visible = false;
                Lbldocval.Visible = true;
                Lbldocval.Text = "Only {.jpg , .png , .bmp , .gif} can be uploaded";
            }
        }

      

        protected void user_emailid_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("validate_email", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", user_emailid.Text.Trim());
                cmd.Parameters.Add("@result", SqlDbType.VarChar, 255);
                cmd.Parameters["@result"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                string msg = cmd.Parameters["@result"].Value.ToString();
                emidval.Text = msg;
                if (msg.Length >= 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert(msg);", true);
                }

            }

        }

        protected void phoneno_TextChanged1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("validate_phone", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@phone", phoneno.Text.Trim());
                cmd.Parameters.Add("@result", SqlDbType.VarChar, 255);
                cmd.Parameters["@result"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                string msg1 = cmd.Parameters["@result"].Value.ToString();
                mobileval.Text = msg1;
                if (msg1.Length >= 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert(msg1);", true);
                }

            }
        }

        protected void user_docno_TextChanged(object sender, EventArgs e)
        {
            string[] demo = DropDownList1.SelectedValue.Split('~');
            docmin.Text = demo[1];
            docmax.Text = demo[2];


            int docmin1 = Convert.ToInt32(docmin.Text);
            int docmax1 = Convert.ToInt32(docmax.Text);
            string docnu = user_docno.Text.Trim();

            if ((docnu.Length >= docmin1) && (docnu.Length <= docmax1))
            {
                docnu_val.Visible = false;
            }
            else
            {

                docnu_val.Visible = true;
                docnu_val.Text = "Document number shoould be between " + " " + docmin1 + " " + "and" + " " + docmax1;

            }

        }
    }
}