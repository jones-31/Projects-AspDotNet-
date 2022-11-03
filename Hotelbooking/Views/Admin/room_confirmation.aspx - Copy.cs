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

               
                SqlDataAdapter sqlda = new SqlDataAdapter("select room_no,book_userid,checkin,checkout,roombook_stat from room_manag where roombook_stat='Pending'", con);
               
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                roomconfirm.DataSource = dt;
                roomconfirm.DataBind();
            }
        }
        protected void roomconfirm_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = roomconfirm.SelectedRow.Cells[1].Text;
        }

        protected void approve_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {


                SqlCommand cmd = new SqlCommand("update room_manag set roombook_stat='Booked' where room_no=@roomno", con);
                cmd.Parameters.AddWithValue("@roomno", Label1.Text);
              

                con.Open();
                cmd.ExecuteNonQuery();

                bindgrid();


            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {


                SqlCommand cmd = new SqlCommand("update room_manag set roombook_stat='Available' where room_no=@roomno", con);
                cmd.Parameters.AddWithValue("@roomno", Label1.Text);
               

                con.Open();
                cmd.ExecuteNonQuery();

                bindgrid();


            }
        }
    }
}