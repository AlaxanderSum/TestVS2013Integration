<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top3DayReport.aspx.cs" Inherits="Assignment.Top3DayReport1" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        #ReportViewer1{
            
            margin:0 auto;
            background:white;
        }
        body{
            background:url(12.jpg);
            background-repeat:no-repeat;
        }
    </style>
    <title></title>
    
</head>
<body>
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="980px"   WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="842px">
            <LocalReport ReportPath="Top3DayReport.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet2" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="WebAppAsg.Top3DayReportTableAdapters.PaymentTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
