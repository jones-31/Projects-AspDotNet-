<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/admin_pannel.Master" AutoEventWireup="true" CodeBehind="admin_type.aspx.cs" Inherits="Hotelbooking.Views.Admin.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
      <script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>

    <script>
        $(document).ready(function () {

            var regex_email = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var email_err = true;
            var password_err = true;
            var regex_name = /^[a-zA-Z]+$/;
            var fname_err = true;
            var lname_err = true;
            var phone_err = true;
            var addr_err = true;
            var stat_err = true;
            var type_err = true;

            $('#fname_val').hide();
            $('#lname_val').hide();
            $('#phone_val').hide();
            $('#addr_val').hide();
            $('#email_id').hide();
            $('#password_lgn').hide();




            $('#ContentPlaceHolder1_user_password').keyup(function () {
                password_check();
            });

            $('#ContentPlaceHolder1_user_emailid').keyup(function () {
                useremid_check();
            });
            $('#ContentPlaceHolder1_fname').keyup(function () {
                userfname_check();
            });

            $('#ContentPlaceHolder1_lname').keyup(function () {

                userlname_check();
            });

            $('#ContentPlaceHolder1_phoneno').keyup(function () {

                userphone_check();
            });

            $('#ContentPlaceHolder1_addr').keyup(function () {

                useraddr_check();
            });

          
            function type_check() {


                if ($('#ContentPlaceHolder1_type').val() == 0) {

                    $('#type_val').show();
                    $('#type_val').html('**Please select a value.').fadeOut("slow");
                    $('#type_val').focus();
                    $('#type_val').css('color', 'red');
                    type_err = false;

                    return false;

                }
                else {
                    $('#type_val').hide();
                }

            }

            function stat_check() {


                if ($('#ContentPlaceHolder1_stat').val() == 0) {

                    $('#stat_val').show();
                    $('#stat_val').html('**Please select a value.').fadeOut("slow");
                    $('#stat_val').focus();
                    $('#stat_val').css('color', 'red');
                    stat_err = false;

                    return false;

                }
                else {
                    $('#stat_val').hide();
                }

            }

            function password_check() {
                var psed = $('#ContentPlaceHolder1_user_password').val();


                if (psed == "") {
                    $('#password_lgn').show();
                    $('#password_lgn').html("**Password cannot be Empty");
                    $('#password_lgn').focus();
                    $('#password_lgn').css('color', 'red');
                    password_err = false;

                    return false


                }
                else {
                    $('#password_lgn').hide();
                }
            }

            function useremid_check() {
                var emid = $('#ContentPlaceHolder1_user_emailid').val();


                if (emid == "") {

                    $('#email_id').show();
                    $('#email_id').html('**Email ID should not be empty.');
                    $('#email_id').focus();
                    $('#email_id').css('color', 'red');
                    email_err = false;

                    return false;

                }
                else {
                    $('#email_id').hide();
                }

                if (!regex_email.test(emid)) {
                    $('#email_id').show();
                    $('#email_id').html('**Email ID is invalid.');
                    $('#email_id').focus();
                    $('#email_id').css('color', 'red');
                    email_err = false;

                    return false;


                }
                else {
                    $('#email_id').hide();
                }
            }


            function userfname_check() {
                var fname = $('#ContentPlaceHolder1_fname').val();




                if (fname == "") {

                    $('#fname_val').show();
                    $('#fname_val').html('**Username should not be empty.');
                    $('#fname_val').focus();
                    $('#fname_val').css('color', 'red');
                    fname_err = false;

                    return false;

                }
                else {
                    $('#fname_val').hide();
                }

                if (!regex_name.test(fname)) {
                    $('#fname_val').show();
                    $('#fname_val').html('**Username should have only Alphabets.');
                    $('#fname_val').focus();
                    $('#fname_val').css('color', 'red');
                    fname_err = false;

                    return false;


                }
                else {
                    $('#fname_val').hide();
                }
            }

            function userlname_check() {
                var lname = $('#ContentPlaceHolder1_lname').val();



                if (lname == "") {

                    $('#lname_val').show();
                    $('#lname_val').html('**Username should not be empty.');
                    $('#lname_val').focus();
                    $('#lname_val').css('color', 'red');
                    lname_err = false;

                    return false;

                }
                else {
                    $('#lname_val').hide();
                }

                if (!regex_name.test(lname)) {
                    $('#lname_val').show();
                    $('#lname_val').html('**Username should have only Alphabets.');
                    $('#lname_val').focus();
                    $('#lname_val').css('color', 'red');
                    lname_err = false;

                    return false;


                }
                else {
                    $('#lname_val').hide();
                }
            }

            function userphone_check() {
                var phoneno = $('#ContentPlaceHolder1_phoneno').val();



                if (phoneno == "") {

                    $('#phone_val').show();
                    $('#phone_val').html('**Phone Number should not be empty.');
                    $('#phone_val').focus();
                    $('#phone_val').css('color', 'red');
                    phone_err = false;

                    return false;

                }
                else {
                    $('#phone_val').hide();
                }

                if (phoneno.length != 10) {

                    $('#phone_val').show();
                    $('#phone_val').html('**Phone Number should have 10 numbers.');
                    $('#phone_val').focus();
                    $('#phone_val').css('color', 'red');
                    phone_err = false;

                    return false;

                }
                else {
                    $('#phone_val').hide();
                }

            }

            function useraddr_check() {
                var addr = $('#ContentPlaceHolder1_addr').val();



                if (addr == "") {

                    $('#addr_val').show();
                    $('#addr_val').html('**Address cannot not be empty.');
                    $('#addr_val').focus();
                    $('#addr_val').css('color', 'red');
                    addr_err = false;

                    return false;

                }
                else {
                    $('#addr_val').hide();
                }

            }

            $('#ContentPlaceHolder1_editbtn').click(function () {
                detail_check();
            });
            $('#ContentPlaceHolder1_savebtn').click(function () {
                detail_check();
            });


            function detail_check() {
                email_err = true;
                password_err = true;
                fname_err = true;
                lname_err = true;
                phone_err = true;
                addr_err = true;
                stat_err = true;
                type_err = true;

                password_check();
                useremid_check();
                userfname_check();
                userlname_check();
                userphone_check();
                useraddr_check();
                stat_check();
                type_check();


                if ((email_err == true) && (password_check == true) && (fname_err == true) && (lname_err == true) && (phone_err == true) && (addr_err == true) && (stat_err == true) && (type_err == true)
                ) {

                    return true
                }
                else {

                    return false

                }
            }


        });
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    </div>

    <div class="row">
        <div class="col-md-3">
            <%--form start--%>

            <div class="mb-3">
                <%--First name --%>
                <asp:TextBox ID="fname" class="form-control form-control-lg" placeholder="First Name" autocomplete="off" runat="server"></asp:TextBox>
                <div id="fname_val"></div>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="fname" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>

            </div>
            <%--Second name --%>
            <div class="mb-3">
                <asp:TextBox ID="lname" class="form-control form-control-lg" placeholder="Last Name" autocomplete="off" runat="server"></asp:TextBox>
                <div id="lname_val"></div>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="lname" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>


            </div>
            <%--Mobile No. --%>
            <div class=" mb-3">
                <asp:TextBox ID="phoneno" class="form-control form-control-lg" placeholder="Mobile No." autocomplete="off" runat="server" AutoPostBack="true" OnTextChanged="phoneno_TextChanged"></asp:TextBox>
                <div id="phone_val"></div>
                <asp:Label ID="mobileval" runat="server" ForeColor="Red"></asp:Label>
              <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="phoneno" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>


            </div>
            <%--Address --%>
            <div class="mb-3">
                <asp:TextBox ID="addr" class="form-control form-control-lg" placeholder="Address" autocomplete="off" runat="server" TextMode="MultiLine"></asp:TextBox>
                <div id="addr_val"></div>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="addr" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>


            </div>

            <div class="mb-3">
                <asp:TextBox ID="user_emailid" class="form-control form-control-lg" runat="server" placeholder="Email" AutoComplete="off" AutoPostBack="true" OnTextChanged="user_emailid_TextChanged"></asp:TextBox>
                <div id="email_id"></div>
                <asp:Label ID="emidval" runat="server" ForeColor="Red"></asp:Label>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="user_emailid" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>

            </div>
            <%--password for login--%>
            <div class="mb-3">
                <asp:TextBox ID="user_password" class="form-control form-control-lg" runat="server" placeholder=" Set Password" AutoComplete="off"></asp:TextBox>
                <div id="password_lgn"></div>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="user_password" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>

            </div>
           
              <div class="mb-3">
                <asp:DropDownList ID="type" runat="server">
                    <asp:ListItem Value="0">Select a type</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                    
                </asp:DropDownList>
                    <div id="type_val"></div>
                   <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="type" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>

            </div>
              <div class="mb-3">
                 <asp:DropDownList ID="stat" runat="server">
                     <asp:ListItem Value="0">Select a status</asp:ListItem>
                     <asp:ListItem>Active</asp:ListItem>
                     <asp:ListItem>Inactive</asp:ListItem>
                    
                 </asp:DropDownList>
                   <div id="stat_val"></div>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="stat" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>

            </div>




            <div class="row">
                <div class="col d-grid">
                    <asp:Button ID="editbtn" runat="server" Text="Edit" class="btn btn-warning btn-block" OnClick="editbtn_Click"/>
                </div>
                  <div class="col d-grid">
                    <asp:Button ID="deletebtn" runat="server" Text="Delete" class="btn btn-danger btn-block" OnClick="deletebtn_Click" OnClientClick="return confirm('Are you sure you want to Delete ?')"/>
                </div>
            </div><br/>
            <div class="d-grid">
                <asp:Button ID="savebtn" runat="server" Text="Save" class="btn btn-success btn-block" OnClick="savebtn_Click"/>
                <asp:Button ID="cancel" runat="server" Text="Cancel" class="btn btn-dark btn-block" OnClick="cancel_Click" />
            </div>


        </div>
        <div class="col-md-9">
            <asp:GridView ID="adminview" runat="server" AutoGenerateSelectButton="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="adminview_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="user_email" HeaderText="Email ID" />
                    <asp:BoundField DataField="user_password" HeaderText="Password" />
                    <asp:BoundField DataField="mobile_no" HeaderText="Mobile No." />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                    <asp:BoundField DataField="user_address" HeaderText="Address" />
                    <asp:BoundField DataField="user_type" HeaderText="Type" />
                    <asp:BoundField DataField="user_status" HeaderText="Status" />


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



