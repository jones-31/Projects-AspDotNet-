<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/user_pannnel.Master" AutoEventWireup="true" CodeBehind="room_history.aspx.cs" Inherits="Hotelbooking.Views.User.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" style="margin-top:30px;">
        <div class="col-3"></div>
        <div class="col-7">

             <asp:GridView ID="rmbookhis" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="rmbookhis_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="room_no" HeaderText="Room Number" />
            <asp:BoundField DataField="book_userid" HeaderText="User Email" />
            <asp:BoundField DataField="checkin" HeaderText="Check In Time" dataformatstring="{0:D}"/>
            <asp:BoundField DataField="checkout" HeaderText="Check Out Time" dataformatstring="{0:D}"/>
            <asp:BoundField DataField="roombook_stat" HeaderText="Booking Status" />
            <asp:BoundField DataField="room_cancprice" HeaderText="Room Cancellation Charge" DataFormatString="{0:c0}" >
            <ItemStyle Font-Underline="True" ForeColor="Red" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        



    </asp:GridView>

              <div class="col-3"></div>
        <div class="col-6"><h2 id="nodata" runat="server"><i>----No Room is booked----</i></h2></div>
        <div class="col-3"></div>

        </div>
        <div class="col-2"></div>
    </div>
   
    <div class="row">
        <div class="col-4">
          
            <asp:HiddenField ID="HiddenField1" runat="server" />

        </div>
            <div class="col-6">
                <asp:Button ID="cancel" runat="server" Text="Cancel Booking" class="btn btn-danger" OnClick="cancel_Click" OnClientClick="return confirm('Are you sure you want to cancel your booking ?')" style="margin-top:20px;margin-bottom:30px;"/>
            </div>
            <div class="col-6">
                
                <asp:HiddenField ID="HiddenField2" runat="server" />
            </div>
        
    </div>
</asp:Content>
