<%@page import="constant.Constant"%>
<%@page import="java.text.DateFormat"%>
<%@page import="server.problemStatus_sql"%>
<%@page import="org.apache.http.client.ClientProtocolException"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.llwwlql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="server.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Problem Status List</title>
    <link rel="shortcut icon" href="img/ldu_top_1.ico"/>
    <link href="css/page_1.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/register.css" />
    <script type="text/javascript" src="js/register.js" ></script>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
	<script type="text/javascript" src="js/register_jquery.js" ></script>
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
   <div class="contain">
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
   				username=(String)request.getParameter("username");
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
   				   result=(String)request.getParameter("result");
   				   if(result==null)
   				    result="false";
   				    
				 String url=request.getRequestURI();
				 //out.print(url);
				 session.setAttribute("url",url);
   			 %>
   			<%
   			 	if(result.equals("false") && Constant.login_status==false)
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
   				String user_name="";
   				user_name=(String)request.getSession().getAttribute("user_name");
   			 %>
   			<ul class="u_top_4" id="u_top_4">
   			  	<img src="img/login_1.png"><a class="username"><%=user_name %></a><br />
   				<img src="img/login_2.png"><a class="username">L-75</a><br />
   				<img src="img/login_4.png"><a class="username">L-75</a><br />
   				<img src="img/login_3.png"><a  href="servlet/LogoutHandle" class="username">Logout</a><br />
   			</ul>
   			<%
   				}
   			 %>
   		</div>
			<div class="body">			<!-- 标题栏 -->
				<span class="st_body_h2">Problem Status</span>
				 <table class="rank_table">
 					<tr class="ps_top1" style="width: 100%; height:5%;">
 						<td width="9%" height="22" >RunId</td>
 						<td width="12%" >User</td>
 						<td width="7%" >Problem</td>
 						<td width="24%">Result</td>
 						<td width="8%">Memory</td>
 						<td width="8%">Time</td>
 						<td width="8%">Language</td>
 						<td width="8%">Code Length</td>
 						<td width="18%">Submit Time</td>
 					</tr>
 					<%
 					int max=0;
			  		ResultSet rs=null,rs1=null;
			  		///获取当前最大Runid
			  		String s1="select Runid from problemstatus order by Runid desc limit 1";
			  		Server server=new Server();
			  		rs1=server.operate(s1,1);
		  			while(rs1.next())
		  			{
		  			//out.println(rs1.getInt("Runid"));
		  			//Constant.status_rank=1;
			           max=rs1.getInt("Runid");
			          break;
			          }
			          
			  		///查找problemstatus表并按Runid降序
			  		int flag_prev=0;
			  		int contant=Constant.status_rank;
			  		String sql;
			  		if(contant+8<max)
				  		{
				  			sql="select * from (select * from problemstatus ORDER BY Runid asc limit "+String.valueOf(contant-8)+",8) as T order by T.Runid desc";  
				  			Constant.flag_prev=0;
				  		}
			  		else
			  			{
			  				int special=max-contant;
			  				sql="select * from (select * from problemstatus ORDER BY Runid ASC limit "+String.valueOf(contant-8)+","+String.valueOf(special)+") as T order by T.Runid desc";
			  				//flag_prev=1;
			  				Constant.flag_prev=1;
			  			}
		  			rs=server.operate(sql,1);
			         int flag=1;
 					  while(rs.next()){
 					  if(flag%2==1)
 					  {
 						 %>		<!-- 总表 -->
 					<tr class="ps_top2" style="width: 100%; height: 15px;">
 						<td width="9%"><%=rs.getInt("Runid") %></td>
 						<td width="12%"><%=rs.getString("Username") %></td>
 						<td width="7%" ><%=rs.getInt("Problem_id")%></td>
 						<%
 							String s=rs.getString("Result");
 							if(s.equals("Accepted"))
 							{
 						 %>
 						<td width="24%" style="color: red;"><%=rs.getString("Result")%></td>
 						<%
 						}
 							else
 							{
	 						 %>
	 						 <td width="24%" style="color: green;" ><%=rs.getString("Result")%></td>
	 						 <%
 						 }
 						  %>
 						<td width="8%" ><%=rs.getString("Memory")%></td>
 						<td width="8%" ><%=rs.getString("Time") %></td>
 						<td width="8%" ><%=rs.getString("Language") %></td>
 						<td width="8%" ><%=rs.getString("CodeLength")%></td>
 						<td width="18%" ><%=rs.getString("SubmitTime") %></td>
 					</tr>	
 					<%
 						
 					 }
 					 else{
 					 %>
 					 <tr class="ps_top2" style="width: 100%; height:15px;">
 						<td width="9%" bgcolor="#9db4dd"><%=rs.getInt("Runid") %></td>
 						<td width="12%" bgcolor="#9db4dd"><%=rs.getString("Username") %></td>
 						<td width="7%" bgcolor="#9db4dd"><%=rs.getInt("Problem_id")%></td>
 						<%
 							String s=rs.getString("Result");
 							if(s.equals("Accepted"))
 							{
 						 %>
 						<td width="24%" style="color: red;" bgcolor="#9db4dd" ><%=rs.getString("Result")%></td>
 						<%
 						}
 							else
 							{
 						 %>
 						 <td width="24%" style="color: green;" bgcolor="#9db4dd" ><%=rs.getString("Result")%></td>
 						 <%
 						 	}
 						  %>
 						<td width="8%" bgcolor="#9db4dd"><%=rs.getString("Memory") %></td>
 						<td width="8%" bgcolor="#9db4dd"><%=rs.getString("Time") %></td>
 						<td width="8%" bgcolor="#9db4dd"><%=rs.getString("Language") %></td>
 						<td width="8%" bgcolor="#9db4dd"><%=rs.getString("CodeLength") %></td>
 						<td width="18%" bgcolor="#9db4dd"><%=rs.getString("SubmitTime") %></td>
 					</tr>	
 					 <%
 					 }
 					 flag++;
 					}
 					 %>
 					 </table>
 					 <p class="ps_p" align="center"> 			<!-- 翻页-->
 					 	<a style="margin-right: 20px" href="jsp/first_page.jsp">First Page</a>
 					 	<%
 					 		if(Constant.flag_prev==0)///判断是否为题目列表第一页
 					 		{
 					 	%>
 					 	<a style="margin-right: 20px" href="servlet/change_cs_prev">< Prev Page</a>
 					 	<%
 					 		}
 					 		else 
 					 		{
 					 	 %>
 					 	 <a style="margin-right: 20px" href="jsp/first_page.jsp">< Prev Page</a>
 					 	 <%
 					 	 }
 					 	  %>
 					 	<a style="margin-right: 20px" href="servlet/change_cs_next">Next Page ></a>
 					 	<a href="jsp/last_page.jsp">Last Page</a>
 					 </p>
			</div>
			<div class="foot">
					<span class="f1">LuDong Unversity ACM</span>
