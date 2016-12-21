<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayTaxiDetails.aspx.cs" Inherits="Assignment.DisplayTaxiDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">

        body{
            background-image:url(12.jpg);
            background-repeat:no-repeat;
        }

        
        #table1{
            font-size:1.3em;
            width:67%;
            margin:0 auto;
            border:groove;
            border-color:grey;
        }

        #span1{
            font-size:1.3em;
        }

          .myButton {
	-moz-box-shadow: 3px 4px 0px 0px #1564ad;
	-webkit-box-shadow: 3px 4px 0px 0px #1564ad;
	box-shadow: 3px 4px 0px 0px #1564ad;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	border:1px solid #337bc4;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:12px 44px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
}
        


        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <center><h1>Taxi Information</h1>
        </center>

        <br /><center>
            <br /><br /><br />
        <table id="table1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Driver Name </td>
                <td class="auto-style6">:
                    <asp:Label ID="lblDriverName" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">Drive Contact</td>
                <td class="auto-style10">:</td>
                <td class="auto-style1">
                    <asp:Label ID="lblDriveContact" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Plate Number</td>
                <td class="auto-style6">:
                    <asp:Label ID="lblPlateNo" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">Vehicle Type</td>
                <td class="auto-style10">:</td>
                <td class="auto-style1">
                    <asp:Label ID="lblVehicleType" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Vehicle Model</td>
                <td class="auto-style13">:
                    <asp:Label ID="lblVehicleModel" runat="server"></asp:Label>
                </td>
                <td class="auto-style14">Vehicle Color</td>
                <td class="auto-style15">:</td>
                <td class="auto-style16">
                    <asp:Label ID="lblVehicleColor" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Origin</td>
                <td class="auto-style7">:
                    <asp:Label ID="lblOrigin" runat="server"></asp:Label>
                </td>
                <td class="auto-style9">Destination</td>
                <td class="auto-style11">:</td>
                <td>&nbsp;<asp:Label ID="lblDestination" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Estimated Waiting Time</td>
                <td class="auto-style7">:
                    <asp:Label ID="lblWaitTime" runat="server"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table></center>


    <br /><br />
        <center><span id="span1">Your taxi will be arrive latest by 
           <b><asp:Label ID="Label1" runat="server"></asp:Label></b></span></span>
        </center>
        <br />
        <br />

        <br />
        <br />
        <br />
        <br />
        <center>
<asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Back to Home Page" OnClick="Button1_Click1"></asp:Button>
        </center>
    </div>
    </form>
</body>
</html>
