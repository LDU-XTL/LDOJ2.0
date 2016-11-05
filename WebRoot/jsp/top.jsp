<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
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
  		<div class="top">
   			<div class="top_1">
   			<img alt="lduacm" src="img/ldu_top_3.jpg"width="70%" height="100%">
   			<img alt="lduacm" src="img/ldu_top_2.jpg" width="20%" height="100%" id="img_top_1">
   			</div>
   			<ul class="u_top_1">
   				<li>Recent Contest</li>
   				<li>ProblemSet</li>
   				<li>Problems</li>
   				<li>Rank</li>
   				<li>Blogs</li>
   			</ul>
   			<ul class="u_top_3">
   				<li><a href="http://codeforces.com/" target="_blank">CodeForce</a></li>
   				<li><a href="http://bestcoder.hdu.edu.cn/" target="_blank">BestCoder</a></li>
   				<li><a href="https://icpc.baylor.edu/" target="_blank">ACM ICPC</a></li>
   			</ul>
   			<ul class="u_top_3">
   				<li><a href="jsp/problemset.jsp">Problems</a></li>
   				<li><a href="jsp/first_page.jsp">Online Status</a></li>
   				<li><a href="jsp/submit.jsp">Submit Problem</a></li>
   			</ul>
   			<ul class="u_top_3">
   				<li><a href="">Freshman Contest</a></li>
   				<li><a href="">Region</a></li>
   				<li><a href="">Common Contest</a></li>
   			</ul>
   			<ul class="u_top_3">
   				<li><a href="">Common Contest</a></li>
   				<li><a href="">Region</a></li>
   				<li><a href="">Total Rank</a></li>
   			</ul>
   			<%
   				String username="",userpass="";
   				username=(String)session.getAttribute("username");
   				if(username==null)
   					{
   						username=(String)session.getAttribute("re_username");
   						if(username==null)
   						username="";
   					}
   				userpass=(String)session.getAttribute("re_password");
   				if(userpass==null)
   				userpass="";
   					String result="false";
   				   result=(String)session.getAttribute("result");
   				   if(result==null)
   				    result="false";
   				    
				 String url=request.getRequestURI();
				 //out.print(url);
				 session.setAttribute("url",url);
   			 %>
   			<%
   			String login_status=(String)session.getAttribute("login_status");
   			if(login_status==null)
   			login_status="false";
   			 	if(result.equals("false") && login_status.equals("false"))
   			 	{
   			 		String login_mess=(String)session.getAttribute("login_mess");
   			 		if(login_mess==null)
   			 		login_mess="true";
   			 		if(login_mess.equals("true"))
   			 		{
   			 %>
   			<ul class="u_top_2" id="u_top_2" >
   				<form method="get" action="servlet/LoginHandle" >
			  	<table width="68" border="0" align="center" cellspacing="0">
			  		<tbody>
						<tr><td width="40" >UserName:</td><td align="right"><input name="username" type="text" class="text90" maxlength="20" value=<%=username %>></td></tr>
						<tr><td>Password:</td><td align="right"><input name="userpass" type="password" class="text90" maxlength="20" value=<%=userpass %>></td></tr>
			  		</tbody>
			  	</table>
			  	<input name="login" type="submit" class="button40" value="Sign In" style="background-color: lightgreen; border: dotted 1px;">&nbsp;
			  		<nav class="bounce_nav">
			  			<a style="text-decoration: none" class="cd-signup">Register</a>
			  		</nav>
				</form>
   			</ul>
  			<%
  			}
  				else
  				{
  			 %>
  			 <ul class="u_top_2" id="u_top_2" >
   				<form method="get" action="servlet/LoginHandle">
			  	<table width="68" border="0" align="center" cellspacing="0">
			  		<tbody>
						<tr><td width="40" >User ID&nbsp;</td><td align="right"><input name="username" type="text" class="text90" maxlength="20" value=<%=username %>></td></tr>
						<tr><td>Password&nbsp;</td><td align="right"><input name="userpass" type="password" class="text90" maxlength="20" value=<%=userpass %>></td></tr>
			  		</tbody>
			  	</table>
			  	<span class="log_mess">Not user or Wrong password</span>
			  	<input name="login" type="submit" class="button40" value="Sign In" style="background-color: lightgreen; border: dotted 1px;">&nbsp;
			  		<nav class="bounce_nav">
			  			<a style="text-decoration: none" class="cd-signup">Register</a>
			  		</nav>
				</form>
   			</ul>
   			<%
   				session.setAttribute("login_mess","true");
   					}
   				}
   					else
   				{
   				String nick_name="";
   				nick_name=(String)request.getSession().getAttribute("nick_name");
   			 %>
   			<ul class="u_top_4" id="u_top_4">
   			  	<img src="img/login_1.png"><a class="username"><%=nick_name %></a><br />
   				<img src="img/login_2.png"><a class="username">L-75</a><br />
   				<img src="img/login_4.png"><a class="username">L-75</a><br />
   				<img src="img/login_3.png"><a href="servlet/LogoutHandle" class="username">Logout</a><br />
   			</ul>
   			<%
   				}
   			 %>
   		</div>
      </body>
</html>
