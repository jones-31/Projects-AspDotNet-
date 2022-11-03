using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking.Views.Admin
{
    public partial class WebForm8 : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            bindgrid();
        }

        private void bindgrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter cmd = new SqlDataAdapter("select user_email,first_name,user_type,user_status,req from useradmin where req=1 and user_type='User' ", con);
                DataTable dt = new DataTable();
                cmd.Fill(dt);
                reqadmin.DataSource = dt;
                reqadmin.DataBind();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label2.Text = reqadmin.SelectedRow.Cells[1].Text;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update useradmin set req=0 where user_email=@useremail and req=1", con);
                cmd.Parameters.AddWithValue("@useremail",Label2.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                bindgrid();
               

            }
        }

        protected void approve_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update useradmin set user_type='Admin',req=0 where user_email=@useremail and req=1", con);
                cmd.Parameters.AddWithValue("@useremail", Label2.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                bindgrid();


            }
        }
    }
}