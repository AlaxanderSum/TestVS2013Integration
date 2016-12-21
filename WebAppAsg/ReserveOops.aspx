<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveOops.aspx.cs" Inherits="ProjectTaxiMgmt.ReserveOops" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oops</title>
    <style>
        #pictureDiv{
            text-align:center;
        }

        .text{
            font-size:1.3em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="pictureDiv">
        <img src="OopsPenguin400x398.jpg" alt="" />
    </div>

    <p class="text">Sorry. We are experiencing some problems. We apologized for the inconvenience cause.</p>
    <p class="text">Please click to following button to return to the Main Menu page.</p>
        <p>
            <asp:Button ID="btnBack" runat="server" Text="Let 's Go Back" />
        </p>
    </form>
</body>
</html>
