﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeeklySalesReport.aspx.cs" Inherits="WebAppAsg.WeeklySalesReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="420px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="831px">
            <LocalReport ReportPath="WeeklySales.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="WebAppAsg.DataSet1TableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
