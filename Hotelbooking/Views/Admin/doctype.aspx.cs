using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;

namespace Hotelbooking.Views.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
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

        private void clear()
        {
           
            docname.Text = "";
            stat.SelectedValue = "0";
            minval.Text = "";
            maxval.Text = "";
        }
        private void bindgrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from doctype ", con);
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                docu.DataSource = dt;
                docu.DataBind();

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
        protected void docu_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = docu.SelectedRow.Cells[1].Text;
            docname.Text = docu.SelectedRow.Cells[2].Text;
            stat.SelectedValue = docu.SelectedRow.Cells[3].Text;
            minval.Text = docu.SelectedRow.Cells[4].Text;
            maxval.Text = docu.SelectedRow.Cells[5].Text;

            savebtn.Visible = false;
            editbtn.Visible = true;
            deletebtn.Visible = true;
            cancel.Visible = true;
        }

        protected void editbtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }

            if(docname.Text=="" || stat.SelectedValue=="0" || minval.Text=="" || maxval.Text == "")
            {
                Response.Write("<script>alert('Select an Document to update')</script>");
            }
            else
            {
                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("update doctype set doc_name=@docname,doc_status=@stat,minval=@minval,maxval=@maxval where docid=@docid", con1);

                    cmd1.Parameters.AddWithValue("@docid", HiddenField1.Value);
                    cmd1.Parameters.AddWithValue("@docname", docname.Text);
                    cmd1.Parameters.AddWithValue("@stat", stat.SelectedItem.Value);
                    cmd1.Parameters.AddWithValue("@minval", minval.Text);
                    cmd1.Parameters.AddWithValue("@maxval", maxval.Text);


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

            if (docname.Text == "" || stat.SelectedValue == "0" || minval.Text == "" || maxval.Text == "")
            {
                Response.Write("<script>alert('Select a document to delete')</script>");
            }
            else
            {
                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("delete from doctype where docid=@docid", con1);
                    cmd1.Parameters.AddWithValue("@docid", HiddenField1.Value);


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
            if (docname.Text == "" || stat.SelectedValue == "0" || minval.Text == "" || maxval.Text == "")
            {
                Response.Write("<script>alert('Fill in all the details')</script>");
            }
            else
            {
                using (SqlConnection con1 = new SqlConnection(cs))
                {

                    SqlCommand cmd1 = new SqlCommand("insert into doctype values(@docname,@stat,@minval,@maxval)", con1);
                    cmd1.Parameters.AddWithValue("@docname", docname.Text);
                    cmd1.Parameters.AddWithValue("@stat", stat.SelectedItem.Value);
                    cmd1.Parameters.AddWithValue("@minval", minval.Text);
                    cmd1.Parameters.AddWithValue("@maxval", maxval.Text);
                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();
                    clear();

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