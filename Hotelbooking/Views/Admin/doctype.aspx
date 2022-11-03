<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="doctype.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="height:450px;">
        <div class="col-md-3">
            <%--form start--%>

             <div class="mb-3">
                <%--First name --%>
               
                 <asp:HiddenField ID="HiddenField1" runat="server" />

            </div>
            <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="docname" class="form-control form-control-lg" placeholder="Document Name" autocomplete="off" runat="server"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="docname" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

            </div>
             <div class="mb-3">
                <%--First name --%>
                 <asp:TextBox ID="minval" class="form-control form-control-lg" placeholder="Minimum Value " autocomplete="off" runat="server"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="minval" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
      --%>      </div>
             <div class="mb-3">
                <%--First name --%>
                  <asp:TextBox ID="maxval" class="form-control form-control-lg" placeholder="Maximum Value" autocomplete="off" runat="server"></asp:TextBox>
                                 <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="maxval" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

            </div>
             <div class="mb-3">
                <asp:DropDownList ID="stat" runat="server">
                    <asp:ListItem Value="0">Select a status</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
               <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="stat" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
       --%>     </div>
                <div class="row">
                <div class="col d-grid">
                    <asp:Button ID="editbtn" runat="server" Text="Edit" class="btn btn-warning btn-block" OnClick="editbtn_Click" />
                </div>
                <div class="col d-grid">
                    <asp:Button ID="deletebtn" runat="server" Text="Delete" class="btn btn-danger btn-block" OnClick="deletebtn_Click" />
                </div>
            </div>
            <br />
            <div class="d-grid">
                <asp:Button ID="savebtn" runat="server" Text="Save" class="btn btn-success btn-block" OnClick="savebtn_Click" />
                <asp:Button ID="cancel" runat="server" Text="Cancel" class="btn btn-dark btn-block" OnClick="cancel_Click" />
            </div>
        </div>
        <div class="col-md-9">
            <asp:GridView ID="docu" runat="server" AutoGenerateSelectButton="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="docu_SelectedIndexChanged" AutoGenerateColumns="False">

                <Columns>
                     <asp:BoundField DataField="docid" HeaderText="Document ID" />
                    <asp:BoundField DataField="doc_name" HeaderText="Document Name" />
                    <asp:BoundField DataField="doc_status" HeaderText="Validity Status" />
                    <asp:BoundField DataField="minval" HeaderText="Min Value " />
                    <asp:BoundField DataField="maxval" HeaderText="Max Value" />
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
        </div>
         <div class="col-3"></div>
        <div class="col-6"><h2 id="nodata" runat="server"><i>----Table is empty ----</i></h2></div>
        <div class="col-3"></div>
        
    </div>
</asp:Content>
