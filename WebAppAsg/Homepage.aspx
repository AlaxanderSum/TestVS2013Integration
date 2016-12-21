<%@ Page Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebAppAsg.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 


    <!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
 
   <style>
          body{
  font-size:20px;
            /*background: -webkit-linear-gradient(45deg, rgba(255,255,255,1) 0%, rgba(0,255,255,1) 100%);*/
            background-image:url(12.jpg);
            background-repeat:no-repeat;
            width:60%;
            margin-top:100px;
           
            margin-left:50px;
}
  .myButton {
	-moz-box-shadow:inset 0px 0px 0px 2px #050505;
	-webkit-box-shadow:inset 0px 0px 0px 2px #050505;
	box-shadow:inset 0px 0px 0px 2px #050505;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #636163), color-stop(1, #000000));
	background:-moz-linear-gradient(top, #636163 5%, #000000 100%);
	background:-webkit-linear-gradient(top, #636163 5%, #000000 100%);
	background:-o-linear-gradient(top, #636163 5%, #000000 100%);
	background:-ms-linear-gradient(top, #636163 5%, #000000 100%);
	background:linear-gradient(to bottom, #636163 5%, #000000 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#636163', endColorstr='#000000',GradientType=0);
	background-color:#636163;
	border:1px solid #0a0a0a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:19px;
	padding:12px 42px;
	text-decoration:none;
	text-shadow:0px 1px 0px #000000;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #636163));
	background:-moz-linear-gradient(top, #000000 5%, #636163 100%);
	background:-webkit-linear-gradient(top, #000000 5%, #636163 100%);
	background:-o-linear-gradient(top, #000000 5%, #636163 100%);
	background:-ms-linear-gradient(top, #000000 5%, #636163 100%);
	background:linear-gradient(to bottom, #000000 5%, #636163 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000', endColorstr='#636163',GradientType=0);
	background-color:#000000;
}
.myButton:active {
	position:relative;
	top:1px;
}



       a#link:link,  a#link:visited {
    float:right;
    background-color: #0094ff;
    color: white;
    padding: 5px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
a#link:hover,  a#link:active {
    background-color: #4800ff;
}
#wowslider-container1 { 
    max-width: 100%;
    max-height:100%;
}
#wowslider-container1{ width:70% }
#wowslider-container1 .ws_images{
    max-height:100%;
    max-width: 100%;
}
#wowslider-container1 .ws_images ul a{
    max-height:80%;
}
#wowslider-container1 .ws_images > div > img {
    max-height:80%;
}
       </style>
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
  

    <h1 style="text-align: center">EzCab Taxi Management System</h1>
    <div>
    <!-- Start WOWSlider.com BODY section -->
<div id="wowslider-container1" style="width:50%;">
<div class="ws_images" ><ul>
		<li><img src="data1/images/new-york-city-taxi-wide-wallpaper-334128.jpg" alt="" title="" id="wows1_0"/></li>
		<li><img src="data1/images/qhvdzjw1cv-4725a98b-98cc-aa55-5f50-6c7b0445c919.jpg" alt="" title="" id="wows1_1"/></li>
		<li><img src="data1/images/taxi.jpg" alt="" title="" id="wows1_2"/></li>
		<li><img src="data1/images/taxi-nightclub_meitu_5.jpg" alt="jquery carousel" title="" id="wows1_3"/></li>
		
	</ul></div>
	<div class="ws_bullets"><div>
		<a href="#" title=""><span><img src="data1/tooltips/new-york-city-taxi-wide-wallpaper-334128.jpg" alt=""/>1</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/qhvdzjw1cv-4725a98b-98cc-aa55-5f50-6c7b0445c919.jpg" alt=""/>2</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/taxi.jpg" alt=""/>3</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/taxi-nightclub_meitu_5.jpg" alt=""/>4</span></a>
		
	</div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.com/vi">slider</a> by WOWSlider.com v8.7</div>
<div class="ws_shadow"></div>
</div>	
<script type="text/javascript" src="engine1/wowslider.js"></script>
<script type="text/javascript" src="engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->
    </div>
       </asp:Content>

