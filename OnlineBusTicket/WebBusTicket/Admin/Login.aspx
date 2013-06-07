<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login Admin</title>
    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Page/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="Page/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <!-- Theme :: Beauty Admin  -->
    <link href="Page/theme/beautyadmin/css/beautyadmin.css" rel="stylesheet">
    <!--  Google Open Sans Font -->
    <link href="http://fonts.googleapis.com/css@family=Open+Sans_3A300,400,600,700&lang=en"
        rel="stylesheet">
    <!-- Jquery Latest -->
    <script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
</head>
<body class="login">
    <form id="main" runat="server">
    <!-- Top Gray Line -->
    <div class="navbar navbar-fixed-top top-line">
        <div class="container">
            <a href="#" class="brand"><strong>Admin</strong></a>
        </div>
    </div>
    <!--  End Top Gray Line-->
    <!-- Login Box -->
    <div class="containter">
        <div class="well login-form" id="form">
            <legend>
                <icon class="icon-circles"></icon>
                Restricted Area<icon class="icon-circles-reverse"></icon></legend>
            <div class="control-group">
                <label class="control-label" for="inputPassword">
                    Username</label>
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on">
                            <icon class="icon-user icon-cream"></icon>
                        </span>
                        <asp:TextBox runat="server" class="input" type="text" id="txtUsername" value="username" placeholder="username" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">
                    Password</label>
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on">
                            <icon class="icon-password icon-cream"></icon>
                        </span>
                        <asp:TextBox runat="server" class="input" type="password" id="txtPassword" value="password" />
                    </div>
                </div>
            </div>
            <div class="control-group signin">
                <div class="controls ">
                    <asp:Button runat="server" type="submit" class="btn btn-block" id="btnSubmit" 
                        Text="Sign in" onclick="btnSubmit_Click"/>
                        
                    <div class="clearfix">
                        <span class="icon-forgot"></span><a href="#">forgot your password?</a>
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  End Login Box-->
    <!-- Footer Login  -->
    <div class="footer" align="center">
        <p>
            &copy; Online Bus Ticket</p>
    </div>
    <!--  End Footer Login -->
    <!-- Bootstrap JS -->
    <script src="Page/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
