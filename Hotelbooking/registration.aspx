<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Hotelbooking.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%--     <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
   <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/jquery-3.4.1.min.js"></script>--%>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <!--jquery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar  navbar-expand-lg" style="height: 100px; background-color: #575757">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="../../Images/hotelbooking_logo.png" width="50" height="50" /></a>

                <a class="navbar-brand" href="#">
                    <h2 style="margin-right: 1250px;">HOYO</h2>

                </a>
                <asp:Button ID="login_home" runat="server" class="btn btn-outline-success" Text="Login" OnClick="login_home_Click" Height="50px" Style="float: right;" />









            </div>
        </nav>


        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Registeration form</h2>
                                    <div class="form-outline form-white mb-4">
                                        <%--First name --%>
                                        <asp:TextBox ID="fname" class="form-control form-control-lg" placeholder="First Name" autocomplete="off" runat="server"></asp:TextBox>
                                        <div id="fname_val"></div>

                                    </div>
                                    <%--Second name --%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="lname" class="form-control form-control-lg" placeholder="Last Name" autocomplete="off" runat="server"></asp:TextBox>
                                        <div id="lname_val"></div>


                                    </div>
                                    <%--Mobile No. --%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="phoneno" class="form-control form-control-lg" placeholder="Mobile No." autocomplete="off" runat="server" AutoPostBack="true" OnTextChanged="phoneno_TextChanged1" MaxLength="10"></asp:TextBox>
                                        <div id="phone_val"></div>
                                        <asp:Label ID="mobileval" runat="server" ForeColor="Red"></asp:Label>


                                    </div>
                                    <%--Address --%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="addr" class="form-control form-control-lg" placeholder="Address" autocomplete="off" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <div id="addr_val"></div>


                                    </div>
                                    <%--documents dropdown --%>

                                    <asp:DropDownList ID="DropDownList1" DataTextField="doc_name" DataValueField="docno" class="btn btn-secondary dropdown-toggle" runat="server">
                                    </asp:DropDownList>
                                    <%--+'~'+minval+'~'+maxval--%>
                                    <%--  <div class="form-outline form-white mb-4">
                                           
                                            <%--<div class="dropdown">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Select Document 
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-dark">
                                                </ul>
                                            </div>
                                        </div>--%>

                                    <div class="form-outline form-white mb-4">
                                        <div class="mb-3">
                                            <label for="formFileSm" class="form-label">
                                                <br />
                                                Upload your document below</label>
                                            <asp:FileUpload ID="docufile" class="form-control form-control-sm" runat="server" />
                                            <div id="docu_val"></div>
                                            <asp:Label ID="Lbldocval" runat="server" ForeColor="Red"></asp:Label>
                                        </div>
                                    </div>


                                    <%--User Documents --%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="user_docno" class="form-control form-control-lg" placeholder="Enter document number" autocomplete="off" runat="server" OnTextChanged="user_docno_TextChanged"></asp:TextBox>
                                        <div id="docno_val"></div>
                                        <asp:Label ID="docnu_val" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                        <asp:Label ID="docmin" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="docmax" runat="server" Visible="false"></asp:Label>

                                    </div>
                                    <%--email id for login--%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="user_emailid" class="form-control form-control-lg" runat="server" placeholder="Email" AutoComplete="off" OnTextChanged="user_emailid_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        <div id="email_id"></div>
                                        <asp:Label ID="emidval" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                    <%--password for login--%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="user_password" class="form-control form-control-lg" runat="server" placeholder="Password" AutoComplete="off"></asp:TextBox>
                                        <div id="password_lgn"></div>
                                    </div>

                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="user_confirm_password" class="form-control form-control-lg" runat="server" placeholder="Re-Password" AutoComplete="off"></asp:TextBox>
                                        <div id="repassword_lgn"></div>


                                    </div>

                                    <div class="form-outline form-white mb-4">
                                        <%-- document type--%>
                                    </div>

                                    <asp:Button ID="register_btn" class="btn btn-outline-light btn-lg px-5" runat="server" Text="Register" OnClick="register_btn_Click" UseSubmitBehavior="false" />



                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>





    </form>

    <footer class="bg-dark text-center text-white " style="margin-top: 30px;">
        <!-- Grid container -->
        <div class="container p-4 pb-0" style="margin-top: 450px;">
            <!-- Section: Social media -->
            <section class="mb-4">
                <!-- Facebook -->
                <a
                    class="btn text-white btn-floating m-1"
                    style="background-color: #3b5998;"
                    href="#!"
                    role="button"><i class="fab fa-facebook-f"></i></a>

                <!-- Twitter -->
                <a
                    class="btn text-white btn-floating m-1"
                    style="background-color: #55acee;"
                    href="#!"
                    role="button"><i class="fab fa-twitter"></i></a>

                <!-- Google -->
                <a
                    class="btn text-white btn-floating m-1"
                    style="background-color: #dd4b39;"
                    href="#!"
                    role="button"><i class="fab fa-google"></i></a>

                <!-- Instagram -->
                <a
                    class="btn text-white btn-floating m-1"
                    style="background-color: #ac2bac;"
                    href="#!"
                    role="button"><i class="fab fa-instagram"></i></a>

                <!-- Linkedin -->
                <a
                    class="btn text-white btn-floating m-1"
                    style="background-color: #0082ca;"
                    href="#!"
                    role="button"><i class="fab fa-linkedin-in"></i></a>
                <!-- Github -->
                <a
                    class="btn text-white btn-floating m-1"
                    style="background-color: #333333;"
                    href="#!"
                    role="button"><i class="fab fa-github"></i></a>
            </section>
            <!-- Section: Social media -->
        </div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2020 Copyright:
    <a class="text-white" href="https://google.com/">hoyo.com</a>
        </div>
        <!-- Copyright -->
    </footer>

    <script>
        $(document).ready(function () {
            var regex_email = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var email_err = true;
            var password_err = true;
            var conpassword_err = true;
            var regex_name = /^[a-zA-Z]+$/;
            var fname_err = true;
            var lname_err = true;
            var phone_err = true;
            var addr_err = true;
            var docno_err = true;


            $('#fname_val').hide();
            $('#lname_val').hide();
            $('#phone_val').hide();
            $('#addr_val').hide();
            $('#email_id').hide();
            $('#password_lgn').hide();
            $('#docno_val').hide();


            $('#user_password').keyup(function () {
                password_check();
            });

            $('#user_emailid').keyup(function () {
                useremid_check();
            });

            $('#user_confirm_password').keyup(function () {
                repassword_check();
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
            //$('#user_docno').keyup(function () {
            //    docno_check();
            //});

            //function docno_check() {
            //    var docnumber = $('#user_docno').val();
            //    var docnumber1 = (docnumber).replace(/\s+/g,"");
            //    var mindoc = $('#docmin').val();
            //    var maxdoc = $('#docmax').val();

            //    //if ((docnumber1.length < mindoc) && (docnumber1.length > maxdoc)) {

            //    //    $('#docno_val').show();
            //    //    $('#docno_val').html("Pan number should have the format ABCDE1234A");
            //    //    $('#docno_val').focus();
            //    //    $('#docno_val').css('color', 'red');
            //    //    var docno_err = false;
            //    //    return false

            //    //}
            //    //else {
            //    //    $('#docno_val').hide();
            //    //}
            //    // if ($('#DropDownList1 option:selected ').text() == 'Pan') {



            //    //    var regex_pan = /^([A-Z]{5}[0-9]{4}[A-Z]{1})+$/;

            //    //    if (!regex_pan.test(docnumber1)) {
            //    //        $('#docno_val').show();
            //    //        $('#docno_val').html("Pan number should have the format ABCDE1234A");
            //    //        $('#docno_val').focus();
            //    //        $('#docno_val').css('color', 'red');
            //    //        var docno_err = false
            //    //        return false

            //    //    }
            //    //    else {
            //    //        $('#docno_val').hide();
            //    //    }

            //    //}
            //    //else if ($('#DropDownList1 option:selected').text() == 'Aadhar') {
            //    //    var regex_aadhar = /^([0-9]{12})+$/;

            //    //    if (!regex_aadhar.test(docnumber1)) {
            //    //        $('#docno_val').show();
            //    //        $('#docno_val').html("Aadhar number should have the format 1234 1234 1234");
            //    //        $('#docno_val').focus();
            //    //        $('#docno_val').css('color', 'red');
            //    //        var docno_err = false
            //    //        return false

            //    //    }
            //    //    else {
            //    //        $('#docno_val').hide();
            //    //    }
            //    // }

            //}
            function repassword_check() {
                var conpsed = $('#user_confirm_password').val();

                if (conpsed == "") {
                    $('#repassword_lgn').show();
                    $('#repassword_lgn').html("**Password should not be empty");
                    $('#repassword_lgn').focus();
                    $('#repassword_lgn').css('color', 'red');
                    conpassword_err = false;

                    return false


                }
                else if (conpsed != $('#user_password').val()) {
                    $('#repassword_lgn').show();
                    $('#repassword_lgn').html("**Password should be the same as the one entered before");
                    $('#repassword_lgn').focus();
                    $('#repassword_lgn').css('color', 'red');
                    conpassword_err = false;

                    return false


                }
                else {
                    $('#repassword_lgn').hide();
                }

            }

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

            $('#register_btn').click(function () {
                email_err = true;
                password_err = true;
                conpassword_err = true;
                fname_err = true;
                lname_err = true;
                phone_err = true;
                addr_err = true;
                //docno_err = true;
                /*&& (docno_err == true)*/

                password_check();
                useremid_check();
                repassword_check();
                userfname_check();
                userlname_check();
                userphone_check();
                useraddr_check();
                /*  docno_check();*/

                if ((email_err == true) && (password_check == true) && (conpassword_err = true) && (fname_err = true) && (lname_err = true) && (phone_err = true) && (addr_err = true)
                ) {

                    return true
                }
                else {

                    return false

                }

            });
        });
    </script>
</body>
</html>
