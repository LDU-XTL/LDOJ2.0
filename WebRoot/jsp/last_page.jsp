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
			  		ResultSet rs=null,rs1=null;
			  		int flag=0;
			  		///创建数据库操作对象
			  		Server server=new Server();
			  		///获取当前最大Runid
			  		//String sql="select * from problemstatus ORDER BY Runid asc";
			  		String sql="select * from (select * from problemstatus ORDER BY Runid asc LIMIT 0,15) as T order by T.Runid desc";
			  		int status_rank=Integer.parseInt((String)session.getAttribute("status_rank")); 
			  		int current=status_rank;
		  			rs=server.operate(sql, 1);
		  			
 					  while(rs.next() && flag<=15){
 					  if(flag%2==0)
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
 						<td width="9%" bgcolor="#cde1ec"><%=rs.getInt("Runid") %></td>
 						<td width="12%" bgcolor="#cde1ec"><%=rs.getString("Username") %></td>
 						<td width="7%" bgcolor="#cde1ec"><%=rs.getInt("Problem_id")%></td>
 						<%
 							String s=rs.getString("Result");
 							if(s.equals("Accepted"))
 							{
 						 %>
 						<td width="24%" style="color: red;" bgcolor="#cde1ec" ><%=rs.getString("Result")%></td>
 						<%
 						}
 							else
 							{
 						 %>
 						 <td width="24%" style="color: green;" bgcolor="#cde1ec" ><%=rs.getString("Result")%></td>
 						 <%
 						 	}
 						  %>
 						<td width="8%" bgcolor="#cde1ec"><%=rs.getString("Memory") %></td>
 						<td width="8%" bgcolor="#cde1ec"><%=rs.getString("Time") %></td>
 						<td width="8%" bgcolor="#cde1ec"><%=rs.getString("Language") %></td>
 						<td width="8%" bgcolor="#cde1ec"><%=rs.getString("CodeLength") %></td>
 						<td width="18%" bgcolor="#cde1ec"><%=rs.getString("SubmitTime") %></td>
 					</tr>	
 					 <%
 					 }
 					flag++;
 					}
 					 %>
 					 <%
 					 	status_rank=16;
 					 	session.setAttribute("status_rank", String.valueOf(status_rank));
 					  %>
 					 </table>
 					 <p class="ps_p" align="center"> 			<!-- 翻页-->
 					 	<a style="margin-right: 20px" href="jsp/first_page.jsp">First Page</a>
 					 	<a style="margin-right: 20px" href="jsp/prev_page.jsp">< Prev Page</a>
 					 	<a style="margin-right: 20px" href="jsp/last_page.jsp">Next Page ></a>
 					 	<a href="jsp/last_page.jsp">Last Page</a>
 					 </p>
			</div>
			<div class="foot">
   			<span class="f1">LuDong Unversity Online Judge 1.0</span>
   			<span class="f2">Developer:Lu Qilu Tang Yukai Xu Fuhao</span>
   			<span class="f2">Copyright@2012-2016 LDU ACM Team. All Rights Reserved.</span>
   		</div>
		</div>
		<jsp:include page="register.jsp"></jsp:include>
  </body>
</html>
