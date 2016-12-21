<%@ Page Language="C#" ErrorPage="~/ReserveOops.aspx" AutoEventWireup="true" CodeBehind="MakeReservation.aspx.cs" Inherits="ProjectTaxiMgmt.MakeReservation" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Make a Reservation</title>
    <style type="text/css">
        .auto-style1 {
            width: 187px;
        }
        .auto-style2 {
            width: 303px;
        }
        .auto-style3 {
            width: 132px;
        }

        .button{
            text-align:center;
        }

        #tbHeading{
            text-align:center;
        }
        .auto-style4 {
            width: 187px;
            height: 42px;
        }
        .auto-style5 {
            width: 303px;
            height: 42px;
        }
        .auto-style6 {
            width: 132px;
            height: 42px;
        }
        .auto-style7 {
            height: 42px;
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
    <div id="AddReservationInput">
        
            <table style="width: 100%;">
                <tr>
                    <td colspan="4" id="tbHeading">
                        <h2>Make a Taxi Reservation</h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        Pickup Date:<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods = "true">
</asp:ScriptManager>
                        
                    </td>
                    <td class="auto-style2">
                        <asp:Calendar ID="calPickupDate" runat="server"></asp:Calendar>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="calPickupDate" ErrorMessage="A Pickup Date has to be selected." ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                    </td>
                    <td class="auto-style3">Pickup Address:</td>
                    <td>
                        <%--<asp:UpdatePanel ID="upPanelPckAdd" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="txtPckAdd" />
                            </Triggers>
                            <ContentTemplate>--%>
                                <asp:TextBox ID="txtPckAdd" runat="server"></asp:TextBox>
                                
                                <cc1:AutoCompleteExtender ServiceMethod="SearchPickupAddress"
    MinimumPrefixLength="2"
    CompletionInterval="1000" EnableCaching="false" CompletionSetCount="10"
    TargetControlID="txtPckAdd"
    ID="autoComExOne" runat="server" FirstRowSelected = "false" UseContextKey="True">
</cc1:AutoCompleteExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A Pickup Address has to be typed." ControlToValidate="txtPckAdd" ForeColor="White">*</asp:RequiredFieldValidator>
                            <%--</ContentTemplate>
                            
                        </asp:UpdatePanel>--%>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Pickup Time:</td>
                    <td class="auto-style5">
                        <cc1:TimeSelector ID="timeSelPckTime" runat="server" DisplaySeconds="False" Hour="12">
</cc1:TimeSelector>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="timeSelPckTime" ErrorMessage="A Pickup Time has to be selected." ForeColor="White">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style6">Destination Address:</td>
                    <td class="auto-style7">
                        <%--<asp:UpdatePanel ID="upPanelDest" runat="server">
                            <ContentTemplate>--%>
                                <asp:TextBox ID="txtDest" runat="server"></asp:TextBox>
                                <cc1:AutoCompleteExtender ServiceMethod="SearchPickupAddress"
    MinimumPrefixLength="2"
    CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
    TargetControlID="txtDest"
    ID="autoComExTwo" runat="server" FirstRowSelected = "false" UseContextKey="True">
</cc1:AutoCompleteExtender>
                           
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="A destination address has to be selected." ControlToValidate="txtDest" ForeColor="White">*</asp:RequiredFieldValidator>
                           
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                        
                    </td>
                </tr>
                <tr>
                    <td id="msgCell" colspan="4">
                       <%-- <asp:UpdatePanel ID="msgUpPanel" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>--%>
                                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="White" />
                    </td>
                </tr>
                <tr>
                    <td class="button" colspan="2">
                        <asp:Button ID="btnSubmit" CssClass="myButton" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                    <td class="button" colspan="2">
                        <asp:Button ID="btnReset" CssClass="myButton" runat="server" Text="Reset" OnClick="btnReset_Click" />
                    </td>
                </tr>
            </table>



        <%--<asp:Label ID="lblTest" runat="server" Text=""></asp:Label>--%>
        
    </div>
    </form>
</body>
</html>
