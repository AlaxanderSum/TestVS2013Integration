<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineReceipt.aspx.cs" Inherits="Assignment.OnlineReceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function printDiv(divName) {
            
            var printContents = document.getElementById(divName).innerHTML;
            w = window.open();
            w.document.write(printContents);
            w.print();
            w.close();
        }
    </script>
    <style type="text/css">
         body{
            font-size:20px;
            
            width:50%;
            margin:0 auto;
        }

         /*#tablef{
             width:70%;
             margin:0 auto;
         }*/
         
   #form1{
       border:solid;
       border-width:2px;
   }
         

       

        



       

       

            .myButton {
	-moz-box-shadow:inset 0px -3px 7px 0px #29bbff;
	-webkit-box-shadow:inset 0px -3px 7px 0px #29bbff;
	box-shadow:inset 0px -3px 7px 0px #29bbff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #2dabf9), color-stop(1, #0688fa));
	background:-moz-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-webkit-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-o-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-ms-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:linear-gradient(to bottom, #2dabf9 5%, #0688fa 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#2dabf9', endColorstr='#0688fa',GradientType=0);
	background-color:#2dabf9;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #0b0e07;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	padding:9px 23px;
	text-decoration:none;
	text-shadow:0px 1px 0px #263666;
}
       
        

        
       
      

   
       
      

        
       
        .auto-style1 {
            width: 110px;
        }
       
        
        

        
       
      

   
       
      

        
       
    </style>
</head>
<body>
    <div id="print-content">
    <form id="form1" runat="server">
    <div>
    
        <center>
            <h1>Online Receipt</h1>
        </center>
        &nbsp;
        <br />
        =====================================================================================
        <center>
            <h3>Payment Information</h3>
        </center>
        <table id="firstTableA">
            <colgroup>
                <col width="22%" />
               <col/>
                <col width="23%" />
                  <col width="25%" />
               <col width="3%" />
                <col width="23%" />
            </colgroup>
            <tr>
                <td class="auto-style17" valign="top">Payment ID</td>
                <td class="auto-style18" valign="top">:</td>
                <td class="auto-style19">
                    <asp:Label ID="lblPaymentID" runat="server"></asp:Label>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                </td>
                <td id="td1" valign="top" class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Payment Date</td>
                <td id="td5" valign="top" class="auto-style19">:</td>
                <td id="td3" class="auto-style10"> <asp:Label ID="lblPaymentDate" runat="server"></asp:Label>
                    &nbsp;<br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Payment Amount</td>
                <td class="auto-style15">:</td>
                <td class="auto-style16"><asp:Label ID="lblPaymentAmount" runat="server"></asp:Label>
                </td>
                <td id="td2" class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Payment Time</td>
                <td id="td6" class="auto-style16">:</td>
                <td id="td4" class="auto-style12">
                    <asp:Label ID="lblPaymentTime" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
            </table>
        =====================================================================================<br />
        <table style="width:100%;">
            <colgroup>
                <col width="50%" />
                <col width="5%" />
                <col width="50%" />
            </colgroup>
            <tr>
                <td class="auto-style4">
                    <center>
                        <h3>Reservation Information</h3>
                    </center>
                </td>
                <td class="auto-style3">|<br />
                    |</td>
                <td class="auto-style3">
                    <center>
                        <h3>Pick Up Information</h3>
                    </center>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <table id="tablef" >
                        <colgroup>
                            <col />
                            <col width="25%" />
                            <col width="30%" />
                        </colgroup>
                        <tr>
                            <td class="auto-style1">Reservation ID </td>
                            <td class="auto-style13">:</td>
                            <td class="auto-style7"><asp:Label ID="lblReservationID" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Reservation Date</td>
                            <td class="auto-style13">:</td>
                            <td class="auto-style8"><asp:Label ID="lblReservationDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td id="table1" class="auto-style1">Reservation Time</td>
                            <td id="table1" class="auto-style13">:</td>
                            <td class="auto-style8"><asp:Label ID="lblReservationTime" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </td>
                <td>|<br />
                    |<br />
                    |<br />
                    |<br />
                    |<br />
                    |<br />
                </td>
                <td>
                    <table style="width:100%;">
                        <colgroup>
                            <col width="50%" />
                            <col width="5%" />
                            <col width="50%" />
                        </colgroup>
                        <tr>
                            <td>Taxi Plate Number</td>
                            <td>:</td>
                            <td>
                                <asp:Label ID="lblTaxiPlate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Origin</td>
                            <td class="auto-style2">:</td>
                            <td class="auto-style2">
                                <asp:Label ID="lblOrigin" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Destination</td>
                            <td>:</td>
                            <td>
                                <asp:Label ID="lblDestination" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Pick Up Date</td>
                            <td>:</td>
                            <td>
                                <asp:Label ID="lblPickUpDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Pick Up Time</td>
                            <td>:</td>
                            <td>
                                <asp:Label ID="lblPickUpTime" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <br />
            <tr>
                <td></td>
            </tr>

        </table>
            <br />
    
        =====================================================================================
    
        <br />
        <br />
        <br />
    
    </div>
        <p>
        
        </p>
    </form>
        </div>
    <br />
    <center><input class="myButton" type="button" value="Print" onClick="printDiv('print-content')"/></center>
    </body>
</html>
