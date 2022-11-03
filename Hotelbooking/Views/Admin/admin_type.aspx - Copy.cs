using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Hotelbooking.Views.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }
        }
        private void bindgrid()
        {
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from useradmin where user_type='Admin' ", con);
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                adminview.DataSource=dt;
                adminview.DataBind();
            }
        }

        private void clear()
        {
            user_emailid.Text = "";
            user_password.Text = "";
            phoneno.Text = "";
            fname.Text = "";
            addr.Text = "";
            lname.Text = "";
            stat.SelectedValue = "0";
            type.SelectedValue = "0";
        }
        protected void savebtn_Click(object sender, EventArgs e)
        {

            //try
            //{
            if (fname.Text == "" || lname.Text == "" || user_emailid.Text == "" || phoneno.Text == "" || user_password.Text == "" || addr.Text == "")
            {
                Response.Write("<script>alert('Fill in all the details')</script>");
            }
            else
            {
                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("insert into useradmin" + "(user_email,user_password,mobile_no,first_name,last_name,user_address,user_type,user_status) values(@email,@password,@mobile,@fname,@lname,@address,@type,@stat)", con1);

                    cmd1.Parameters.AddWithValue("@email", user_emailid.Text);
                    cmd1.Parameters.AddWithValue("@password", user_password.Text);
                    cmd1.Parameters.AddWithValue("@mobile", phoneno.Text);
                    cmd1.Parameters.AddWithValue("@fname", fname.Text);
                    cmd1.Parameters.AddWithValue("@lname", lname.Text);
                    cmd1.Parameters.AddWithValue("@address", addr.Text);
                    cmd1.Parameters.AddWithValue("@stat", stat.SelectedItem.Value);
                    cmd1.Parameters.AddWithValue("@type", type.SelectedItem.Value);


                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();


                    clear();



                }
            }
           
            //}
            //catch()
            //{
                

            //}
           
        }

        protected void editbtn_Click(object sender, EventArgs e)
        {

            if (fname.Text == "" || lname.Text == "" || user_emailid.Text == "" || phoneno.Text == "" || user_password.Text == "" || addr.Text == "")
            {
                Response.Write("<script>alert('Fill in all the details')</script>");
            }
            else
            {

                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("update useradmin set user_email=@email,user_password=@password,mobile_no=@mobile,first_name=@fname,last_name=@lname,user_address=@address,user_status=@stat,user_type=@type where user_email=@email", con1);

                    cmd1.Parameters.AddWithValue("@email", user_emailid.Text);
                    cmd1.Parameters.AddWithValue("@password", user_password.Text);
                    cmd1.Parameters.AddWithValue("@mobile", phoneno.Text);
                    cmd1.Parameters.AddWithValue("@fname", fname.Text);
                    cmd1.Parameters.AddWithValue("@lname", lname.Text);
                    cmd1.Parameters.AddWithValue("@address", addr.Text);
                    cmd1.Parameters.AddWithValue("@stat", stat.SelectedItem.Value);
                    cmd1.Parameters.AddWithValue("@type", type.SelectedItem.Value);

                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();

                    clear();
                }

            }
           
        }

        protected void adminview_SelectedIndexChanged(object sender, EventArgs e)
        {
            user_emailid.Text = adminview.SelectedRow.Cells[1].Text;
            user_password.Text = adminview.SelectedRow.Cells[2].Text;
            phoneno.Text = adminview.SelectedRow.Cells[3].Text;
            fname.Text = adminview.SelectedRow.Cells[4].Text;
            addr.Text = adminview.SelectedRow.Cells[5].Text;
            lname.Text = adminview.SelectedRow.Cells[6].Text;
            stat.SelectedItem.Text = adminview.SelectedRow.Cells[7].Text;
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con1 = new SqlConnection(cs))
            {

                if (fname.Text == "" || lname.Text == "" || user_emailid.Text == "" || phoneno.Text == "" || user_password.Text == "" || addr.Text == "")
                {
                    Response.Write("<script>alert('Select an Id')</script>");
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("delete from useradmin where user_email=@email", con1);
                    cmd1.Parameters.AddWithValue("@email", user_emailid.Text);


                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();

                    clear();

                }

               


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

        protected void phoneno_TextChanged(object sender, EventArgs e)
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
    }

    
}