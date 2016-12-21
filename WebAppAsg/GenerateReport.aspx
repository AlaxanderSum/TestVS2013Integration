<%@ Page Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="GenerateReport.aspx.cs" Inherits="WebAppAsg.GenerateReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 


    <style type="text/css">
       
         html, body { min-height: 100%; }
         body{
            font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            width:50%;
           
        }
        
         
         #Button1{
             float:right;
             position:relative;
            bottom:0;
            font-size:15px;
            
        }
         #option{
             opacity:0,0;
             width:50%;
             margin:0 auto;
             text-align:center;

         }

          #Button1{
              cursor:pointer;
            left: 0px;
            background-color:aliceblue
        }

          .myButton {
	-moz-box-shadow: 3px 4px 0px 0px #1564ad;
	-webkit-box-shadow: 3px 4px 0px 0px #1564ad;
	box-shadow: 3px 4px 0px 0px #1564ad;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	border:1px solid #337bc4;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:12px 44px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
}

.myButton1 {

	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
	background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
	background-color:#f9f9f9;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:4px 18px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton1:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
.myButton1:active {
	position:relative;
	top:1px;
}
        </style>

    <div>
    
        <h1>Generating Report</h1>
       
        <p><asp:Button ID="Button2" runat="server" Text="Daily Sales Transaction Report" CssClass="myButton" PostBackUrl="~/DailyReservationTransaction.aspx" /><br /> <br /> </p> 
         <p ><asp:Button ID="Button3" runat="server" Text="Yearly Sales Summary Report" CssClass="myButton" PostBackUrl="~/YearlySalesReport.aspx" Width="525px" />
            <br /><br />
        </p>
         <p ><asp:Button ID="Button4" runat="server" Text="Top 3 Customer Exception Report" CssClass="myButton" PostBackUrl="~/Top3Customer.aspx" Width="525px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br /></p>
        
        <p ><asp:Button ID="Button5" runat="server" Text="Top 3 Day Sale Exception Report" CssClass="myButton" PostBackUrl="~/Top3DayReport.aspx" Width="525px" />
           
        </p>
        <p ><asp:Button ID="Button6" runat="server" Text="Top 3 Route Exception Report" CssClass="myButton" PostBackUrl="~/Top3Route.aspx" Width="525px" />
            <br />
        </p>
         <p ><asp:Button ID="Button1" runat="server" Text="Monthly Reservation Report" CssClass="myButton" PostBackUrl="~/MonthlyRsvReport.aspx" Width="525px" />
            <br />
        </p>
         <p ><asp:Button ID="Button7" runat="server" Text="Daily Cancelled Reservation Report" CssClass="myButton" PostBackUrl="~/DailyCancelledReservationReport.aspx" Width="525px" />
            <br />
        </p>
         <p ><asp:Button ID="Button8" runat="server" Text="Top 3 Driver Report" CssClass="myButton" PostBackUrl="~/Top 3 Driver.aspx" Width="525px" />
            <br />
        </p>
         <p ><asp:Button ID="Button9" runat="server" Text="Weekly Sales Report" CssClass="myButton" PostBackUrl="~/WeeklySalesReport.aspx" Width="525px" />
            <br />
        </p>

    </div>
    </asp:Content>

