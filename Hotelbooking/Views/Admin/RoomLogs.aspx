<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="RoomLogs.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row">
    <div class="col-2"></div>
    <div class="col-4" style="align-items:flex-start">
          <h4>  Sort By Room No.  : </h4>
          <asp:DropDownList ID="DropDownList1" runat="server"  class="btn btn-secondary dropdown-toggle" DataTextField="RoomNo" DataValueField="RoomNo" autopostback="true"></asp:DropDownList>
     <asp:Button ID="Button1" runat="server" Text="Sort" class="btn btn-outline-primary" OnClick="Button1_Click" />
    </div>
   
       
  
  
       
   
   
</div>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">

        <Columns>
            <asp:BoundField  DataField="RoomNo" HeaderText="Room No."/>
            <asp:BoundField  DataField="BookedBy" HeaderText="Booked User ID"/>
            <asp:BoundField  DataField="RoomPrice" HeaderText="Room Price" DataFormatString="{0:c0}"/>
            <asp:BoundField  DataField="RoomCancelPrice" HeaderText="Room Cancellation Price" DataFormatString="{0:c0}"/>
            <asp:BoundField  DataField="CheckIn" HeaderText="Check In " DataFormatString="{0:D}"/>
            <asp:BoundField  DataField="CheckOut" HeaderText="Check Out " DataFormatString="{0:D}"/>
            <asp:BoundField  DataField="ConfirmationStatus" HeaderText="Booking Status "/>
            <asp:BoundField  DataField="ConfirmedBy" HeaderText="Confirmed By"/>
            <asp:BoundField  DataField="ConfirmedOn" HeaderText="Confirmed On" DataFormatString="{0:D}"/>



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
</asp:Content>
