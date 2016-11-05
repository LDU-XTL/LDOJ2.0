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
   		session.setAttribute("pid",pid);
     %>
   		<title>Problem 
   			<%=pid %>
   		</title>
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
   			<span class="f1">LuDong Unversity Online Judge 1.0</span>
   			<span class="f2">Developer:Lu Qilu Tang Yukai Xu Fuhao</span>
   			<span class="f2">Copyright@2012-2016 LDU ACM Team. All Rights Reserved.</span>
   		</div>
		<jsp:include page="register.jsp"></jsp:include>
  </body>
</html>
