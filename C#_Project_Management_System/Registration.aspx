<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="C__Project_Management_System.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup Page</title>
   
    <link href="CSS/registation.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" >
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->

<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<body>
    <form id="form1" runat="server">
        <!-- main -->
        <div class="main-w3layouts wrapper">
            <h1>Welcome to Registation Form</h1>
            <div class="main-agileinfo">
                <div class="agileits-top">
                    
                    
                    <asp:TextBox ID="TextBox1" runat="server" class="text" Text="UserName" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" class="text email" Text="Email" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server" class="text" Text="Password"></asp:TextBox>
                    <asp:TextBox ID="TextBox4" runat="server" class="text w3lpass" Text="Role(Student/Industry Professional)"></asp:TextBox>

                    <div class="wthree-text">
                        <label class="anim">
                            <input type="checkbox" class="checkbox" required="">
                            <span>I Agree To The Terms & Conditions</span>
                        </label>
                        <div class="clear"> </div>
                    </div>
                    
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                </div>
            </div>
            <div class="colorlibcopy-agile">
                <p>© 2024 PMS Signup Form. All rights reserved | Design by <a href="Project Management System" target="_blank">Colorlib</a></p>
            </div>
            <ul class="colorlib-bubbles">
                <li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>
            </ul>
        </div>
        <!-- //main -->
    </form>
</body>
</html>
