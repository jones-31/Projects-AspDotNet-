<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/user_pannnel.Master" AutoEventWireup="true" CodeBehind="bookingpage.aspx.cs" Inherits="Hotelbooking.Views.User.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/dot-luv/jquery-ui.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
  
    
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_checkout').datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "button",
                minDate: 0
            });

            $('#ContentPlaceHolder1_checkin').datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "button",
                minDate: 0
            }); 
        });
    </script>


  
     



   
   <%--  <script src="../../Scripts/jquery-3.4.1.min.js"></script>--%>
    <%--<script src="../../Scripts/bootstrap.min.js"></script>--%>
 
   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div id="batdiv" runat="server"></div>
 <div class="row" style="margin-top:20px">
                <div class="col-2"></div>
     
                <div class="col-8">

                    <div class="row">
                        <div class="col-5">
                               <asp:Label ID="Label1" runat="server" Text="Check In Date : "></asp:Label>
                  <%--  <asp:TextBox ID="checkin" runat="server" placeholder="yyyy-mm-dd" class="form-control form-control-lg" style="margin-top:20px"></asp:TextBox>--%>
                             <asp:TextBox ID="checkin" runat="server" class="form-control"  AutoCompleteType="Disabled" placeholder="yyyy-mm-dd" ValidationGroup="date" TextMode="SingleLine" ReadOnly="False"></asp:TextBox>   <%--TextMode="Date"--%>
                             <asp:Label ID="checkin_val" runat="server" ForeColor="Red" Text="Cannot enter previous date please select from today" Visible="false" ToolTip="Select a date from the calendar"></asp:Label>
                         
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="checkin" runat="server" ErrorMessage="Please select a date" ValidationGroup="date"  ForeColor="#ff3300"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="checkin" runat="server" ValidationExpression="^[0-9]{4}(-)([0-9]|1[0-2])(-)([1-9]|[12][0-9]|[3][01])$" ErrorMessage="Please enter a validate date" ForeColor="Red" ValidationGroup="date"></asp:RegularExpressionValidator>
                        </div>

                    </div>
                 
                </div>
                <div class="col-2"></div>



            </div>

             <div class="row" style="margin-top:20px">
                <div class="col-2"></div>

                <div class="col-8">
                    <div class="row">
                        <div class="col-5">

                            <asp:Label ID="Label2" runat="server" Text="Check Out Date : "></asp:Label>
                   <%-- <asp:TextBox ID="checkout" runat="server" placeholder="yyyy-mm-dd" class="form-control form-control-lg" style="margin-top:20px"></asp:TextBox>--%>
                            <asp:TextBox ID="checkout" runat="server" class="form-control" AutoCompleteType="Disabled" placeholder="yyyy-mm-dd" ValidationGroup="date" ReadOnly="False" EnableViewState="False"></asp:TextBox>  <%--TextMode="Date"--%>
                             <asp:Label ID="checkout_val" runat="server" ForeColor="Red" Text="Check out date must be greater than check in date" Visible="false" ToolTip="Select a date from the calendar"></asp:Label>
                         
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="checkout" runat="server" ErrorMessage="Please select a date" ForeColor="#ff3300" ValidationGroup="date"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="checkout" runat="server" ErrorMessage="Please enter a validate date" ValidationExpression="^[0-9]{4}(-)([0-9]|1[0-2])(-)([1-9]|[12][0-9]|[3][01])$" ValidationGroup="date" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    
                </div>
                <div class="col-2"></div>



            </div>
            <div class="row"></div>

            <div class="row" style="margin-top:20px">

                  <div class="col-2"></div>

                <div class="col-8">
                    <div class="row" style="padding-bottom:20px;">
                         <div class="col-6" >
                    <asp:Button ID="cancel" runat="server" Text="Cancel" class="btn btn-danger" OnClick="cancel_Click" />
                             
                </div>
                  

                <div class="col-6">
                    <asp:Button ID="confirm" runat="server" Text="Confirm" class="btn btn-success" OnClick="confirm_Click" ValidationGroup="date" />
                </div>
                    </div>
                   
                </div>
                <div class="col-2"></div>

               
            </div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:HiddenField ID="HiddenField3" runat="server" />
    






</asp:Content>
