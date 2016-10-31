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
			<jsp:include page="top.jsp"></jsp:include>
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
 					///创建数据库操作对象
 					Server server=new Server();
			  		ResultSet rs=null,rs1=null;
			  		int max=0;
			  		///获取当前最大Runid
			  		String s1="select Runid from problemstatus order by Runid desc limit 1";
			  		rs1=server.operate(s1,1);
		  			while(rs1.next())
		  			{
		  			//out.println(rs1.getInt("Runid"));
		  			//Constant.status_rank=1;
			           max=rs1.getInt("Runid");
			          break;
			          }
			          int status_rank=Integer.parseInt((String)session.getAttribute("status_rank"));
			          int temp=status_rank;
			          if(temp+8<max)
			          {
			          		session.setAttribute("flag_prev","0");
			          }
			          else
			          session.setAttribute("flag_prev","1");
			  		///查找problemstatus表并按Runid降序

			  		int flag_next=0;
			  		int contant=status_rank-8;
			  		String sql;
			  		//out.println("constant"+contant+"<br>");
			  		if(contant>0)
				  		{
				  			 sql="select * from (select * from problemstatus ORDER BY Runid asc limit "+String.valueOf(contant)+",8) as T order by T.Runid desc"; 
				  			  session.setAttribute("flag_next","0");  ///没到最后一页
				  		}
			  		else
			  			{
			  				int special=8+contant; 
			  				sql="select * from (select * from problemstatus ORDER BY Runid asc limit 0,"+String.valueOf(special)+") as T order by T.Runid desc";
			  				flag_next=1;
			  				session.setAttribute("flag_next","1");  ///到了最后一页
			  				}
		  			rs=server.operate(sql,1);
			         int flag=1;  ///控制奇数行与偶数行
 					  while(rs.next()){
 					  if(flag%2==1)
 					  {
 						 %>		<!-- 总表 -->
 					<tr class="ps_top2" style="width: 100%;">
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
 					 <tr class="ps_top2" style="width: 100%;">
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
 					 	int flagnext=Integer.parseInt((String)session.getAttribute("flag_next"));
 					 	int flagprev=Integer.parseInt((String)session.getAttribute("flag_prev"));
 					 	if(flagnext==0)///判断是否为题目列表最后一页
 					 		{
 					 			if(flagprev==0)
 					 			{						///如果不是第一页也不是最后一页，则正常运行
			 					 	%>
			 					 	<a style="margin-right: 20px" href="servlet/change_cs_prev" name="prev">< Prev Page</a>
			 					 	<a style="margin-right: 20px" href="servlet/change_cs_next" name="next">Next Page ></a>
			 					 	<%
 					 			}
 					 			else
 					 			{      ///如果是第一页，则prev_page为first_page
	 					 			%>
	 					 			<a style="margin-right: 20px" href="jsp/first_page.jsp" name="prev">< Prev Page</a>
	 					 			<a style="margin-right: 20px" href="servlet/change_cs_next" name="next">Next Page ></a>
	 					 			<%
 					 			}
 					 		}
 					 	else   ///是最后一页
 					 		{
 					 	 %>
 					 	  <a style="margin-right: 20px" href="servlet/change_cs_prev" name="prev">< Prev Page</a>
 					 	 <%
 					 	 	}
 					 	  %>
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
	    	<form method="get" action="servlet/Register">
			<table align=center cellSpacing=3 cellPadding=3 width=400 border=0>
				<tr><td colspan=2 width=200 height=40>
				<h1 style="margin-top: 3%; margin-bottom: 3%;">Sign Up</td></tr>

				<tr><td width=75%><input class="input" type=text id="user_id" placeholder="User Name" autocomplete="off" onfocus= "showDesc('clue_user')" onblur="checkUsername()"></td></tr>
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
				<tr><td><p class="clue_email" id="clue_email">Email address,Allow null values</p></td></tr>
				
				</tr><tr><td align=left>
				
				<input type=submit value="Join Us" name=submit class="button20">
				</td></tr></table></form>
	    </div> 
	</div>
  </body>
</html>
