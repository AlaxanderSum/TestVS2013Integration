<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="Assignment.PaymentSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function closeWindow(aWindow) {
            aWindow.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Success!!<br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />

    </form>
</body>
</html>
