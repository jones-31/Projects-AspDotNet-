using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking
{
    public partial class dummy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("jones.goldmedalindia@gmail.com");
                mail.To.Add("jonesvimal311@gmail.com");
                mail.Subject = "Test";
                mail.Body = "<h1>Aise hi bheja h</h1>";
                mail.IsBodyHtml = true;


                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                label1.Text = "Email sent";
            }
        }
        
    }
}