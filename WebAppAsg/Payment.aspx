    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Assignment.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function confirmM() {
            var con = confirm("Are you sure you want to cancel payment?");

            if (con == true)
                window.location = "PaymentFail.aspx";
            else
                return false;
        }
    </script>
    <style type="text/css">
        body{
            background-image:url(12.jpg);
            background-repeat:no-repeat;

        }

        .auto-style1 {
            width: 654px;
        }

        .myButton1 {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf));
	background:-moz-linear-gradient(top, #ededed 5%, #dfdfdf 100%);
	background:-webkit-linear-gradient(top, #ededed 5%, #dfdfdf 100%);
	background:-o-linear-gradient(top, #ededed 5%, #dfdfdf 100%);
	background:-ms-linear-gradient(top, #ededed 5%, #dfdfdf 100%);
	background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf',GradientType=0);
	background-color:#ededed;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:9px 23px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton1:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed));
	background:-moz-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
	background:-webkit-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
	background:-o-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
	background:-ms-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
	background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed',GradientType=0);
	background-color:#dfdfdf;
}
.myButton1:active {
	position:relative;
	top:1px;
}
    </style>
</head>
<body>
    <div>
        <center><h2>&nbsp;</h2>
            <h2>&nbsp;</h2>
            <h2>&nbsp;</h2>
            <h2>&nbsp;</h2>
            <h2>&nbsp;</h2>
            <h2>Taxi Reservation Fees :RM  <%= Amounts %></h2>
            <p>&nbsp;</p>
            <p>&nbsp;</p></center>
    </div>
    <center>
<form name="_xclick" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" >
    <input type="hidden" name="cmd" value="_xclick">
    <input type="hidden" name="business" value="WADseller@hotmail.com">
    <input type="hidden" name="currency_code" value="MYR">
    <input type="hidden" name="item_name" value="Taxi Reservation Fees">
    <input type="hidden" name="amount" value="<%= Amounts %>">
    <input type="hidden" name="return" value="<%= Host %>DisplayTaxiDetails.aspx" />
    <input type="hidden" name="cancel_return" value="<%= Host %>PaymentFail.aspx" />
    <input type="hidden" name="item_number" value="<%= RegNo %>" />
<center><table style="width:15%;"><tr><td class="auto-style1">

<input type="image" src="payButton.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!"></td><td><button class="myButton1" type="button" style="width:135px;height:40px" onclick="confirmM();">Cancel</button>
    </td></tr></table></center>
    </form></center>
</body>
</html>
