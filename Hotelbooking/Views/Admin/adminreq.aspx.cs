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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = reqadmin.SelectedRow.Cells[1].Text;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {

            if (HiddenField1.Value == "")
            {
                Response.Write("<script>alert('Please select a User to cancel the request')</script>");
            }
            else
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("update useradmin set req=0 where user_email=@useremail and req=1", con);
                    cmd.Parameters.AddWithValue("@useremail", HiddenField1.Value);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    bindgrid();


                }
            }
           
        }

        protected void approve_Click(object sender, EventArgs e)
        {
            if (HiddenField1.Value == "")
            {
                Response.Write("<script>alert('Please select a User to approve')</script>");
            }
            else
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("update useradmin set user_type='Admin',req=0 where user_email=@useremail and req=1", con);
                    cmd.Parameters.AddWithValue("@useremail", HiddenField1.Value);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    bindgrid();


                }
            }
           
        }
    }
}