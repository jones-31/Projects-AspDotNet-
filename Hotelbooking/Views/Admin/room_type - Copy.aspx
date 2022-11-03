<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="room_type.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="height:450px;">
        <div class="col-md-3" >
            <%--form start--%>

            <div class="mb-3">
                <%--First name --%>
                <asp:Label ID="roomid" runat="server" class="form-control form-group-lg"></asp:Label>

            </div>

          
            <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="roomdes" class="form-control form-control-lg" placeholder="Room Description" autocomplete="off" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="roomdes" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                  </div>

                   <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="roomtype" class="form-control form-control-lg" placeholder="Room Type" autocomplete="off" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="roomtype" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>


            </div>

          
            <div class="mb-3">
                <asp:DropDownList ID="roomstat" runat="server">
                    <asp:ListItem Value="0">Select a status</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="roomstat" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

            </div>
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
            </div>
        </div>

        <div class="col-md-9">

            <asp:GridView ID="docu" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="docu_SelectedIndexChanged">
                <Columns>
                     <asp:BoundField DataField="roomid" HeaderText="Room ID" />
                    <asp:BoundField DataField="roomtype" HeaderText="Room Type" />
                     <asp:BoundField DataField="roomdes" HeaderText="Room Description" />
                    <asp:BoundField DataField="roomstat" HeaderText="Room Status" />

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
    </div>
</asp:Content>
