<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyRsvReport.aspx.cs" Inherits="ProjectTaxiMgmt.MonthlyRsvReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monthly Reservation Report</title>
    <style>

        #divReport{
            text-align:center;
            width:96%;
            margin-left:2%;
            margin-right:2%;
        }
        .auto-style1 {
            height: 30px;
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
        <h2 style="text-align:center;">Monthly Reservation Report</h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <h3>Please select a year to generate the &quot;Monthly Reservation Report&quot; for the selected year:</h3>
        <div>
            <table style="width: 66%;">
                <tr>
                    <td class="auto-style1">Year:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYear" ErrorMessage="Year is required" ForeColor="White">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtYear" ErrorMessage="RangeValidator" ForeColor="White" MaximumValue="2016" MinimumValue="1980" Type="Integer">*</asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="White" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">

                        <asp:Button ID="btnGo" CssClass="myButton" runat="server" OnClick="btnGo_Click" Text="Go" />

                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div id="divReport">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="825px">
                <LocalReport ReportPath="MonthlyRsvRptDsgn.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="ProjectTaxiMgmt.MonthlyRsvRptDSTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ProjectTaxiMgmt.MonthlyRsvReportDSTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebDBConString %>" SelectCommand="select (select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @JanStart and @JanEnd) as January,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @FebStart and @FebEnd) as February,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @MacStart and @MacEnd) as March,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @AprStart and @AprEnd) as April,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @MayStart and @MayEnd) as May,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @JunStart and @JunEnd) as June,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @JulStart and @JulEnd) as July,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @AugStart and @AugEnd) as August,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @SepStart and @SepEnd) as September,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @OctStart and @OctEnd) as October,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @NovStart and @NovEnd) as November,
(select count(*) as &quot;No Of Reservations&quot; from reservation where ReservationTime between @DecStart and @DecEnd) as December,
year(@DecStart) as &quot;Year&quot;">
                <SelectParameters>
                    <asp:SessionParameter Name="JanStart" SessionField="JanStart" DefaultValue="" />
                    <asp:SessionParameter DefaultValue="" Name="JanEnd" SessionField="JanEnd" />
                    <asp:SessionParameter Name="FebStart" SessionField="FebStart" />
                    <asp:SessionParameter Name="FebEnd" SessionField="FebEnd" />
                    <asp:SessionParameter Name="MacStart" SessionField="MacStart" />
                    <asp:SessionParameter Name="MacEnd" SessionField="MacEnd" />
                    <asp:SessionParameter Name="AprStart" SessionField="AprStart" />
                    <asp:SessionParameter Name="AprEnd" SessionField="AprEnd" />
                    <asp:SessionParameter Name="MayStart" SessionField="MayStart" />
                    <asp:SessionParameter Name="MayEnd" SessionField="MayEnd" />
                    <asp:SessionParameter Name="JunStart" SessionField="JunStart" />
                    <asp:SessionParameter Name="JunEnd" SessionField="JunEnd" />
                    <asp:SessionParameter Name="JulStart" SessionField="JulStart" />
                    <asp:SessionParameter Name="JulEnd" SessionField="JulEnd" />
                    <asp:SessionParameter Name="AugStart" SessionField="AugStart" />
                    <asp:SessionParameter Name="AugEnd" SessionField="AugEnd" />
                    <asp:SessionParameter Name="SepStart" SessionField="SepStart" />
                    <asp:SessionParameter Name="SepEnd" SessionField="SepEnd" />
                    <asp:SessionParameter Name="OctStart" SessionField="OctStart" />
                    <asp:SessionParameter Name="OctEnd" SessionField="OctEnd" />
                    <asp:SessionParameter Name="NovStart" SessionField="NovStart" />
                    <asp:SessionParameter Name="NovEnd" SessionField="NovEnd" />
                    <asp:SessionParameter Name="DecStart" SessionField="DecStart" />
                    <asp:SessionParameter Name="DecEnd" SessionField="DecEnd" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>

</html>
