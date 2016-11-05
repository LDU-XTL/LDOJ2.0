<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<div class="cd-user-modal">  
	    <div class="cd-user-modal-container"> 
	    	<form method="get">
			<table align=center cellSpacing=3 cellPadding=3 width=400 border=0>
				<tr><td colspan=2 width=200 height=40>
				<h1 style="margin-top: 3%; margin-bottom: 3%; ">Sign Up</td></tr>

				<tr><td width=75%><input class="input" type="text" id="user_id" name="re_username" placeholder="User ID" autocomplete="off" onfocus= "showDesc('clue_user')" onblur="checkUsername()"></td></tr>
				<tr><td><p class="clue_user" id="clue_user">6 - 16 letters and digits allowed</p></td></tr>
				<tr><td><input class="input" type=text id="nick" name="re_nickname" placeholder="Nick Name" autocomplete="off" onfocus= "showDesc('clue_nick_name')" onblur="checkNickname()"></td></tr>
				<tr><td><p class="clue_nick_name" id="clue_nick_name">2 - 18 letters , digits and Chinese allowed</p></td></tr>
				
				<tr><td><input class="input" type=password id="password" name="re_password" autocomplete="off" placeholder="Password" onfocus="showDesc('clue_password')" onblur="checkPassword()"></td></tr>
				<tr><td><p class="clue_password" id="clue_password">6 - 18 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=password id="rptPassword" autocomplete="off" placeholder="Repeat Password" onfocus= "showDesc('clue_rptpassword')" onblur="checkPassword2()"></td></tr>
				<tr><td><p class="clue_rptpassword" id="clue_rptpassword">6 - 18 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=text id="school" name="re_school" placeholder="School" autocomplete="off" onfocus= "showDesc('clue_school')" onblur="checkSchool()"></td></tr>
				<tr><td><p class="clue_school" id="clue_school">School,Allow null values</p></td></tr>
				

				<tr><td><input class="input" type=text id="email" name="re_email" placeholder="Email"  autocomplete="off" onfocus= "showDesc('clue_email')" onblur="checkEmail()"></td>

				<tr><td><p class="clue_email" id="clue_email">Email address,Allow null values</p></td></tr>
				
				</tr><tr><td align=left>
				
				<input type="button" value="Join Us" name=submit class="button20" onclick="check()">
				</td></tr></table></form>
	    </div> 
	</div>
  </body>
</html>
