<%@ Page Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="SendPromotion.aspx.cs" Inherits="WebAppAsg.SendPromotion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 

    <style type="text/css">
        #TextArea1 {
            height: 81px;
            width: 304px;
        }
        .auto-style1 {
            width: 216px;
        }
        #TextAreaDescrip {
            height: 81px;
            width: 304px;
        }
        #TextAreaReceipient {
            height: 136px;
            width: 304px;
        }
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
        .auto-style7 {
            width: 180px;
        }
        .auto-style8 {
            width: 200px;
        }
        </style>

    <div id="btnSend">
    
        <h1><b>Send Promotion Details</b></h1> <br />
        <table border="1">
            <tr>
                <td >Promotion ID</td>
                <td >
                    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="41px" Width="305px" DataSourceID="SqlDataSource1" DataTextField="PromotionID" DataValueField="PromotionID"  > 
                    </asp:DropDownList>
&nbsp;<asp:Button ID="btnSearchPromo" runat="server" OnClick="btnSearchPromo_Click" Text="Search" Height="40px" Width="94px" BackColor="#CCFFFF" />
                    <br />
                </td>
              
            </tr>
            <tr>
                <td>Promotion Summary</td>
                <td >
                    <asp:TextBox ID="tbxSummary" runat="server" Height="41px" Width="305px" Enabled="False" ></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr >
                <td class="auto-style1" >Promotion Description</td>
                <td class="auto-style1" >
                    <textarea id="TextAreaDescrip" name="S1" disabled="disabled" runat="server" style=" font-family: Arial, Helvetica, sans-serif;font-size:14px;height: 81px;width: 304px;"></textarea><br />
                </td>
              
            </tr>
            <tr >
                <td class="auto-style1" >Promotion Picture</td>
                <td class="auto-style1" >
                    &nbsp;&nbsp;
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="248px" Width="463px" />
                </td>
              
            </tr>
        </table><br />
        <asp:Button ID="btnSearch" runat="server" Text="Search Recepient" OnClick="btnSearch_Click" class="myButton"/>
        <br />
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <div id="divReceipient" runat="server"><table border="1">
            <tr >
                <td class="auto-style1" >Receipents&#39; Email Address</td>
                <td class="auto-style1" style="width:463px">
                    <textarea id="TextAreaReceipient" name="S2" cols="20" runat="server" disabled="disabled" style=" font-family: Arial, Helvetica, sans-serif;font-size:14px;height: 81px;width: 304px;"></textarea><br />
                </td>
              
            </tr>
        </table><br />
        <asp:Button ID="btnSendPromo" runat="server" Text="Send Promotion" OnClick="btnSendPromo_Click" class="myButton"/>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select PromotionID from Promotion where PromotionStatus='Y'"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="lblEmailAdd" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblNotificationID" runat="server"></asp:Label>
            <br />
        </div>
        <asp:Label ID="lblCustID" runat="server"></asp:Label>
        <br />
        <br />
    
    </div>
  </asp:Content>
