<%@page import="constant.Constant"%>
<%@page import="server.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>Problem set</title>
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
				ResultSet rs=null,rs1=null;
				String max_page="31";///题目最大页面数
				String p=request.getParameter("page");
				int p_g;
				if(p==null)
				Constant.page=1;
				else
				{
					p_g=Integer.parseInt(p);
					Constant.page=p_g;	
				}	
				//out.print(String.valueOf(Constant.page)+" "+String.valueOf(p_g));
			 %>
			 <div class="ps_page">
			 	<font size="3">
			 		<%
			 			int i=0;
			 			for(i=1;i<=Integer.parseInt(max_page);i++)
			 			{
			 			if(i==Constant.page)
			 			{
			 		 %>
			 		 	<a style="color: red;" href="jsp/problemset.jsp?page=<%=i %>" name="ps_pg"><%=i %></a>
			 		 <%
			 		 		}
			 		 		else
			 		 		{
			 		 		%>
			 		 <a href="jsp/problemset.jsp?page=<%=i %>" name="ps_pg"><%=i %></a>
			 		 		
			 		 		<%
			 		 		}
			 		 	}
			 		 %>
			 	</font>
			 </div>
			 <%
			 ///查找当前页面的题目总数（100条）
			 	String sql1="select * from problem where p_page='"+Constant.page+"'";
			 	rs=SqlConnect.find(sql1);
			 	String sql2="select p_ac,p_sub from problem where p_page='"+Constant.page+"'";
			 	ResultSet rs2=null;
			 	rs2=SqlConnect.find(sql2);
			 	int index=(Constant.page-1)*100+1000;			 	
			  %>
			 <table class="rank_table" style="width:100%;">
 					<tr class="ps_top1" style="width: 100%;">
 						<td width="10%" height="15">Pid</td>
 						<td width="50%" height="22">Title</td>
 						<td width="10%" height="22">Tags</td>
 						<td width="15%" height="22">Radio</td>
 						<td width="15%" height="22">Accepted/Submit</td>
 					</tr>
			 <%
			 int flag=1;
 					  while(rs.next() && flag<=100){
 					  if(flag%2==1)
 					  {
 					 %>
 					<tr class="ps_top2" style="width: 100%; height: 22px;">
 						<td width="10%"><%=rs.getInt("p_id") %></td>
 						<td width="50%"><a href="jsp/problem.jsp?pid=<%=(Constant.page-1)*100+1000+flag-1 %>" name="pname"><%=rs.getString("p_name") %></a></td>
 						<td width="10%" ></td>
 						<td width="15%" ><%=rs.getDouble("p_rd") %>%</td>
 						<td width="15%" ><%=rs.getInt("p_ac")%>/<%=rs.getInt("p_sub")%></td>
 					</tr>	
 					<%
 					 }
 					 else{
 					 %>
 					 <tr class="ps_top2" style="width: 100%; height: 22px;">
 						<td width="10%" bgcolor="#cde1ec"><%=rs.getInt("p_id") %></td>
 						<td width="50%" bgcolor="#cde1ec"><a href="jsp/problem.jsp?pid=<%=(Constant.page-1)*100+1000+flag-1  %>" name="pname"><%=rs.getString("p_name") %></a></td>
 						<td width="10%" bgcolor="#cde1ec"></td>
 						<td width="15%" bgcolor="#cde1ec"><%=rs.getDouble("p_rd")%>%</td>
 						<td width="15%" bgcolor="#cde1ec"><%=rs.getInt("p_ac")%>/<%=rs.getInt("p_sub")%></td>
 					</tr>	
 					 <%
 					 }
 					 flag++;
 					}
 					 %>
 					 </table>
				 <div class="ps_page">
			 	<font size="3">
			 		<%
			 			for(i=1;i<=Integer.parseInt(max_page);i++)
			 			{
			 		 %>
			 		 	<a href="jsp/problemset.jsp?page=<%=i %>" name="ps_pg"><%=i %></a>
			 		 <%
			 		 	}
			 		 %>
			 	</font>
			 </div>
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
