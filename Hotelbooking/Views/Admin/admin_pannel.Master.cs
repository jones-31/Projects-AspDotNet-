using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking.Views.Admin
{
    public partial class admin_pannel : System.Web.UI.MasterPage
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["adminemail"] == null)
            {
                Response.Redirect("~/home_page.aspx");
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminemail"]!= null)
            {
                Label1.Text = Session["adminemail"].ToString();
            }
        }


        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session.Remove("adminemail");
            Response.Redirect("../../home_page.aspx");
        }
    }
}