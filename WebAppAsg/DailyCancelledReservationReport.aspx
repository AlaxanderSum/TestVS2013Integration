<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyCancelledReservationReport.aspx.cs" Inherits="ProjectTaxiMgmt.DailyCancelledReservationReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Daily Cancelled Reservation Report</title>
    <style>
        #divReport{
            text-align:center;
            width:60%;
            margin-left:20%;
            margin-right:20%;
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
        <h2 style="text-align:center;">Daily Cancelled Reservation Report</h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <h3>Please select a date to generate the "Daily Cancelled Reservation Report" for the particular day:</h3>

        <div>
            <table style="width: 100%;">
                <tr>
                    <td>Report For:</td>
                    <td>
            <asp:Calendar ID="calRepDate" runat="server" OnSelectionChanged="calRepDate_SelectionChanged"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
            <asp:Button ID="btnGo" CssClass="myButton" runat="server" Text="Go" OnClick="btnGo_Click" />
                    </td>
                </tr>
            </table>

            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        

    <div id="divReport">
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="900px" style="margin-left: 0px">
            <LocalReport ReportPath="DailyCancelRsvRptDsgn.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="WebAppAsg.DailyCancellationDSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebDBConString %>" SelectCommand="Select rsv.reservationID, rsv.ReservationTime, rsv.ReservationTime, rsv.routeid, r.origin, r.destination, pk.pickupID, rsv.taxiplateno, totalcharges from reservation rsv, route r, taxi t, pickup pk where rsv.routeid = r.routeid and rsv.taxiplateno = t.taxiplateno and pk.routeid = r.routeid and pk.status = 'Cancelled' and cast(reservationtime as Date) = cast(@rsvDate as Date)">
            <SelectParameters>
                <asp:SessionParameter Name="rsvDate" SessionField="DCRReportDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ProjectTaxiMgmt.DailyCancellationDSetTableAdapters.DataTable1TableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
