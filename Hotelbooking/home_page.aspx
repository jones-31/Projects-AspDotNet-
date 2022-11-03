<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_page.aspx.cs" Inherits="Hotelbooking.admin_panel" %>

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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>


</head>
<body>
    <nav class="navbar navbar-expand-lg" style="height: 100px; background-color: #575757">
        <div class="container-fluid">

            <a class="navbar-brand" href="#">
                <img src="/Images/hotelbooking_logo.png" width="50" height="50" /></a>

            <a class="navbar-brand" href="#">
                <h2 style="margin-right:1500px;">HOYO</h2>
            </a>
        </div>
    </nav>
    <form runat="server">
        <section class="vh-100 gradient-custom">
            <div class="container py-5 "  style="height:900px;">
                <div class="row d-flex justify-content-center align-items-center h-100" >
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                    <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                    <%--email id for login--%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="user_emailid" class="form-control form-control-lg" runat="server" placeholder="Email" AutoComplete="off"></asp:TextBox>
                                        <div id="email_id"></div>

                                    </div>
                                    <%--password for login--%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox ID="user_password" class="form-control form-control-lg" runat="server" placeholder="Password" AutoComplete="off"></asp:TextBox>
                                        <div id="password_lgn"></div>


                                    </div>
                                    <%--select user type--%>
                                    <div class="form-outline form-white mb-4">
                                        <asp:RadioButton ID="radioadmin" runat="server" class="form-check-input" GroupName="usertype" Text="Admin"  ForeColor="white" BackColor="#212529"/>
                                       


                                        <asp:RadioButton ID="radiouser" runat="server" class="form-check-input" GroupName="usertype" Text="User" ForeColor="white" BackColor="#212529" />
                                        
                                        <div id="radio_val"></div>

                                    </div>

                                    <asp:Button ID="loginbtn" class="btn btn-outline-light btn-lg px-5" runat="server" OnClick="loginbtn_Click" Text="Login" />



                                </div>

                                <div>
                                    <p class="mb-0">
                                        Don't have an account? <a href="registration.aspx" class="text-white-50 fw-bold">Sign Up as User</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="bg-dark text-center text-white ">
            <!-- Grid container -->
            <div class="container p-4 pb-0" style="margin-top:150px;">
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



    </form>

    <script>
        $(document).ready(function () {
            var regex_email = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var email_err = true;
            var password_err = true;

            $('#email_id').hide();
            $('#password_lgn').hide();
            $('#radio_val').hide();

            $('#user_password').keyup(function () {
                password_check();
            });

            $('#user_emailid').keyup(function () {
                useremid_check();
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

            $('#loginbtn').click(function () {
                var email_err = true;
                var password_err = true;
                password_check();
                useremid_check();

                if ((email_err == true) && (password_err == true) && ($("input:radio[name='usertype']").is(':checked'))) {

                    return true
                }
                else {
                    $('#radio_val').show();
                    $('#radio_val').html('**Select your type.').fadeOut(1000);
                    $('#radio_val').focus();
                    $('#radio_val').css('color', 'red');
                    return false

                }

            });
        });
    </script>


</body>
</html>
