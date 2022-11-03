using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotelbooking
{
    public partial class admin_panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            //try
            //{
            if (radioadmin.Checked)
            {
                string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {



                    con.Open();
                    SqlCommand lcmd = new SqlCommand("select count(*) from useradmin where user_email = '" + user_emailid.Text + "' and user_password = '" + user_password.Text + "' and user_type = '"+ radioadmin.Text+"' and user_status='Active' ", con);
                    SqlDataAdapter sda = new SqlDataAdapter(lcmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lcmd.ExecuteNonQuery();
                    if (dt.Rows[0][0].ToString() == "1")
                    {
                        Session["adminemail"] = user_emailid.Text.Trim();
                        Response.Redirect("Views/Admin/admin_type.aspx");

                    }
                    else
                    {
                        Response.Write("<script>alert('Error login please enter valid credentials')</script");
                    }


                }
            }
            else
            {
                string cs1 = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
                using (SqlConnection con1 = new SqlConnection(cs1))
                {



                    con1.Open();
                    SqlCommand lcmd1 = new SqlCommand("select count(*) from useradmin where user_email = '" + user_emailid.Text + "' and user_password = '" + user_password.Text + "' and user_type = '"+ radiouser.Text+ "' and user_status='Active' ", con1);
                    SqlDataAdapter sda1 = new SqlDataAdapter(lcmd1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    lcmd1.ExecuteNonQuery();
                    if (dt1.Rows[0][0].ToString() == "1")
                    {
                        Session["useremail"] = user_emailid.Text;
                        Response.Redirect("Views/User/room_booking.aspx");

                    }
                    else
                    {
                        Response.Write("<script>alert('Error login please enter valid credentials')</script");
                    }


                }
            }

            



            //}
            //catch
            //{
            //}

        }
    }

}


    
