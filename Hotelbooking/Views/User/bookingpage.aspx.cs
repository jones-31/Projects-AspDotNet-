using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

namespace Hotelbooking.Views.User
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {

                string roomnumber = Session["roomnoses"].ToString();
                int rm = Convert.ToInt32(roomnumber);

                SqlDataAdapter sda = new SqlDataAdapter("select room_no,room_typ,room_stat,room_price," +
                    "room_cancprice,roomimg,room_description from room_manag" +
                    " where room_no=@rm ", con);
                sda.SelectCommand.Parameters.AddWithValue("@rm", rm);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                int counts = dt.Rows.Count;

          

                if (counts > 0)
                {

                    System.Web.UI.UpdatePanel updatePanel = new System.Web.UI.UpdatePanel();

                    System.Web.UI.HtmlControls.HtmlGenericControl Row = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Row.Attributes.Add("class", "row border-left border-bottom border-right border-top");
                    Row.Attributes.Add("style", "padding-left:10px;padding-right:10px;padding-bottom:10px;padding-top:20px;");

                    System.Web.UI.HtmlControls.HtmlGenericControl Col1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Col1.Attributes.Add("class", "col-md-1");

                    System.Web.UI.HtmlControls.HtmlGenericControl Col2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Col2.Attributes.Add("class", "col-md-5");

                    System.Web.UI.HtmlControls.HtmlGenericControl Col3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Col3.Attributes.Add("class", "col-md-6");

                    //System.Web.UI.HtmlControls.HtmlGenericControl Carousel = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    //Carousel.Attributes.Add("class", "carousel slide");
                    //Carousel.Attributes.Add("data-ride", "carousel");

                    //System.Web.UI.HtmlControls.HtmlGenericControl Carouselinner = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    //Carousel.Attributes.Add("class", "carousel-inner w-100");


                    batdiv.Controls.Add(updatePanel);
                    updatePanel.Controls[0].Controls.Add(Row);
                    Row.Controls.Add(Col1);
                    Row.Controls.Add(Col2);
                    //Col2.Controls.Add(Carousel);
                    //Carousel.Controls.Add(Carouselinner);
                    Row.Controls.Add(Col3);







                    StringBuilder sb = new StringBuilder();
              

                    sb.AppendFormat("<div id ='myCarousel' class='carousel slide' data-interval='1000' data-ride='carousel'>");
                    sb.AppendFormat("<div class='carousel-inner'>");



                    HiddenField1.Value= dt.Rows[0]["room_no"].ToString();
                    HiddenField2.Value= dt.Rows[0]["room_price"].ToString();
                    HiddenField3.Value= dt.Rows[0]["room_cancprice"].ToString();
                    string room_no = HiddenField1.Value;
                    string room_price = HiddenField2.Value;
                    string room_cancprice = HiddenField3.Value;
                    string room_description = dt.Rows[0]["room_description"].ToString();
                    string[] arrimage = dt.Rows[0]["roomimg"].ToString().Split(',');
                    for (int i = 0; i < arrimage.Length; i++)
                    {
                        String Myclass = "";
                        if (i == 0)
                        {
                            Myclass = "active";
                        }


                        String MyImg = (arrimage[i]).ToString().Replace("\\", "/");
                        MyImg = MyImg.Replace("~/", "/");



                        sb.AppendFormat("<div class='item " + Myclass + "'>");
                        sb.AppendFormat("<img src=" + MyImg + " class='img-thumbnail rounded' alt='Los Angeles' style='width:610px;height:400px;'>");
                        sb.AppendFormat("</div>");



                        //  sb.AppendFormat("<div class='carousel-item " + Myclass + "'><img src=" + MyImg + " class='d-block w-100 h-60 img-thumbnail rounded' style='height:450px;width:350px;'></div>");


                    }

                    sb.AppendFormat("</div>");
                    sb.AppendFormat("<a class='carousel-control left' href='#myCarousel' data-slide='prev'>");
                    sb.AppendFormat("<span class='glyphicon glyphicon-chevron-left'></span>");
                    sb.AppendFormat("<span class='sr-only'>Previous</span>");
                    sb.AppendFormat("</a>");
                    sb.AppendFormat("<a class='carousel-control right' href='#myCarousel' data-slide='next'>");
                    sb.AppendFormat("<span class='glyphicon glyphicon-chevron-right'></span>");
                    sb.AppendFormat("<span class='glyphicon glyphicon-chevron-right'></span>");
                    sb.AppendFormat("<span class='sr-only'>Next</span></a>");
                    sb.AppendFormat("</div>"); 









                    System.Web.UI.HtmlControls.HtmlGenericControl DivMyData = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DivMyData.InnerHtml = sb.ToString();
                    Col2.Controls.Add(DivMyData);

                    StringBuilder sb1 = new StringBuilder();
                    
                    sb1.AppendFormat("<div class='shadow-lg p-3 mb-5 bg-body rounded col-6'>");
                    sb1.AppendFormat("<h1 style ='font-family: Calibri'> Room No. "+ room_no + "</b></h1>");
                    sb1.AppendFormat(" <br />");
                    sb1.AppendFormat("<h4 style ='color: #129916;'>Room Price :</b><span class='badge alert-success' style='font-size: larger'>₹"+ room_price + "</span></h4>");
                    sb1.AppendFormat("<h4 style ='color: #b23333'>Room Cancellation Price :</b><span class='badge alert-danger' style='font-size: larger'>₹"+ room_cancprice + "</span></h4>");
                    sb1.AppendFormat(" </div>");
                    sb1.AppendFormat("<div class='shadow-none p-3 mb-5 bg-light rounded col-6'>"+ room_description + "</div>");

                    System.Web.UI.HtmlControls.HtmlGenericControl DivMyData1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DivMyData1.InnerHtml = sb1.ToString();
                    Col3.Controls.Add(DivMyData1);















                    //System.Web.UI.HtmlControls.HtmlGenericControl lrcont = new System.Web.UI.HtmlControls.HtmlGenericControl();
                    //lrcont.InnerHtml = lrcontrol;
                    //Carousel.Controls.Add(lrcont);

                }
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("room_booking.aspx");
        }

        protected void confirm_Click(object sender, EventArgs e)
        {   
            string checkout1 = checkout.Text.ToString().Replace('/', '-');
            checkout1 = checkout1.Replace('\\', '-');
            string checkin1 = checkin.Text.ToString().Replace('/', '-');
            checkin1 = checkin1.Replace('\\', '-');
            DateTime curdate = DateTime.Now;
            string currentdate = curdate.ToShortDateString();

            if(DateTime.Parse(checkin1) < DateTime.Parse(currentdate))
            {
                checkin_val.Visible = true;
            }
            else
            {
                if (DateTime.Parse(checkout1) < DateTime.Parse(checkin1))
                {
                    checkout_val.Visible = true;
                }
                else
                {
                    string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        string roomnumber = Session["roomnoses"].ToString();
                        int rm = Convert.ToInt32(roomnumber);
                        string useremail = Session["useremail"].ToString();
                        SqlCommand cmd = new SqlCommand("update room_manag set book_userid=@userid,checkin=@checkin,checkout=@checkout,roombook_stat='Pending' where room_no=@rm", con);
                        cmd.Parameters.AddWithValue("@userid", useremail);
                        cmd.Parameters.AddWithValue("@checkin", checkin.Text);
                        cmd.Parameters.AddWithValue("@checkout", checkout.Text);
                        cmd.Parameters.AddWithValue("@rm", rm);
                        con.Open();
                        cmd.ExecuteNonQuery();


                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Room Booking Sucessfully Submitted');", true);

                    }


                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        int roomno = Convert.ToInt32(HiddenField1.Value);
                        int roomprice = Convert.ToInt32(HiddenField2.Value);
                        int roomcancprice = Convert.ToInt32(HiddenField3.Value);
                        string useremail = Session["useremail"].ToString();
                        SqlCommand cmd = new SqlCommand("insert into RoomLogs(RoomNo,BookedBy,RoomPrice,RoomCancelPrice,CheckIn,CheckOut) values(@RoomNo,@BookedBy," +
                            "@RoomPrice,@RoomCancelPrice,@CheckIn,@CheckOut)", con);

                        cmd.Parameters.AddWithValue("@RoomNo", roomno);
                        cmd.Parameters.AddWithValue("@BookedBy", useremail);
                        cmd.Parameters.AddWithValue("@RoomPrice", roomprice);
                        cmd.Parameters.AddWithValue("@RoomCancelPrice", roomcancprice);
                        cmd.Parameters.AddWithValue("@CheckIn", checkin.Text);
                        cmd.Parameters.AddWithValue("@CheckOut", checkout.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();

                    }
                    Response.Redirect("room_history.aspx");
                    checkout_val.Visible = false;
                }
                checkin_val.Visible = false;
            }
           



        }
    }
}