<%--    <script>
        $(document).ready(function () {

            var regex_email = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var email_err = true;
            var password_err = true;
            var regex_name = /^[a-zA-Z]+$/;
            var fname_err = true;
            var lname_err = true;
            var phone_err = true;
            var addr_err = true;

            $('#fname_val').hide();
            $('#lname_val').hide();
            $('#phone_val').hide();
            $('#addr_val').hide();
            $('#email_id').hide();
            $('#password_lgn').hide();




            $('#user_password').keyup(function () {
                password_check();
            });

            $('#user_emailid').keyup(function () {
                useremid_check();
            });
            $('#fname').keyup(function () {
                userfname_check();
            });

            $('#lname').keyup(function () {

                userlname_check();
            });

            $('#phoneno').keyup(function () {

                userphone_check();
            });

            $('#addr').keyup(function () {

                useraddr_check();
            });


            function password_check() {
                var psed = $('#user_password').val();


                if (psed == "") {
                    $('#password_lgn').show();
                    $('#password_lgn').html("**Password cannot be Empty");
                    $('#password_lgn').focus();
                    $('#password_lgn').css('color', 'red');
                    password_err = false;

                    return false


                }
                else {
                    $('#password_lgn').hide();
                }
            }

            function useremid_check() {
                var emid = $('#user_emailid').val();


                if (emid == "") {

                    $('#email_id').show();
                    $('#email_id').html('**Email ID should not be empty.');
                    $('#email_id').focus();
                    $('#email_id').css('color', 'red');
                    email_err = false;

                    return false;

                }
                else {
                    $('#email_id').hide();
                }

                if (!regex_email.test(emid)) {
                    $('#email_id').show();
                    $('#email_id').html('**Email ID is invalid.');
                    $('#email_id').focus();
                    $('#email_id').css('color', 'red');
                    email_err = false;

                    return false;


                }
                else {
                    $('#email_id').hide();
                }
            }


            function userfname_check() {
                var fname = $('#fname').val();




                if (fname == "") {

                    $('#fname_val').show();
                    $('#fname_val').html('**Username should not be empty.');
                    $('#fname_val').focus();
                    $('#fname_val').css('color', 'red');
                    fname_err = false;

                    return false;

                }
                else {
                    $('#fname_val').hide();
                }

                if (!regex_name.test(fname)) {
                    $('#fname_val').show();
                    $('#fname_val').html('**Username should have only Alphabets.');
                    $('#fname_val').focus();
                    $('#fname_val').css('color', 'red');
                    fname_err = false;

                    return false;


                }
                else {
                    $('#fname_val').hide();
                }
            }

            function userlname_check() {
                var lname = $('#lname').val();



                if (lname == "") {

                    $('#lname_val').show();
                    $('#lname_val').html('**Username should not be empty.');
                    $('#lname_val').focus();
                    $('#lname_val').css('color', 'red');
                    lname_err = false;

                    return false;

                }
                else {
                    $('#lname_val').hide();
                }

                if (!regex_name.test(lname)) {
                    $('#lname_val').show();
                    $('#lname_val').html('**Username should have only Alphabets.');
                    $('#lname_val').focus();
                    $('#lname_val').css('color', 'red');
                    lname_err = false;

                    return false;


                }
                else {
                    $('#lname_val').hide();
                }
            }

            function userphone_check() {
                var phoneno = $('#phoneno').val();



                if (phoneno == "") {

                    $('#phone_val').show();
                    $('#phone_val').html('**Phone Number should not be empty.');
                    $('#phone_val').focus();
                    $('#phone_val').css('color', 'red');
                    phone_err = false;

                    return false;

                }
                else {
                    $('#phone_val').hide();
                }

                if (phoneno.length != 10) {

                    $('#phone_val').show();
                    $('#phone_val').html('**Phone Number should have 10 numbers.');
                    $('#phone_val').focus();
                    $('#phone_val').css('color', 'red');
                    phone_err = false;

                    return false;

                }
                else {
                    $('#phone_val').hide();
                }

            }

            function useraddr_check() {
                var addr = $('#addr').val();



                if (addr == "") {

                    $('#addr_val').show();
                    $('#addr_val').html('**Address cannot not be empty.');
                    $('#addr_val').focus();
                    $('#addr_val').css('color', 'red');
                    addr_err = false;

                    return false;

                }
                else {
                    $('#addr_val').hide();
                }

            }

            $('#editbtn').click(function () {
                detail_check();
            });
            $('#savebtn').click(function () {
                detail_check();
            });
           

            function detail_check() {
                email_err = true;
                password_err = true;
                fname_err = true;
                lname_err = true;
                phone_err = true;
                addr_err = true;

                password_check();
                useremid_check();
                userfname_check();
                userlname_check();
                userphone_check();
                useraddr_check();


                if ((email_err == true) && (password_check == true) && (fname_err = true) && (lname_err = true) && (phone_err = true) && (addr_err = true)
                   ) {

                    return true
                }
                else {

                    return false

                }
            }


        });
    </script>--%>

</asp:Content>

