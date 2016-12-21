<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowAvailableTaxi.aspx.cs" Inherits="ProjectTaxiMgmt.ShowAvailableTaxi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Taxis</title>
    <style type="text/css">
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
	font-size:15px;
	padding:12px 20px;
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
        <h3>Please select a taxi in order to proceed with the reservation.</h3>
    <div id="Taxi">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer runat="server" id="refreshTimer" interval="60000" OnTick="refreshTimer_Tick" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="refreshTimer" EventName="Tick" />

            </Triggers>
            <ContentTemplate>

            
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">Date retrieved: <asp:Label ID="lblDateRetrieved" runat="server"></asp:Label></td>
                <td class="auto-style1">Time retrieved: <asp:Label ID="lblTimeRetrieved" runat="server"></asp:Label></td>
                <td class="auto-style1">
                    <asp:Label ID="lblNoOfTaxis" runat="server"></asp:Label> &nbsp;taxis found.
                    
                </td>
            </tr>
            <tr>
                <td id="blankLine" colspan="3">
                    &nbsp
                </td>
            </tr>
        </table>
                <div id="noTaxiMsg" runat="server" style="visibility:hidden;display:none;">
                    <h3>Sorry, there are no taxi(s) available for the PickUp Time that you have selected.</h3>
                    
                    <h3>You may go back to the Reservation Page to select another PickUp Time. Thank you.</h3>
                </div>
        <asp:GridView ID="gvAvailableTaxi" runat="server" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="taxiPlateNo" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvAvailableTaxi_SelectedIndexChanged" SelectedIndex="0">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="taxiPlateNo" HeaderText="Taxi Plate No" SortExpression="taxiPlateNo" ReadOnly="True" />
                <asp:BoundField DataField="vehicleType" HeaderText="Vehicle Type" SortExpression="vehicleType" />
                <asp:BoundField DataField="Fare" HeaderText="Fare per KM" SortExpression="Fare" DataFormatString="RM {0:0.00}" />
                <asp:BoundField DataField="vehicleManufacturer" HeaderText="Vehicle Manufacturer" SortExpression="vehicleManufacturer" />
                <asp:BoundField DataField="vehicleModel" HeaderText="Vehicle Model" SortExpression="vehicleModel" />
                <asp:BoundField DataField="vehicleColour" HeaderText="Vehicle Colour" SortExpression="vehicleColour" />
                <asp:BoundField DataField="driverID" HeaderText="Driver ID" SortExpression="driverID" />
                <asp:BoundField DataField="Name" HeaderText="Driver Name" SortExpression="Name" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
                <br />
                <asp:Button ID="btnProceed" CssClass="myButton" runat="server" OnClick="btnProceed_Click" Text="Proceed" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBack" CssClass="myButton" runat="server" OnClick="btnBack_Click" Text="Back To Reservation Page" />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebDBConString %>" SelectCommand="select t.taxiPlateNo, vehicleType, Fare, vehicleManufacturer, vehicleModel, vehicleColour, t.driverID, d.Name from taxi t, driver d where t.DriverID = d.DriverID and t.TaxiPlateNo in (select taxiPlateNo from taxi where TaxiPlateNo not in (select distinct taxiPlateNo from reservation where ReservationID in (select rsv.reservationid from reservation rsv, route r, pickup pk where rsv.RouteID = r.RouteID and r.routeid = pk.routeid and pk.pickupid in (select pickupid from (select * from PickUp pk where pk.Status = 'Incomplete') as &quot;IncompletePickUpList&quot; where @NewPickupTime between PickUpTime and DateAdd(minute,15,EstimatedArrivalTime) or @NewEstArrTime between PickUpTime and DateAdd(minute,15,EstimatedArrivalTime)))))">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="12/08/2016 10:30:00 AM" Name="NewPickupTime" SessionField="NewPickupTime" />
                        <asp:SessionParameter DefaultValue="12/08/2016 11:00:00 AM" Name="NewEstArrTime" SessionField="NewEstArrTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;<br />
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
        <%--<asp:Label ID="lblTest" runat="server" Text=""></asp:Label>--%>
    </form>
</body>
</html>
