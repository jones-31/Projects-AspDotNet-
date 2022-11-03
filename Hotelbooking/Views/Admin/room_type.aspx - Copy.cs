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
    public partial class WebForm2 : System.Web.UI.Page
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
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("select roomid,roomtype,roomdes,roomstat from room_type ", con);
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                docu.DataSource = dt;
                docu.DataBind();
            }
        }
        private void clear()
        {
            roomid.Text = "";
            roomdes.Text = "";
            roomtype.Text = "";
            roomstat.SelectedValue = "0";
        }
        protected void docu_SelectedIndexChanged(object sender, EventArgs e)
        {
            roomid.Text = docu.SelectedRow.Cells[1].Text;
            roomtype.Text = docu.SelectedRow.Cells[2].Text;
            roomdes.Text = docu.SelectedRow.Cells[3].Text;
            roomstat.SelectedValue = docu.SelectedRow.Cells[4].Text;
        }

        protected void editbtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }
            using (SqlConnection con1 = new SqlConnection(cs))
            {

                SqlCommand cmd1 = new SqlCommand("update room_type set roomtype=@roomtype,roomdes=@roomdes,roomstat=@roomstat where roomid=@roomid", con1);

                cmd1.Parameters.AddWithValue("@roomid", roomid.Text);
                cmd1.Parameters.AddWithValue("@roomtype", roomtype.Text);
                cmd1.Parameters.AddWithValue("@roomdes", roomdes.Text);
                cmd1.Parameters.AddWithValue("@roomstat", roomstat.SelectedItem.Value);


                con1.Open();
                cmd1.ExecuteNonQuery();
                bindgrid();

                clear();
            }
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }
            using (SqlConnection con1 = new SqlConnection(cs))
            {

                SqlCommand cmd1 = new SqlCommand("delete from room_type where roomid=@roomid", con1);
                cmd1.Parameters.AddWithValue("@roomid", roomid.Text);


                con1.Open();
                cmd1.ExecuteNonQuery();
                bindgrid();
                clear();


            }
        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }
            using (SqlConnection con1 = new SqlConnection(cs))
            {

                SqlCommand cmd1 = new SqlCommand("insert into room_type values(@roomtype,@roomdes,@roomstat)", con1);
                cmd1.Parameters.AddWithValue("@roomtype", roomtype.Text);
                cmd1.Parameters.AddWithValue("@roomdes", roomdes.Text);
                cmd1.Parameters.AddWithValue("@roomstat", roomstat.SelectedItem.Value);

                con1.Open();
                cmd1.ExecuteNonQuery();
                bindgrid();
                clear();


            }
        }
    }
    
}