<%@page import="constant.Constant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>Welcome to Lu Dong University ACM</title>
    <link rel="shortcut icon" href="img/ldu_top_1.ico"/>
    <link href="css/page_1.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"  href="css/register.css" />
    <script type="text/javascript" src="js/register.js" ></script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
	<script type="text/javascript" src="js/register_jquery.js" ></script>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  <body>
    <div class="contain">
   		<jsp:include page="jsp/top.jsp"></jsp:include>
   		<div class="body">
   		  <span class="t1">Welcome to Ludong University ACM</span>
   		  <br />
   		  <div class="img_1">
   		  	<img src="img/body_1.jpg"width="100%" height="100%"  />
   		  </div>
   		  
   		</div>
   		<div class="foot">
   			<span class="f1">LuDong Unversity ACM</span>
<br />
   			<span class="f2">Copyright@2012-2016 LDU ACM Team. All Rights Reserved.</span>
   		</div>
    
    </div>
		<div class="cd-user-modal">  
	    <div class="cd-user-modal-container"> 
	    	<form method="get" action="servlet/Register">
			<table align=center cellSpacing=3 cellPadding=3 width=400 border=0>
				<tr><td colspan=2 width=200 height=40>
				<h1 style="margin-top: 3%; margin-bottom: 3%; ">Sign Up</td></tr>

				<tr><td width=75%><input class="input" type=text id="user_id" name="re_username" placeholder="User ID" autocomplete="off" onfocus= "showDesc('clue_user')" onblur="checkUsername()"></td></tr>
				<tr><td><p class="clue_user" id="clue_user">6 - 16 letters and digits allowed</p></td></tr>
				<tr><td><input class="input" type=text id="nick" name="re_nickname" placeholder="Nick Name" autocomplete="off" onfocus= "showDesc('clue_nick_name)" onblur="checkNickname()"></td></tr>
				<tr><td><p class="clue_nick_name" id="clue_nick_name">2 - 18 letters , digits and Chinese allowed</p></td></tr>
				
				<tr><td><input class="input" type=password id="password" name="re_password" autocomplete="off" placeholder="Password" onfocus="showDesc('clue_password')" onblur="checkPassword()"></td></tr>
				<tr><td><p class="clue_password" id="clue_password">6 - 18 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=password id="rptPassword" autocomplete="off" placeholder="Repeat Password" onfocus= "showDesc('clue_rptpassword')" onblur="checkPassword2()"></td></tr>
				<tr><td><p class="clue_rptpassword" id="clue_rptpassword">6 - 18 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=text id="school" name="re_school" placeholder="School" autocomplete="off" onfocus= "showDesc('clue_school')" onblur="checkSchool()"></td></tr>
				<tr><td><p class="clue_school" id="clue_school">School,Allow null values</p></td></tr>
				

				<tr><td><input class="input" type=text id="email" name="re_email" placeholder="Email"  autocomplete="off" onfocus= "showDesc('clue_email')" onblur="checkEmail()"></td>

				<tr><td><p class="clue_email" id="clue_email">Email address,Allow null values</p></td></tr>
				
				</tr><tr><td align=left>。
				
				<input type=submit value="Join Us" name=submit class="button20" onclick="check()">
				</td></tr></table></form>
	    </div> 
	</div>
  </body>
</html>
