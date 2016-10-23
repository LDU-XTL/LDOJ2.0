<%@page import="code.fileout"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="server.Server"%>
<%@page import="constant.Constant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%
   		String pid=request.getParameter("pid");///获取跳转页面的pid
     %>
   		<title>Problem 
   			<%=pid %>
   		</title>
		<link href="css/page_1.css" type="text/css" rel="stylesheet"/>
    	 <link rel="shortcut icon" href="img/ldu_top_1.ico"/>
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
   			<ul class="u_top_2">
   				<li><a href="http://blog.csdn.net/kavu1" target="_blank">Tommy</a></li>
   				<li><a href="http://blog.csdn.net/llwwlql" target="_blank">L-75</a></li>
   				<li><a href="http://blog.csdn.net/LDUTYK" target="_blank">ldutyk</a></li>
   			</ul>
   		</div> 
			<div class="body">
			<%
			ResultSet rs1=null;
				Server server=new Server();
				String s_tit="select p_name from problem where p_id='"+pid+"'";
				String p_tit="";
					rs1=server.operate(s_tit,1);
					if(rs1.next())
						p_tit=rs1.getString("p_name");
			 %>
			<h1 class="p_h" align="center"><%=p_tit %></h1>
			<%
					
					//out.print(pid+"<br>");
				
					String sql="select p_url from problem where p_id='"+pid+"'";
					
					ResultSet rs=null,rs_t=null,rs_m=null;
					String purl="";
					rs=server.operate(sql,1);
				
					
					if(rs.next())
					{
					 	 purl=rs.getString("p_url");
					}
					purl="C:\\Users\\Fog\\Desktop\\problem\\"+purl;
					//out.print(purl+"<br>");
				String s=fileout.read(purl);
				/*
					获取对应pid的p_tlim、p_mlim、p_sub、p_ac
				*/
				String s_mes="select * from problem where p_id='"+pid+"'";
				rs_m=server.operate(s_mes, 1);
				String p_tlim="",p_mlim="";
				int p_sub=0,p_ac=0;
				if(rs_m.next())
				{
					p_tlim=rs_m.getString("p_tlim");
					p_mlim=rs_m.getString("p_mlim");
					p_sub=rs_m.getInt("p_sub");
					p_ac=rs_m.getInt("p_ac");
				}
				
			 %>
			 	<%
			 	int p_page=((Integer.parseInt(pid)-1000)/100)+1;
				String p_des="../problem/Problems/page_"+String.valueOf(p_page)+"/"+pid+".html";
			 %>
			<div class="p_tm">
				Time Limit: <%=p_tlim %>&nbsp;&nbsp;&nbsp;Memory Limit:<%=p_mlim %>
				<br>
				Total Submission(s):<%=p_sub+"        " %>&nbsp;&nbsp;&nbsp;&nbsp;Accepted Submission(s): <%=p_ac %>
			</div>
		
			<p class="pst">Problem Description</p>
			
			<jsp:include page="<%=p_des %>"></jsp:include>
			
		<div class="p_body_foot">
							<a href="jsp/submit.jsp?pid=<%=pid %>" class="p_sub">Submit</a>
							<a href="" class="p_sub">Statistic</a>
							<a href="" class="p_sub">Discuss</a>
							</div>

		</div>
		<div class="foot">
			
		</div>
  </body>
</html>
