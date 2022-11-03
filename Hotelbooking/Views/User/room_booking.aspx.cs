using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotelbooking.Views.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                roomcheck();
            }

                using (SqlConnection con = new SqlConnection(cs))
                {

                    roomcheck();
                //and roombook_stat = 'Available'

                    SqlDataAdapter sda = new SqlDataAdapter("select room_no,room_typ,room_stat,roombook_stat,room_price," +
                        "room_cancprice,roomimg from room_manag" +
                        " where room_stat='Active'", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    int counts = dt.Rows.Count;

                    if (counts > 0)
                    {
                        System.Web.UI.UpdatePanel updatePanel = new System.Web.UI.UpdatePanel();

                        System.Web.UI.HtmlControls.HtmlGenericControl Container = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        Container.Attributes.Add("class", "container-fluid");
                        Container.Attributes.Add("style", "border-radius: 10px;background-color:rgba(0, 0, 0, 0.07);margin-bottom:10px;padding:5px;text-align:left;font-size:10px;");

                        System.Web.UI.HtmlControls.HtmlGenericControl Row = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        Row.Attributes.Add("class", "row");
                        Row.Attributes.Add("style", "padding:10px;");

                        superDiv.Controls.Add(updatePanel);
                        updatePanel.Controls[0].Controls.Add(Container);
                        Container.Controls.Add(Row);

                        for (int j = 0; j < counts; j++)
                        {
                            System.Web.UI.HtmlControls.HtmlGenericControl Col = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                            Col.Attributes.Add("class", "col");
                            Col.Attributes.Add("style", "float:left;margin-bottom:50px;");


                            System.Web.UI.HtmlControls.HtmlGenericControl Card = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                            Card.Attributes.Add("class", "card md-3");
                            Card.Attributes.Add("style", "padding:10px;width: 16rem;margin:20px;");

                            Image Img = new Image();
                            Img.Attributes.Add("class", "card-img-top img-fluid");
                            Img.Attributes.Add("style", "height:250px;width:250px;");


                            System.Web.UI.HtmlControls.HtmlGenericControl CardBody = new System.Web.UI.HtmlControls.HtmlGenericControl("Div");
                            CardBody.Attributes.Add("class", "card-body");


                            System.Web.UI.HtmlControls.HtmlGenericControl CardTitle = new System.Web.UI.HtmlControls.HtmlGenericControl("H3");
                            CardTitle.Attributes.Add("style", "color:grey;");
                            CardTitle.Attributes.Add("id", "roomnumber");



                            System.Web.UI.HtmlControls.HtmlGenericControl Discription = new System.Web.UI.HtmlControls.HtmlGenericControl("H5");
                            Discription.Attributes.Add("style", "color:grey;");

                        System.Web.UI.HtmlControls.HtmlGenericControl stats = new System.Web.UI.HtmlControls.HtmlGenericControl("H6");
                        string roombookstats = dt.Rows[j]["roombook_stat"].ToString();
                        if(roombookstats == "Available")
                        {
                            stats.Attributes.Add("style", "color:green;");
                        }
                        else if(roombookstats == "Pending")
                        {
                            stats.Attributes.Add("style", "color:red;");
                        }
                        else
                        {
                            stats.Attributes.Add("style", "color:blue;");
                        }
                      

                        Button btnBook = new Button();
                           
                           
                        if (roombookstats=="Booked"|| roombookstats=="Pending")
                        {
                            btnBook.Text = "Not Available....";
                            btnBook.Attributes.Add("style", "Margin-right:10px;float:right;");
                            btnBook.CssClass = "btn btn-outline-danger";
                            btnBook.Enabled=false;
                        }
                        else
                        {
                            btnBook.Text = "Book";
                            btnBook.Attributes.Add("style", "Margin-right:10px;float:right;");
                            btnBook.CssClass = "btn btn-outline-success";
                            btnBook.Enabled=true;
                        }
                        btnBook.Click += new EventHandler(btnRoomBook);
                        void btnRoomBook(object O, EventArgs E)
                            {
                                if (Session["useremail"] is null)
                                {
                                    Response.Redirect("~/home_page.aspx");
                                }
                                else
                                {
                                    string rmno = CardTitle.InnerText.Remove(0, 8);
                                    Session["roomnoses"] = rmno;
                                // Session["roomimg"] = dt.Rows[j]["roomimg"].ToString();
                                   Response.Redirect("~/Views/User/bookingpage.aspx");
                                }
                            }



                            //updatePanel.Controls[0].Controls.Add(Card);

                            Row.Controls.Add(Col);
                            Col.Controls.Add(Card);
                            //Row.Controls.Add(Card);

                            Card.Controls.Add(Img);
                            Card.Controls.Add(CardBody);
                            CardBody.Controls.Add(CardTitle);
                            CardBody.Controls.Add(Discription);
                            CardBody.Controls.Add(stats);

                            CardBody.Controls.Add(btnBook);



                            string[] arrimage = dt.Rows[j]["roomimg"].ToString().Split(',');
                            //string path = dt.Rows[i]["roomimg"].ToString().Replace("\\", "/");

                            string path = arrimage[0];
                            path = path.Replace("\\", "/");

                            path = path.Replace("~/", "/");
                            Img.ImageUrl = path;
                            Discription.InnerText = dt.Rows[j]["room_typ"].ToString();
                        stats.InnerText = roombookstats;
                            CardTitle.InnerText = "Room No." + dt.Rows[j]["room_no"].ToString();






                        }   













                    }
                }

            


           
           

        }

      
        private void roomcheck()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                SqlCommand cmd = new SqlCommand("update room_manag set roombook_stat='Available' where checkout < cast(GETDATE()as date)", con);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
    }
}