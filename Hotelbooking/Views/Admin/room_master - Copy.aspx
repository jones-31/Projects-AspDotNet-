<%@ Page Culture="en-IN" Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="room_master.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<style type="text/css">
        ::-webkit-scrollbar-corner {
            display:none
        }
    </style>--%>







    <script>

        //$(document).ready(function () {

        //    $('#ContentPlaceHolder1_cancelprice').keyup(function () {
               
        //    });
        //});



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <h1>room master</h1>--%>
    <div class="row" style="height: 100%;">
        <div class="col-md-3">
            <%--form start--%>

            <div class="mb-3">
                <%--First name --%>
                <asp:Label ID="roomno" runat="server" class="form-control form-group-lg"></asp:Label>

            </div>

            <div class="mb-3">
                <asp:DropDownList ID="roomtyp" runat="server" DataValueField="roomid" DataTextField="roomtype">
                </asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="roomtyp" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="roomprice" class="form-control form-control-lg" placeholder="Room Price" autocomplete="off" runat="server"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="roomprice" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

            </div>



            <div class="mb-3">
                <asp:DropDownList ID="roomstat" runat="server">
                    <asp:ListItem Value="0">Select a status</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>

                </asp:DropDownList>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="roomstat" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="cancelprice" class="form-control form-control-lg" placeholder="Room Cancellation" autocomplete="off" runat="server" OnTextChanged="cancelprice_TextChanged" AutoPostBack="true"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="cancelprice" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <asp:Label ID="cancelprice_val" runat="server" Text="Cancellation price must be lower than Room price" ForeColor="Red" ></asp:Label>
            </div>

            <div class="mb-3">
                <label for="formFileSm" class="form-label">
                    <br />
                    Upload Room image below</label>
                <asp:FileUpload ID="room_imgpath" class="form-control form-control-sm" runat="server" AllowMultiple="True" />
               
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="room_imgpath" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </div>

             <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="room_description" class="form-control form-control-lg" placeholder="Room Description" autocomplete="off" runat="server" TextMode="MultiLine"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="cancelprice" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

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

            <asp:GridView ID="room_manag" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="room_manag_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="room_no" HeaderText="Room No." />
                    <asp:BoundField DataField="room_typ" HeaderText="Room Type" />
                    <asp:BoundField DataField="room_price" HeaderText="Room Price" DataFormatString="{0:c0}" />
                    <asp:BoundField DataField="room_stat" HeaderText="Room Status" />
                    <asp:BoundField DataField="room_cancprice" HeaderText="Room Cancellation Price" DataFormatString="{0:c0}" />
                    <asp:BoundField DataField="roombook_stat" HeaderText="Room Booking Status" />
                    <asp:BoundField DataField="roomimg" HeaderText="Room Img Path" />
                    <asp:BoundField DataField="room_description" HeaderText="Room Description" />

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
