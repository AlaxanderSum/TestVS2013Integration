<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearlySalesReport.aspx.cs" Inherits="WebAppAsg.YearlySalesReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
       html, body { min-height: 100%; }
         body{
            font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            width:50%;
           
        }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="text-align: center;margin-left:300px;">
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="980px" style="margin-right: 0px;background-color:white" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="842px">
            <LocalReport ReportPath="YearlySalesReport.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet2" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="WebAppAsg.YearlySalesTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
