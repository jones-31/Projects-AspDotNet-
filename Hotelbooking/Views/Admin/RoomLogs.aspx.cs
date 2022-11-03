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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataFillGrid();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select distinct(RoomNo) as RoomNo from RoomLogs", con);
                    con.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, "Select All");
                    //DropDownList1.DataTextField = RoomNo;
                    //DropDownList1.DataValueField = Id;

                }
            }
           
        }

        private void DataFillGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
               
               
                SqlDataAdapter sda = new SqlDataAdapter("select * from RoomLogs", con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource=ds;
                GridView1.DataBind();
              
            }
           
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string i = DropDownList1.SelectedItem.Value;
            string j = DropDownList1.SelectedItem.Text;
            string k = DropDownList1.SelectedValue;
            int l = DropDownList1.SelectedIndex;
            if (DropDownList1.SelectedItem.Text == "Select All")
            {
                DataFillGrid();
            }
            else
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlDataAdapter cmd = new SqlDataAdapter("Select * from RoomLogs where RoomNo=@RoomNo", con);
                    cmd.SelectCommand.Parameters.AddWithValue("@RoomNo", DropDownList1.SelectedItem.Text);
                    //cmd.Parameters.AddWithValue("@RoomNo", DropDownList1.SelectedItem.Text);
                    DataTable dt = new DataTable();
                    cmd.Fill(dt);
                    
                    con.Open();

                    GridView1.DataSource = dt;
                    GridView1.DataBind();


                }
            }
        }
    }
}