<%@ Page Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="AddPromotion.aspx.cs" Inherits="WebAppAsg.AddPromotion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type="text/css">
        
        #TextAreaDescrip {
            height: 81px;
            width: 304px;
        }
        .auto-style1 {
            height: 93px;
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
    </style>

   <div>
           <h1><b>Add Promotion Details</b></h1>
      
           <table border="1">
            <tr>
                <td >Promotion ID</td>
                <td >
                    <asp:TextBox ID="txtPromotionID" runat="server" CssClass="auto-style5" Height="39px" Width="304px" Enabled="False"></asp:TextBox>
                    <br />
                </td>
              
            </tr>
            <tr>
                <td>Promotion Summary</td>
                <td >
                    <asp:TextBox ID="txtSummary" runat="server" CssClass="auto-style5" Height="41px" Width="305px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Promotion Summary is required." ForeColor="Red" ControlToValidate="txtSummary">*</asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr >
                <td class="auto-style1" >Promotion Description</td>
                <td class="auto-style1" >
                    <textarea id="TextAreaDescrip" name="S1" runat="server" style=" font-family: Arial, Helvetica, sans-serif;font-size:14px;height: 81px;width: 304px;"></textarea><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Promotion Description is required." ForeColor="Red" ControlToValidate="TextAreaDescrip">*</asp:RequiredFieldValidator>
                    <br />
                </td>
              
            </tr>
            <tr >
                <td class="auto-style1" >Promotion Picture</td>
                <td class="auto-style1" >
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="38px" Width="309px" /> &nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:TextBox ID="txtImage" runat="server" CssClass="auto-style5" Height="39px" Width="304px" Enabled="False"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" style="margin-top: 0px" Width="115px" Height="45px" BackColor="#CCFFFF" />
                    <br />
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="248px" Width="463px" />
                </td>
              
            </tr>
        </table>
        <br />
       <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
     
           <br />
           <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
     
           <br />
          <div style="margin-left:175px"> <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" class="myButton" />&nbsp;&nbsp;&nbsp;
           <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="myButton" CausesValidation="False" /></div>
           <br />
           <br />
     
    </div>
   </asp:Content>
