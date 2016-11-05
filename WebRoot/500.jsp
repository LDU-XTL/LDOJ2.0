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
    <link href="../css/page_1.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"  href="../css/register.css" />
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
   		<br>
   		  <div class="img_1">
   		  	<img src="img/500_1.jpg"width="100%" height="100%"  />
   		  </div>
   		  	<font class="e_500_1">您可以：</font>
   		  	<form action="index.jsp">
   		  		<input type="submit"value="访问首页" class="e_500_2">
   		  	</form>
   		  <br>
   		</div>
   		<div class="foot">
   			<span class="f1">LuDong Unversity ACM</span>
<br />
   			<span class="f2">Copyright@2012-2016 LDU ACM Team. All Rights Reserved.</span>
   		</div>
    
    </div>
  </body>
</html>
