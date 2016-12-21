<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendArrivalEmail.aspx.cs" Inherits="WebAppAsg.SendArrivalEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 125px;
        }
        .auto-style3 {
            width: 48px;
        }
        .auto-style4 {
            width: 142px;
            height: 23px;
        }
        .auto-style5 {
            width: 48px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
            width: 164px;
        }

         html, body { min-height: 100%; }
         body{
            font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            width:50%;
            margin:0 auto;
        }
        
         
         #Button1{
             float:right;
             position:relative;
            bottom:0;
            font-size:15px;
            
        }
         #option{
             opacity:0,0;
             width:50%;
             margin:0 auto;
             text-align:center;

         }

          #Button1{
              cursor:pointer;
            left: 0px;
            background-color:aliceblue
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

.myButton1 {

	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
	background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
	background-color:#f9f9f9;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:4px 18px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton1:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
.myButton1:active {
	position:relative;
	top:1px;
}
        .auto-style7 {
            width: 180px;
        }
        .auto-style8 {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    
        <h1>Send Arrival Email</h1>
        <table>
            <tr>
                <td class="auto-style2">Driver ID</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="TextBoxDriverID" runat="server" Height="41px" Width="305px" Enabled="False" >DR001</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Driver Name</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="TextBoxName" runat="server" Height="41px" Width="305px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Taxi Plate No</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="TextBoxTaxiNo" runat="server" Height="41px" Width="305px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
       
        <p>
            Current Time:
            <asp:UpdatePanel runat="server" id="UpdatePanel1">
<ContentTemplate>
<asp:Timer runat="server" id="Timer1" Interval="100" OnTick="Timer1_Tick"></asp:Timer>
<asp:Label runat="server" id="lblTime">
</asp:Label>
</ContentTemplate>
</asp:UpdatePanel>
        </p>
     
        <br /><fieldset  style="width:70%;">
            <legend>Arrival Email Content:</legend>
            Hi <asp:Label ID="lblCustName" runat="server" ForeColor="#0000CC"></asp:Label>
            , the content showed below are the arrival details.
            <br />
            Please be prepared, we are going to fetch you now :D<br />
&nbsp;<table style="width:70%">
            <tr>
                <td class="auto-style4">Reservation ID</td>
                <td class="auto-style5">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblReservationID" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Customer ID</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                   <asp:Label ID="lblCustomerID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Origin</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblOrigin" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Destination</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblDestination" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Pick Up Date</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                   <asp:Label ID="lblPickUpDate" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Pick Up Time</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblPickUpTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Your Driver:</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblDriver" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Taxi Plate Number</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblTaxiNo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Vehiche Model</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblModel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Vehiche Colour</td>
                <td class="auto-style3">:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblColor" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
            <br />
            From EzCab<br />
        </fieldset>
        <br />
        <asp:Label ID="lblEmail" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Button ID="btnSend" runat="server" Text="Send Email" OnClick="Button1_Click" class="myButton"/>
       
        <br />
   
    </div>
    </form>
</body>
</html>
