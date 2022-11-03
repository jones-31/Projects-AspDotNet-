using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking.Views.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();

                editbtn.Visible = false;
                deletebtn.Visible = false;
                cancel.Visible = false;
            }
        }

        private void bindgrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from useradmin where user_type='User' ", con);
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                userview.DataSource = dt;
                userview.DataBind();

                if (dt.Rows.Count == 0)
                {
                    savebtn.Visible = false;
                    editbtn.Visible = false;
                    deletebtn.Visible = false;
                    nodata.Visible = true;
                }
                else
                {
                    savebtn.Visible = true;
                    editbtn.Visible = false;
                    deletebtn.Visible = false;
                    cancel.Visible = false;
                    nodata.Visible = false;
                }
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
            stat.SelectedValue="0";

        }
        protected void editbtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }

            if (fname.Text == "" || lname.Text == "" || user_emailid.Text == "" || phoneno.Text == "" || user_password.Text == "" || addr.Text == "" || stat.SelectedValue == "0" )
            {
                Response.Write("<script>alert('Fill in all the details')</script>");
            }
            else
            {

                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("update useradmin set user_email=@email,user_password=@password,mobile_no=@mobile,first_name=@fname,last_name=@lname,user_address=@address,user_status=@stat where user_email=@email", con1);

                    cmd1.Parameters.AddWithValue("@email", user_emailid.Text);
                    cmd1.Parameters.AddWithValue("@password", user_password.Text);
                    cmd1.Parameters.AddWithValue("@mobile", phoneno.Text);
                    cmd1.Parameters.AddWithValue("@fname", fname.Text);
                    cmd1.Parameters.AddWithValue("@lname", lname.Text);
                    cmd1.Parameters.AddWithValue("@address", addr.Text);
                    cmd1.Parameters.AddWithValue("@stat", stat.SelectedItem.Text);


                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();

                    clear();
                }
            }

           

        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }

            if (fname.Text == "" || lname.Text == "" || user_emailid.Text == "" || phoneno.Text == "" || user_password.Text == "" || addr.Text == "" || stat.SelectedValue == "0")
            {
                Response.Write("<script>alert('Select an Id')</script>");
            }
            else
            {
                using (SqlConnection con1 = new SqlConnection(cs))
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

        protected void savebtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }

            if (fname.Text == "" || lname.Text == "" || user_emailid.Text == "" || phoneno.Text == "" || user_password.Text == "" || addr.Text == "" || stat.SelectedValue == "0")
            {
                Response.Write("<script>alert('Fill in all the details')</script>");
            }
            else
            {
                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("insert into useradmin" + "(user_email,user_password,mobile_no,first_name,last_name,user_address,user_type,user_status) values(@email,@password,@mobile,@fname,@lname,@address,'User',@stat)", con1);

                    cmd1.Parameters.AddWithValue("@email", user_emailid.Text);
                    cmd1.Parameters.AddWithValue("@password", user_password.Text);
                    cmd1.Parameters.AddWithValue("@mobile", phoneno.Text);
                    cmd1.Parameters.AddWithValue("@fname", fname.Text);
                    cmd1.Parameters.AddWithValue("@lname", lname.Text);
                    cmd1.Parameters.AddWithValue("@address", addr.Text);
                    cmd1.Parameters.AddWithValue("@stat",stat.SelectedItem.Text);

                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();


                    clear();


                }
            }
           

        }

        protected void userview_SelectedIndexChanged(object sender, EventArgs e)
        {
            user_emailid.Text = userview.SelectedRow.Cells[1].Text;
            user_password.Text = userview.SelectedRow.Cells[2].Text;
            phoneno.Text = userview.SelectedRow.Cells[3].Text;
            fname.Text = userview.SelectedRow.Cells[4].Text;
            addr.Text = userview.SelectedRow.Cells[6].Text;
            lname.Text = userview.SelectedRow.Cells[5].Text;
            stat.SelectedValue = userview.SelectedRow.Cells[8].Text;

            savebtn.Visible = false;
            editbtn.Visible = true;
            deletebtn.Visible = true;
            cancel.Visible = true;
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

        protected void cancel_Click(object sender, EventArgs e)
        {
            clear();
            savebtn.Visible = true;
            editbtn.Visible = false;
            deletebtn.Visible = false;
            cancel.Visible = false;
        }
    }
}