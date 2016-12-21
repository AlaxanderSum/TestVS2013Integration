<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PastBookingHistory.aspx.cs" Inherits="ProjectTaxiMgmt.PastBookingHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Past Booking History</title>
    <style type="text/css">
        .auto-style1 {
            width: 103px;
        }
        .auto-style2 {
            width: 563px;
        }
        /*.searchBoxRow{
            border-top: 1px solid black;
        }*/

        .borderTop{
            border-top:1px solid black;
        }
        
        .borderTRight{
            border-top:1px solid black;
            border-right:1px solid black;
        }
        body{
  font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            background-size: 200% 200%;

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
        <h3 style="text-align:center;">Past Booking History</h3>
    <div id="searchBox">
        <h3>Search by Criteria(s):</h3>
        <table style="width: 72%; border:1px solid black;">
            <tr class="searchBoxRow">
                <td class="borderTop" colspan="3">You may search for some particular booking record(s) by using the following criteria:</td>
            </tr>
            <tr class="searchBoxRow">
                <td class="borderTRight">
                    <asp:CheckBox ID="chkRsvID" runat="server" AutoPostBack="True" OnCheckedChanged="chkRsvID_CheckedChanged" />
                </td>
                <td class="borderTop">Reservation ID:</td>
                <td class="borderTop">
                    <asp:TextBox ID="txtRsvID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="searchBoxRow">
                <td class="borderTRight">
                    <asp:CheckBox ID="chkRsvDate" runat="server" AutoPostBack="True" OnCheckedChanged="chkRsvDate_CheckedChanged" />
                </td>
                <td class="borderTop">Reservation Date:</td>
                <td class="borderTop">
                    <asp:Calendar ID="calRsvDate" runat="server"></asp:Calendar>
                </td>
            </tr>
                        <tr class="searchBoxRow">
                            <td class="borderTRight">
                                <asp:CheckBox ID="chkOrigin" runat="server" AutoPostBack="True" OnCheckedChanged="chkOrigin_CheckedChanged" />
                            </td>
                <td class="borderTop">Origin:</td>
                <td class="borderTop">
                    <asp:TextBox ID="txtOrigin" runat="server"></asp:TextBox>
                            </td>
            </tr>

                        <tr class="searchBoxRow">
                            <td class="borderTRight">
                                <asp:CheckBox ID="chkDest" runat="server" AutoPostBack="True" OnCheckedChanged="chkDest_CheckedChanged" />
                            </td>
                <td class="borderTop">Destination:</td>
                <td class="borderTop">
                    <asp:TextBox ID="txtDest" runat="server"></asp:TextBox>
                            </td>
            </tr>

                        <tr class="searchBoxRow">
                            <td class="borderTRight">
                                <asp:CheckBox ID="chkVhType" runat="server" AutoPostBack="True" OnCheckedChanged="chkVhType_CheckedChanged" />
                            </td>
                <td class="borderTop">Vehicle Type:</td>
                <td class="borderTop">
                    <asp:DropDownList ID="ddlVhType" runat="server">
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>
                    </asp:DropDownList>
                            </td>
            </tr>

                        <tr class="searchBoxRow">
                            <td class="borderTRight">
                                <asp:CheckBox ID="chkVhPlateNo" runat="server" AutoPostBack="True" OnCheckedChanged="chkVhPlateNo_CheckedChanged" />
                            </td>
                <td class="borderTop">Vehicle Plate No:</td>
                <td class="borderTop">
                    <asp:TextBox ID="txtPlateNo" runat="server"></asp:TextBox>
                            </td>
            </tr>

                        <tr class="searchBoxRow">
                            <td class="borderTRight">
                                <asp:CheckBox ID="chkRsvStatus" runat="server" AutoPostBack="True" OnCheckedChanged="chkRsvStatus_CheckedChanged" />
                            </td>
                <td class="borderTop">Reservation Status</td>
                <td class="borderTop">
                    <asp:DropDownList ID="ddlRsvStatus" runat="server">
                        <asp:ListItem>Complete</asp:ListItem>
                        <asp:ListItem>Incomplete</asp:ListItem>
                    </asp:DropDownList>
                            </td>
            </tr>

                        <tr class="searchBoxRow">
                            <td class="borderTRight">
                                <asp:CheckBox ID="chkDateRange" runat="server" AutoPostBack="True" OnCheckedChanged="chkDateRange_CheckedChanged" />
                            </td>
                <td class="borderTop">Date Range (From):</td>
                <td class="borderTop">
                    <asp:Calendar ID="calDateRangeFrom" runat="server"></asp:Calendar>
                            </td>
            </tr>

                        <tr class="searchBoxRow">
                            <td class="borderTRight">&nbsp;</td>
                <td class="borderTop">Date Range (To):</td>
                <td class="borderTop">
                    <asp:Calendar ID="calDateRangeTo" runat="server"></asp:Calendar>
                            </td>
            </tr>
            <tr class="searchBoxRow">
                <td colspan="2" class="borderTop">

                    <asp:Button ID="btnSearch" CssClass="myButton" runat="server" Text="Search" OnClick="btnSearch_Click" Width="127px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" CssClass="myButton" runat="server" Text="Reset" OnClick="btnReset_Click" />

                </td>
                <td class="borderTop">

                    <asp:Button ID="btnShowAll" CssClass="myButton" runat="server" Text="Show All Records" OnClick="btnShowAll_Click" />

                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
    </div>
        
        <div style="" id="result">
            <h3>All Past Booking History/Search Result(s)</h3>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style2"><asp:GridView ID="gvResult" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ReservationID" DataSourceID="SqlDataSource1" Width="644px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ReservationID" HeaderText="Reservation ID" ReadOnly="True" SortExpression="ReservationID" />
                    <asp:BoundField DataField="ReservationTime" HeaderText="Reservation Date" SortExpression="ReservationTime" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ReservationTime" DataFormatString="{0:hh:mm tt}" HeaderText="Reservation Time" ReadOnly="True" SortExpression="ReservationTime" />
                    <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
                    <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                    <asp:BoundField DataField="TotalCharges" HeaderText="Total Charges" SortExpression="TotalCharges" DataFormatString="RM {0:0.00}" />
                    <asp:BoundField DataField="ReservationStatus" HeaderText="Reservation Status" SortExpression="ReservationStatus" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView></td>
                    <td><asp:DetailsView ID="dvResultDetails" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateRows="False" DataKeyNames="TaxiPlateNo" DataSourceID="SqlDataSource2" Width="248px">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="PickupTime" HeaderText="Pick Up Date" SortExpression="PickupTime" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="PickupTime" DataFormatString="{0:hh:mm tt}" HeaderText="Pick Up Time" />
                            <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Date" SortExpression="ArrivalTime" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="ArrivalTime" DataFormatString="{0:hh:mm tt}" HeaderText="Arrival Time" />
                            <asp:BoundField DataField="TaxiPlateNo" HeaderText="Taxi Plate No" ReadOnly="True" SortExpression="TaxiPlateNo" />
                            <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" DataFormatString="RM {0:0.00}" />
                            <asp:BoundField DataField="Name" HeaderText="Driver Name" SortExpression="Name" />
                        </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebDBConString %>" SelectCommand="Select PickupTime, ArrivalTime, t.TaxiPlateNo, Fare, Name from reservation rsv, route r, pickup pk, taxi t, driver d where rsv.routeid = r.routeid and r.routeid = pk.routeid and rsv.taxiplateno = t.taxiplateno and t.driverid = d.driverid and rsv.reservationid = @rsvID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvResult" DefaultValue="RS0000001" Name="rsvID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            
            
        </div>
        <%--<div style="width:48%;" id="detailView">
            
        </div>--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebDBConString %>" SelectCommand="Select rsv.ReservationID, ReservationTime, Origin, Destination, TotalCharges, ReservationStatus from reservation rsv, route r, pickup pk,  customer c where rsv.customerid = c.customerid and rsv.routeid = r.routeid and r.routeid = pk.routeid"></asp:SqlDataSource>
    </form>
</body>
</html>
