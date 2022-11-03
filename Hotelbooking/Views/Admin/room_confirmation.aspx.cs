using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Reflection.Emit;
using System.Net.Mail;
using System.Xml.Linq;

namespace Hotelbooking.Views.Admin
{
    public partial class WebForm7 : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                bindgrid();

               
            }
        }


        private void bindgrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

               
                SqlDataAdapter sqlda = new SqlDataAdapter("select room_no,book_userid,checkin,checkout,roombook_stat,room_price,room_cancprice from room_manag where roombook_stat='Pending'", con);
               
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                roomconfirm.DataSource = dt;
                roomconfirm.DataBind();


                if (dt.Rows.Count == 0)
                {
                    approve.Visible = false;
                    cancel.Visible = false;
                    nodata.Visible = true;
                }
                else
                {
                    approve.Visible = true;
                    cancel.Visible = true;
                    nodata.Visible = false;
                }



            }
        }
        protected void roomconfirm_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = roomconfirm.SelectedRow.Cells[1].Text;
        }

        protected void approve_Click(object sender, EventArgs e)
        {
            string adminemail = Session["adminemail"].ToString();
            
            if (HiddenField1.Value != "")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("update RoomLogs set ConfirmationStatus='Approved',ConfirmedBy=concat(@adminemail,'(Admin)'),ConfirmedOn=getDate()" +
                        "where Id=(select max(Id) from RoomLogs where RoomNo=@RoomNo)", con);
                    cmd.Parameters.AddWithValue("@adminemail", adminemail);
                    cmd.Parameters.AddWithValue("@RoomNo", HiddenField1.Value);

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string rooomno = roomconfirm.SelectedRow.Cells[1].Text;
                    string uem = roomconfirm.SelectedRow.Cells[2].Text;
                    string checkin = roomconfirm.SelectedRow.Cells[3].Text;
                    string checkout = roomconfirm.SelectedRow.Cells[4].Text;
                    string roomprice = roomconfirm.SelectedRow.Cells[6].Text;
                    //string roomcanc = roomconfirm.SelectedRow.Cells[7].Text;


                    SqlCommand cmd = new SqlCommand("update room_manag set roombook_stat='Booked' where room_no=@roomno", con);
                    cmd.Parameters.AddWithValue("@roomno", HiddenField1.Value);


                    con.Open();
                    cmd.ExecuteNonQuery();

                    bindgrid();

                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress("jones.goldmedalindia@gmail.com");
                        mail.To.Add(uem);
                        mail.Subject = "HOYO Room Booking Confirmation";

                        mail.Body = " <h1 style='font-family:sans-serif'> <ins>Hello " + uem + " your Booking has been confirmed</ins> </h1><br /><h3 style='font-family:cursive'><i>Your booking for the <span class='badge alert-dark' style='font-size:large;color:#1221a3'>Room No." + rooomno + "</span> has been confirmed , </i><br /><i>your booking duration is from <span class='badge alert-info' style='font-size:large;color:#1221a3'><ins>" + checkin + "</ins></span> to <span class='badge alert-info' style='font-size:large;color:#1221a3'><ins>" + checkout + "</ins></span></i><br/><i>and your boooking cost is <span class='badge alert-success'style='font-size:large'>" + roomprice + "</span></i></h3><br/><h3 style='font-family:cursive;color:purple'><i>Regards Admin.</i></h3>";
                        mail.IsBodyHtml = true;


                        SmtpClient smtp = new SmtpClient();
                        smtp.Send(mail);
                        Response.Write("<script>alert('Confirmation Email has been sent to the customer')</script");
                    }

                }
            }
            else
            {
                Response.Write("<script>alert('Please select an id to approve the room booking')</script");
            }
          


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            string adminemail = Session["adminemail"].ToString();
            if (HiddenField1.Value != "")
            {

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("update RoomLogs set ConfirmationStatus='Cancelled',ConfirmedBy=concat(@adminemail,'(Admin)'),ConfirmedOn=getDate()" +
                        "where Id=(select max(Id) from RoomLogs where RoomNo=@RoomNo)", con);
                    cmd.Parameters.AddWithValue("@adminemail",adminemail);
                    cmd.Parameters.AddWithValue("@RoomNo", HiddenField1.Value);

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
                using (SqlConnection con = new SqlConnection(cs))
                {


                    SqlCommand cmd = new SqlCommand("update room_manag set roombook_stat='Available' where room_no=@roomno", con);
                    cmd.Parameters.AddWithValue("@roomno", HiddenField1.Value);


                    con.Open();
                    cmd.ExecuteNonQuery();

                    bindgrid();


                }

            }
            else
            {
                Response.Write("<script>alert('Please select an id to cancel the room request')</script");
            }

               
        }
    }
}