<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="room_confirmation.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row" style="margin-top:30px;">

    <div class="col-3"></div>
    <div class="col-7">

       
    <asp:GridView ID="roomconfirm" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="roomconfirm_SelectedIndexChanged">

        <Columns>
            <asp:BoundField DataField="room_no" HeaderText="Room No" />
            <asp:BoundField DataField="book_userid" HeaderText="User Email" />
            <asp:BoundField DataField="checkin" HeaderText="Check In Time" DataFormatString="{0:D}" />
            <asp:BoundField DataField="checkout" HeaderText="Check Out Time" DataFormatString="{0:D}" />
            <asp:BoundField DataField="roombook_stat" HeaderText="Booking Status" />
            <asp:BoundField DataField="room_price" HeaderText="Room Price" DataFormatString="{0:c0}" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />



    </asp:GridView>
          <div class="col-3"></div>
        <div class="col-6"><h2 id="nodata" runat="server"><i>----No Rooms Request available----</i></h2></div>
        <div class="col-3"></div>

    </div>
    <div class="col-2"></div>

</div>



    <div class="row" style="margin-top:30px;">
        <div class="col-4"></div>
      
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <div class ="col-2" >
            <asp:Button ID="approve" runat="server" Text="Approve" class="btn btn-primary" OnClick="approve_Click" />
        </div>
          <div class ="col-2">
               <asp:Button ID="cancel" runat="server" Text="Cancel" class="btn btn-warning" OnClick="cancel_Click" OnClientClick="return confirm('Are you sure you want to cancel this booking ?')"/>
        </div>
          <div class ="col-4"></div>
    </div>
</asp:Content>
