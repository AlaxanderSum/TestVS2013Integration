<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppAsg.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            width: 281px;
        }
        .auto-style5 {
            width: 83px;
        }
        </style>
    <style>
        body{
  font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            width:60%;
            margin-top:100px;
           
            margin-left:50px;
}
  .myButton {
	-moz-box-shadow:inset 0px 0px 0px 2px #050505;
	-webkit-box-shadow:inset 0px 0px 0px 2px #050505;
	box-shadow:inset 0px 0px 0px 2px #050505;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #636163), color-stop(1, #000000));
	background:-moz-linear-gradient(top, #636163 5%, #000000 100%);
	background:-webkit-linear-gradient(top, #636163 5%, #000000 100%);
	background:-o-linear-gradient(top, #636163 5%, #000000 100%);
	background:-ms-linear-gradient(top, #636163 5%, #000000 100%);
	background:linear-gradient(to bottom, #636163 5%, #000000 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#636163', endColorstr='#000000',GradientType=0);
	background-color:#636163;
	border:1px solid #0a0a0a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:19px;
	padding:12px 42px;
	text-decoration:none;
	text-shadow:0px 1px 0px #000000;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #636163));
	background:-moz-linear-gradient(top, #000000 5%, #636163 100%);
	background:-webkit-linear-gradient(top, #000000 5%, #636163 100%);
	background:-o-linear-gradient(top, #000000 5%, #636163 100%);
	background:-ms-linear-gradient(top, #000000 5%, #636163 100%);
	background:linear-gradient(to bottom, #000000 5%, #636163 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000', endColorstr='#636163',GradientType=0);
	background-color:#000000;
}
.myButton:active {
	position:relative;
	top:1px;
}



       a#link:link,  a#link:visited {
    float:right;
    background-color: #0094ff;
    color: white;
    padding: 5px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
a#link:hover,  a#link:active {
    background-color: #4800ff;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h3>EzCab Taxi Management System</h3>
        <table>
            <tr>
                <td class="auto-style5">Username</td>
                <td class="auto-style4">: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Password</td>
                <td class="auto-style4">: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="txtLogin" runat="server"  Text="Login" OnClick="txtLogin_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="txtClear" runat="server"  Text="Clear" OnClick="txtClear_Click" />
                </td>
            </tr>
        </table>
    <br />
      For New User Please <asp:HyperLink ID="txtLink" runat="server" NavigateUrl="~/Outsider/CustomerRegistration.aspx">Click Here</asp:HyperLink>.
    </div>
    </form>
</body>
</html>
