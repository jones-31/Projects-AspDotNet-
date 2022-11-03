<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dummy.aspx.cs" Inherits="Hotelbooking.dummy" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%-- <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/dot-luv/jquery-ui.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


     <script src="~/Scripts/jquery-3.4.1.min.js"></script>
     <script src="~/Scripts/bootstrap.min.js"></script>
     <link href="~/Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="~/Scripts/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/dot-luv/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>



    <!-- CSS only -->

    <%-- <script>
        $(document).ready(function () {
            $('#checkout').datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "button",
                minDate: 0
            });

            $('#checkin').datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "button",
                minDate: 0
            }); 
        });
     </script>--%>
</head>

<body>
    <form runat="server">

        <asp:Button ID="Button2" runat="server" Text="Button" /><%--<div class="container">
  <h2>Carousel Example</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="item active">
        <img src="Roomimg/bluebed.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="Roomimg/circlebed.jpg" alt="Chicago" style="width:100%;"> 
      </div>
   
      <div class="item">
        <img src="Roomimg/maladchawl1.jpg" alt="New york" style="width:100%;">
      </div>
    </div>   
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>--%>

        <%--<row>
        <div class="shadow-lg p-3 mb-5 bg-body rounded col-4">
            <h1 style="font-family: Calibri"><b>Room No. 151</b> </h1>
            <br />
            <h4 style="color: #129916;"><b>Room Price :</b><span class="badge alert-success " style="font-size: larger">₹2000</span></h4>
            <h4 style="color: #b23333"><b>Room Cancellation Price :</b><span class="badge alert-danger " style="font-size: larger">Rs 200</span></h4>
        </div>
        <div class="shadow-none p-3 mb-5 bg-light rounded col-4">No shadow</div>

    </row>--%>





        <%-- <div class="shadow-lg p-3 mb-5 bg-body rounded col-4 border-warning">
            <h1 style="font-family: Calibri"><b>Room No. 151</b> </h1>
            <br />
            <h4 style="color: #129916;"><b>Room Price :</b><span class="badge alert-success " style="font-size: larger">₹2000</span></h4>
            <h4 style="color: #b23333"><b>Room Cancellation Price :</b><span class="badge alert-danger " style="font-size: larger">Rs 200</span></h4>
        </div>
        <div class="shadow-none p-3 mb-5 bg-light rounded col-4">No shadow</div>

                             <asp:TextBox ID="checkin" runat="server" class="form-control"  AutoCompleteType="Disabled" placeholder="yyyy-mm-dd" ></asp:TextBox>   <%--TextMode="Date"--%>

        <%-- <asp:TextBox ID="checkout" runat="server" class="form-control" AutoCompleteType="Disabled" placeholder="yyyy-mm-dd" ></asp:TextBox>--%>  <%--TextMode="Date"--%>

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Label runat="server" ID="label1"></asp:Label>

        <h1 style="font-family: sans-serif"> <ins>Your <span class="badge alert-danger"  style="font-size:large">Booking</span> has been confirmed</ins> </h1>
        <br />
        <h3 style="font-family:cursive"><i>Your booking for the <span class="badge alert-dark"  style="font-size:large">Room No.</span> has been confirmed</i><br />
            <i>your booking duration is from <span  style="font-size:large;color:#1221a3"><ins style="border:dotted red;">checkin</ins></span> to <span class="badge alert-info" style="font-size:large">checkout</span></i><br />
            <i>and your boooking cost is <span class="badge alert-success" style="font-size:large">roomprice</span></i>
        </h3>
        <br />

        <h3 style="font-family: cursive; color: purple"><i>Regards Admin.</i></h3>





    </form>
</body>

</html>

