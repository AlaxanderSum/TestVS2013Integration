<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="custHome.aspx.cs" Inherits="ProjectTaxiMgmt.custHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Home Page</title>
    <style>
        #taskDiv table td{
            text-align:center;
            padding-top:0.5em;
            padding-bottom:0.5em;
        }

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
    <div style="margin-left: 680px">
    </div>

    <form id="form1" runat="server">
        <div style="margin-left: 440px">
            <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="myButton" Text="Logout" />
        </div>

        <h2>Customer Main Menu</h2>
        <p>Welcome to the Taxi Management System. You may make a new reservation, add/view favourite location, view/search past booking history by clicking one of the buttons below:</p>    

        <div id="taskDiv">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <b>To begin, please select one of the tasks below:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnRsv" class="myButton" runat="server" Text="Make a New Reservation" OnClick="btnRsv_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAddFav" class="myButton" runat="server" Text="Add a Favourite Location" OnClick="btnAddFav_Click" />
                    </td>
                </tr>
                                <tr>
                    <td>
                        <asp:Button ID="viewFav" class="myButton" runat="server" Text="View Added Favourite Location" OnClick="viewFav_Click" />
                                    </td>
                </tr>

                                <tr>
                    <td>
                        <asp:Button ID="btnPastHistory" class="myButton" runat="server" Text="View/Search Past History" OnClick="btnPastHistory_Click" />
                                    </td>
                </tr>

                                <tr>
                    <td>
                        <asp:Button ID="btnEdit" class="myButton" runat="server" Text="Edit Personal Information" OnClick="btnEdit_Click" />
                                    </td>
                </tr>

            </table>
    </div>
    </form>
</body>
</html>
