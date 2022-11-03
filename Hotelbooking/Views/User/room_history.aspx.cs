using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace Hotelbooking.Views.User
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

                 string useremail = Session["useremail"].ToString();
                SqlDataAdapter sqlda = new SqlDataAdapter("select room_no,book_userid,checkin,checkout,roombook_stat,room_cancprice from room_manag where book_userid=@userid and roombook_stat in ('Pending','Booked') ", con);
                sqlda.SelectCommand.Parameters.AddWithValue("@userid", useremail);

                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                rmbookhis.DataSource = dt;
                rmbookhis.DataBind();

                if (dt.Rows.Count == 0)
                {
                    cancel.Visible = false;
                    nodata.Visible = true;
                }
                else
                {
                    cancel.Visible = false;
                    nodata.Visible = false;
                }
            }
        }

      
          
        

       

      

        

        protected void rmbookhis_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = rmbookhis.SelectedRow.Cells[1].Text;
            HiddenField2.Value = rmbookhis.SelectedRow.Cells[2].Text;
            cancel.Visible = true;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {      
            using (SqlConnection con = new SqlConnection(cs))
            { 
                SqlCommand cmd = new SqlCommand("update room_manag set roombook_stat='Available' where book_userid=@userid and room_no=@roomno", con);
                cmd.Parameters.AddWithValue("@roomno", HiddenField1.Value);
                cmd.Parameters.AddWithValue("@userid", HiddenField2.Value);

                con.Open();
                cmd.ExecuteNonQuery();

                bindgrid();


            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update RoomLogs set ConfirmationStatus='Cancelled',ConfirmedBy=concat(@useremail,'(User)'),ConfirmedOn=getDate()" +
                    "where Id=(select max(Id) from RoomLogs where RoomNo=@RoomNo)", con);
                cmd.Parameters.AddWithValue("@useremail", HiddenField2.Value);
                cmd.Parameters.AddWithValue("@RoomNo",HiddenField1.Value);

                con.Open();
                cmd.ExecuteNonQuery();

            }

        }
    }
}