<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentFail.aspx.cs" Inherits="Assignment.PaymentFail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="refresh" content="5;url=custHome.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <center>Payment Fail, Redirecting back to payment page in 5 seconds.<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/custHome.aspx">Click Here</asp:HyperLink>
        if the browser did not redirect.</center></div>
    </form>
</body>
</html>
