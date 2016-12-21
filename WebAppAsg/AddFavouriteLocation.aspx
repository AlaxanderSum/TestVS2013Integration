<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFavouriteLocation.aspx.cs" Inherits="ProjectTaxiMgmt.AddFavouriteLocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Add Favourite Location</title>
    <style type="text/css">
        .auto-style1 {
            width: 359px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            width: 200px;
        }
        .auto-style10 {
            height: 23px;
            width: 359px;
        }

        .button{
            text-align:center;
        }

        .auto-style11 {
            text-align: center;
            width: 359px;
        }
        .auto-style13 {
            text-align: center;
            width: 216px;
        }

        .auto-style14 {
            width: 216px;
        }
        .auto-style15 {
            height: 23px;
            width: 216px;
        }

        #msgCell{
            text-align:center;
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
    <form id="form1" runat="server">
    <div>
        <h3 style="text-align:center;">Add A Favourite Location</h3>
        <table style="width: 100%;">
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="auto-style1">Name:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" ForeColor="White" ValidationGroup="valiFav">*</asp:RequiredFieldValidator>
                </td>
                <td colspan="2">

                </td>
            </tr>
            <tr>
                <td class="auto-style10">Origin:</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtOrigin" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOrigin" ErrorMessage="RequiredFieldValidator" ForeColor="White" ValidationGroup="valiFav">*</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style7">Destination:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDest" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDest" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="valiFav">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="4">&nbsp</td>
            </tr>
            <tr>
                <td colspan="4" id="msgCell">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">&nbsp</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="White" ValidationGroup="valiFav" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11" >
                    <asp:Button ID="btnAdd" class="myButton" runat="server" Text="Add" OnClick="btnAdd_Click" />
                </td>
                <td class="auto-style13">
                    <asp:Button ID="btnReset" class="myButton" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </td>
                <td colspan="2" class="button">
                    <asp:Button ID="btnView" class="myButton" runat="server" Text="View added favourite location" OnClick="btnView_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
