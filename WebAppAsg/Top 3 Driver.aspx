<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top 3 Driver.aspx.cs" Inherits="WebAppAsg.Top_3_Driver" %>

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
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="487px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="814px">
            <LocalReport ReportPath="Top 3 Driver.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="WebAppAsg.ReportTableAdapters.DriverTableAdapter" OldValuesParameterFormatString="original_{0}" OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
