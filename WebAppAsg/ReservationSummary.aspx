<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationSummary.aspx.cs" Inherits="ProjectTaxiMgmt.ReservationSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservation Summary</title>
    <style>

        #bigTitle{
            text-align:center;
        }

        #rsvTableHeading{
            text-align:center;
        }

        .button{
            text-align:center;
        }

        #taxiDetailsHeading{
            text-align:center;
        }

       

        .auto-style1 {
            height: 23px;
        }

       body{
  font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            /*width:60%;*/
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
	font-size:12px;
	padding:12px 12px;
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
        <h3 id="bigTitle">Reservation Summary</h3>
    <div id="rsvDetails">
        <table style="width: 98%;">
            <tr>
                <td colspan="4" id="rsvTableHeading">Reservation Details</td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style17">Reservation ID:</td>
                <td colspan="2" class="auto-style17">

                    <asp:Label ID="lblRsvID" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style4">Reservation Date:</td>
                <td class="auto-style5">
                    <asp:Label ID="lblRsvDate" runat="server"></asp:Label>
                </td>
                <td class="auto-style6">Reservation Time:</td>
                <td class="auto-style7">
                    <asp:Label ID="lblRsvTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Pickup Date:</td>
                <td class="auto-style5">
                    <asp:Label ID="lblPckDate" runat="server"></asp:Label>
                </td>
                <td class="auto-style6">Pickup Time:</td>
                <td class="auto-style7">
                    <asp:Label ID="lblPckTime" runat="server"></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="auto-style1">Pickup Address:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblPckAddress" runat="server"></asp:Label>
                            </td>
                <td class="auto-style3">Pickup Destination:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblPckDest" runat="server"></asp:Label>
                            </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    Estimated Arrival Time:</td>
                <td class="auto-style1">

                    <asp:Label ID="lblEstArrTime" runat="server"></asp:Label>

                </td>
                <td class="auto-style1">

                    </td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="lblAddToFav" CssClass="myButton" runat="server" Text="Add to Favourites" OnClick="lblAddToFav_Click" />
    </div>

        <div id="divAddNewFavLoc" runat="server" style="display:none; visibility:hidden;">
            Please enter a name for the favourite location:
            <asp:TextBox ID="txtNewFavLocName" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAddFavLoc" runat="server" Text="Add" OnClick="btnAddFavLoc_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancelAddFavLoc" runat="server" Text="Cancel Add Favourite Location" OnClick="btnCancelAddFavLoc_Click" />
            <br />
            <asp:Label ID="lblAddFavLocMsg" runat="server"></asp:Label>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" Visible="False" />
        </div>

        <br />
        <br />

        <div id="taxiDetails">
            <table style="width: 98%;">
                <tr>
                    <td colspan="4" id="taxiDetailsHeading">Selected Taxi Details</td>
                </tr>
                <tr>
                    <td class="vh">Vehicle Manufacturer:</td>
                    <td>
                    <asp:Label ID="lblVhMake" runat="server"></asp:Label>
                            </td>
                    <td class="auto-style11">Vehicle Model:</td>
                    <td>
                    <asp:Label ID="lblVhModel" runat="server"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="vh">Vehicle Type:</td>
                    <td class="auto-style15">
                    <asp:Label ID="lblVhType" runat="server"></asp:Label>
                            </td>
                    <td class="vh">Vehicle Colour:</td>
                    <td class="auto-style17">
                        <asp:Label ID="lblvhColour" runat="server"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="vh">Vehicle Plate Number:</td>
                    <td class="auto-style15">
                    <asp:Label ID="lblVhPlateNo" runat="server"></asp:Label>
                            </td>
                    <td class="auto-style16">Fare:</td>
                    <td class="auto-style17">
                        RM
                    <asp:Label ID="lblFare" runat="server"></asp:Label>
                            &nbsp;per km</td>
                </tr>
                  <tr>
                    <td class="auto-style14">Driver ID:</td>
                    <td class="auto-style15">
                        <asp:Label ID="lblDrvID" runat="server"></asp:Label>
                            </td>
                    <td class="auto-style16">Driver Name:</td>
                    <td class="auto-style17">
                    <asp:Label ID="lblDrvName" runat="server"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td colspan="2">

                    </td>
                    <td colspan="2">

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style13">

                        <asp:Button ID="btnConfirm" CssClass="myButton" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />

                    </td>
                    <td colspan="2" class="auto-style13">

                        <asp:Button ID="btnCancel" runat="server" CssClass="myButton" Text="Cancel" OnClick="btnCancel_Click" />

                    </td>
                </tr>
            </table>
        </div>
        
    </form>
</body>
</html>
