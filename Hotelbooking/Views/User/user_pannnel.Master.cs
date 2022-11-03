using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking.Views.User
{
    public partial class user_pannnel : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["useremail"] == null)
            {
                Response.Redirect("~/home_page.aspx");
            }
        }


        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["useremail"] != null)
            {
                Label1.Text = Session["useremail"].ToString();
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                string useremail = Session["useremail"].ToString();
                SqlCommand cmd = new SqlCommand("select count(req) from useradmin where user_email=@useremail and req=1", con);
                cmd.Parameters.AddWithValue("@useremail", useremail);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                cmd.ExecuteNonQuery();
                if (dt.Rows[0][0].ToString() == "1")
                {

                    adminreq.Text = "Requested";

                }
               

            }
        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../../home_page.aspx");
        }

        protected void adminreq_Click(object sender, EventArgs e)
        {
            string useremail = Session["useremail"].ToString();
            adminreq.Text = "Requested";
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update useradmin set req=1 where user_email=@useremail", con);
                cmd.Parameters.AddWithValue("@useremail", useremail);
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }
    }
}