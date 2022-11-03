<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="adminreq.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row" style="margin-top:30px;">

      <div class="col-3"></div>
    <div class="col-7">

        <asp:GridView ID="reqadmin" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
           <Columns>
               <asp:BoundField  DataField="user_email" HeaderText="User Email"/>
               <asp:BoundField  DataField="first_name" HeaderText="First Name"/>
               <asp:BoundField  DataField="user_type" HeaderText="User Type"/>
               <asp:BoundField  DataField="user_status" HeaderText="User Status"/>
               <asp:BoundField  DataField="req" HeaderText="Request Value"/>
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
        <div class="col-6"><h2 id="nodata" runat="server"><i>----No Request available----</i></h2></div>
        <div class="col-3"></div>
       
   
    </div>
    <div class="col-2"></div>

    <asp:HiddenField ID="HiddenField1" runat="server" />

</div>



    <div class="row" style="margin-top:30px;">
        <div class="col-4"></div>
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        <div class ="col-2" >
            <asp:Button ID="approve" runat="server" Text="Approve" class="btn btn-primary" OnClick="approve_Click" />
        </div>
          <div class ="col-2">
               <asp:Button ID="cancel" runat="server" Text="Cancel" class="btn btn-warning" OnClick="cancel_Click" />
        </div>
          <div class ="col-4"></div>
    </div>
</asp:Content>
