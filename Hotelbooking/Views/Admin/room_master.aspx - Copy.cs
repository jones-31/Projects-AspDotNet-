using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking.Views.Admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
           

            if (!IsPostBack)
            {

                cancelprice_val.Visible=false;
                bindgrid();
            }

        }


        private void clear()
        {
            roomno.Text = "";

            
            roomprice.Text = "";
            roomstat.SelectedValue = "0";
            cancelprice.Text = "";
            room_description.Text = "";
        }

        private void bindgrid()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select roomid,roomtype,roomstat from room_type where roomstat='Active'", con);
                con.Open();
                roomtyp.DataSource = cmd.ExecuteReader();

                roomtyp.DataBind();
                roomtyp.Items.Insert(0, "---Select a Room Type---");

            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from room_manag ", con);
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                room_manag.DataSource = dt;
                room_manag.DataBind();
            }

        }

        protected void editbtn_Click(object sender, EventArgs e)
        {
            if (Session["adminemail"] is null)
            {
                Response.Redirect("~/home_page.aspx");
            }
            using (SqlConnection con1 = new SqlConnection(cs))
            {

                string rmprice = roomprice.Text.Trim();
                //rmprice = rmprice.Replace("₹", string.Empty);
                // rmprice = rmprice.Replace(",",string.Empty);
                //int price = Convert.ToInt32(rmprice);

                //string price=Regex.Replace(rmprice, @"[^0-9\._]", string.Empty);


                string rmcprice = cancelprice.Text;
                //rmcprice = rmcprice.Replace("₹", string.Empty);
                //int cancprice = Convert.ToInt32(rmcprice);
                //bool isnumb = int.TryParse(rmcprice, out cancprice);

                if (room_imgpath.PostedFile != null)
                {


                    String Folder = "~/Roomimg/";
                    String serverfolder = Server.MapPath(Folder);

                    if (!Directory.Exists(serverfolder))
                    {

                        Directory.CreateDirectory(serverfolder);
                    }

                    string multifile = "";
                    string dbfilename = "";

                    foreach (HttpPostedFile postfiles in room_imgpath.PostedFiles)
                    {

                        String FileName = Path.GetFileName(Server.MapPath(postfiles.FileName));
                        String serverpath = serverfolder + FileName;

                        postfiles.SaveAs(serverpath);

                        dbfilename += Folder + "" + FileName + ',';
                        //dbfilename += dbfilename + ',';

                        multifile += serverpath + ',';


                    }
                    if (dbfilename != "")
                    {
                        dbfilename = dbfilename.Remove(dbfilename.Length - 1);
                    }
                    if (multifile != "")
                    {
                        multifile = multifile.Remove(multifile.Length - 1);
                    }

                    SqlCommand cmd1 = new SqlCommand("update room_manag set room_typ=@room_type,room_price=@room_price,room_stat=@room_stat, room_cancprice=@room_cancprice,roomimg=@roomimg,room_description=@room_description where room_no=@room_no", con1);


                    cmd1.Parameters.AddWithValue("@room_no", roomno.Text);
                    cmd1.Parameters.AddWithValue("@room_type", roomtyp.SelectedItem.Text);
                    cmd1.Parameters.AddWithValue("@room_price", rmprice);
                    cmd1.Parameters.AddWithValue("@room_stat", roomstat.SelectedItem.Value);
                    cmd1.Parameters.AddWithValue("@room_cancprice", rmcprice);
                    cmd1.Parameters.AddWithValue("@roomimg", dbfilename);
                    cmd1.Parameters.AddWithValue("@room_description", room_description.Text.Trim());


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
            using (SqlConnection con1 = new SqlConnection(cs))
            {

                SqlCommand cmd1 = new SqlCommand("delete from room_manag where room_no=@room_no", con1);
                cmd1.Parameters.AddWithValue("@room_no", roomno.Text);


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
                if (room_imgpath.PostedFile != null)
                {

                    //HttpPostedFile postedFile = room_imgpath.PostedFile;

                    String Folder = "~/Roomimg/";
                        String serverfolder = Server.MapPath(Folder);
                       
                        if (!Directory.Exists(serverfolder))
                        {
                            
                            Directory.CreateDirectory(serverfolder);
                        }

                    string multifile = "";
                    string dbfilename = "";

                    foreach (HttpPostedFile postfiles in room_imgpath.PostedFiles)
                    {

                        //String Test = postfiles.FileName;


                        String FileName = Path.GetFileName(Server.MapPath(postfiles.FileName));
                        string filesave = Folder + FileName;
                        String serverpath = serverfolder + FileName;

                        postfiles.SaveAs(Server.MapPath(filesave));


                        //room_imgpath.SaveAs(Server.MapPath(filesave));



                        dbfilename += Folder + "" + FileName + ',';
                        //dbfilename += dbfilename + ',';

                        multifile += serverpath + ',';


                    }
                    if (dbfilename != "")
                    {
                        dbfilename = dbfilename.Remove(dbfilename.Length - 1);
                    }
                    if (multifile!="")
                    {
                        multifile = multifile.Remove(multifile.Length - 1);
                    }

                    

                    




                    //String FileName = Path.GetFileName(postedFile.FileName);
                    //String serverpath = serverfolder + FileName;
                    //String DBFileName = Folder + "" + FileName;
                    //    room_imgpath.SaveAs(serverpath);

                    
                    //string imgfile = Path.GetFileName(room_imgpath.PostedFile.FileName);
                    //room_imgpath.SaveAs("~/Images/" + imgfile);



                    SqlCommand cmd1 = new SqlCommand("insert into room_manag" + "(room_typ,room_price,room_stat,room_cancprice,roomimg,room_description) values(@room_type,@room_price,@room_stat,@room_cancprice,@roomimg,@room_description)", con1);
                    cmd1.Parameters.AddWithValue("@room_type", roomtyp.SelectedItem.Text);
                    cmd1.Parameters.AddWithValue("@room_price", roomprice.Text);
                    cmd1.Parameters.AddWithValue("@room_stat", roomstat.SelectedItem.Value);
                    cmd1.Parameters.AddWithValue("@room_cancprice", cancelprice.Text);
                    cmd1.Parameters.AddWithValue("@roomimg", dbfilename);
                    cmd1.Parameters.AddWithValue("@room_description", room_description.Text.Trim());

                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    bindgrid();
                    clear();
                }


            }
        }

        protected void room_manag_SelectedIndexChanged(object sender, EventArgs e)
        {
            roomno.Text = room_manag.SelectedRow.Cells[1].Text;
           
            roomtyp.SelectedItem.Text = room_manag.SelectedRow.Cells[2].Text;
            roomprice.Text = room_manag.SelectedRow.Cells[3].Text.Replace("₹","");
            roomprice.Text = roomprice.Text.Replace(" ", "");
            roomprice.Text = roomprice.Text.Replace(",", "");
           

            roomstat.SelectedValue = room_manag.SelectedRow.Cells[4].Text;
            cancelprice.Text = room_manag.SelectedRow.Cells[5].Text.Replace("₹", "");
            cancelprice.Text = cancelprice.Text.Replace(" ", "");
            cancelprice.Text = cancelprice.Text.Replace(",", "");
            room_description.Text=room_manag.SelectedRow.Cells[8].Text;



        }

        protected void cancelprice_TextChanged(object sender, EventArgs e)
        {
            int canc = Convert.ToInt32( cancelprice.Text);
            int room = Convert.ToInt32( roomprice.Text);
            if (canc >= room )
            {
                cancelprice_val.Visible = true;
            }
            else
            {
                cancelprice_val.Visible = false;
            }
        }
    }
}