<br />
   			<span class="f2">Copyright@2012-2016 LDU ACM Team. All Rights Reserved.</span>
			</div>
		</div>
		<div class="cd-user-modal">  
	    <div class="cd-user-modal-container"> 
	    	<form method=POST action=register>
			<table align=center cellSpacing=3 cellPadding=3 width=400 border=0>
				<tr><td colspan=2 width=200 height=40>
				<h1 style="margin-top: 3%; margin-bottom: 3%;">Sign Up</td></tr>

				<tr><td width=75%><input class="input" type=text id="user_id" placeholder="User ID" autocomplete="off" onfocus= "showDesc('clue_user')" onblur="checkUsername()"></td></tr>

				<tr><td><input class="input" type=text id="user_id" placeholder="User ID" autocomplete="off" onfocus= "showDesc('clue_user')" onblur="checkUsername()"></td></tr>

				<tr><td><p class="clue_user" id="clue_user">6 - 16 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=text id="nick" placeholder="Nick Name" autocomplete="off" onfocus= "showDesc('clue_nick_name)" onblur="checkNickname()"></td></tr>
				<tr><td><p class="clue_nick_name" id="clue_nick_name">2 - 18 letters , digits and Chinese allowed</p></td></tr>
				
				<tr><td><input class="input" type=password id="password" autocomplete="off" placeholder="Password" onfocus="showDesc('clue_password')" onblur="checkPassword()"></td></tr>
				<tr><td><p class="clue_password" id="clue_password">6 - 18 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=password id="rptPassword" autocomplete="off" placeholder="Repeat Password" onfocus= "showDesc('clue_rptpassword')" onblur="checkPassword2()"></td></tr>
				<tr><td><p class="clue_rptpassword" id="clue_rptpassword">6 - 18 letters and digits allowed</p></td></tr>
				
				<tr><td><input class="input" type=text id="school" placeholder="School" autocomplete="off" onfocus= "showDesc('clue_school')" onblur="checkSchool()"></td></tr>
				<tr><td><p class="clue_school" id="clue_school">School,Allow null values</p></td></tr>
				

				<tr><td><input class="input" type=text id="email" placeholder="Email"  autocomplete="off" onfocus= "showDesc('clue_email')" onblur="checkEmail()"></td>

				<tr><td><input class="input" type=text id="email" placeholder="Email" autocomplete="off" onfocus=showDesc("clue_email") onblur="checkEmail()"></td>

				<tr><td><p class="clue_email" id="clue_email">Email address,Allow null values</p></td></tr>
				
				</tr><tr><td align=left>
				
				<input type=submit value="Join Us" name=submit class="button20">
				</td></tr></table></form>
	    </div> 
	</div>
  </body>
</html>
