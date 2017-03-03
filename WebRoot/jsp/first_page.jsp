<%@page import="server.*"%>
<%@page import="constant.Constant"%>
<%@page import="java.text.DateFormat"%>
<%@page import="server.problemStatus_sql"%>
<%@page import="org.apache.http.client.ClientProtocolException"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.llwwlql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="problem.ProblemStatus"%>
<%@page import="com.llwwlql.ResultSource"%>
<%@page import="java.text.DecimalFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Problem Status List</title>
<link rel="shortcut icon" href="img/ldu_top_1.ico" />
<link href="css/page_1.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="css/register.css" />
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/register_jquery.js"></script>
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
			<!-- 标题栏 -->
			<span class="st_body_h2">Problem Status</span>
			<table class="rank_table">
				<tr class="ps_top1" style="width: 100%; height:5%;">
					<td width="9%" height="22">RunId</td>
					<td width="12%">User</td>
					<td width="7%">Problem</td>
					<td width="24%">Result</td>
					<td width="8%">Memory</td>
					<td width="8%">Time</td>
					<td width="8%">Language</td>
					<td width="8%">Code Length</td>
					<td width="18%">Submit Time</td>
				</tr>
				<%
					//Server server = new Server();
					ResultSet rs = null, rs1 = null;
					///获取当前最大Runid
					String s1 = "select Runid from problemstatus order by Runid desc limit 1";
					rs1 = SqlConnect.find(s1);
					while (rs1.next()) {
						//out.println(rs1.getInt("Runid"));
						//Constant.status_rank=1;
						//Constant.status_rank=rs1.getInt("Runid")+1;
						session.setAttribute("status_rank",
								String.valueOf(rs1.getInt("Runid") + 1));
						break;
					}
					///查找problemstatus表并按Runid降序
					String sql = "select * from problemstatus ORDER BY Runid DESC";
					int status_rank = Integer.parseInt((String) session
							.getAttribute("status_rank"));
					int current = status_rank;
					rs = SqlConnect.find(sql);

					while (rs.next() && (current - status_rank <= 15)) {
						if (status_rank % 2 == 0) {
				%>
				<!-- 总表 -->
				<tr class="ps_top2" style="width: 100%;">
					<td width="9%"><%=rs.getInt("Runid")%></td>
					<td width="12%"><%=rs.getString("Nickname")%></td>
					<td width="7%"><%=rs.getInt("Problem_id")%></td>
					<%
						String s = rs.getString("Result");
								if (s.equals("Accepted")) {
					%>
					<td width="24%" style="color: red;"><%=rs.getString("Result")%></td>
					<%
						} else {
					%>
					<td width="24%" style="color: green;"><%=rs.getString("Result")%></td>
					<%
						}
					%>
					<td width="8%"><%=rs.getString("Memory")%></td>
					<td width="8%"><%=rs.getString("Time")%></td>
					<td width="8%"><%=rs.getString("Language")%></td>
					<td width="8%"><%=rs.getString("CodeLength")%></td>
					<td width="18%"><%=rs.getString("SubmitTime")%></td>
				</tr>
				<%
					} else {
				%>
				<tr class="ps_top2" style="width: 100%;">
					<td width="9%" bgcolor="#cde1ec"><%=rs.getInt("Runid")%></td>
					<td width="12%" bgcolor="#cde1ec"><%=rs.getString("Nickname")%></td>
					<td width="7%" bgcolor="#cde1ec"><%=rs.getInt("Problem_id")%></td>
					<%
						String s = rs.getString("Result");
								if (s.equals("Accepted")) {
					%>
					<td width="24%" style="color: red;" bgcolor="#cde1ec"><%=rs.getString("Result")%></td>
					<%
						} else {
					%>
					<td width="24%" style="color: green;" bgcolor="#cde1ec"><%=rs.getString("Result")%></td>
					<%
						}
					%>
					<td width="8%" bgcolor="#cde1ec"><%=rs.getString("Memory")%></td>
					<td width="8%" bgcolor="#cde1ec"><%=rs.getString("Time")%></td>
					<td width="8%" bgcolor="#cde1ec"><%=rs.getString("Language")%></td>
					<td width="8%" bgcolor="#cde1ec"><%=rs.getString("CodeLength")%></td>
					<td width="18%" bgcolor="#cde1ec"><%=rs.getString("SubmitTime")%></td>
				</tr>
				<%
					}
						status_rank--;
					}
					session.setAttribute("status_rank", String.valueOf(status_rank));
				%>
			</table>
			<p class="ps_p" align="center">
				<a style="margin-right: 20px" href="jsp/first_page.jsp">First
					Page</a> <a style="margin-right: 20px" href="jsp/first_page.jsp"><
					Prev Page</a> <a style="margin-right: 20px" href="jsp/next_page.jsp">Next
					Page ></a> <a href="jsp/last_page.jsp">Last Page</a>
			</p>
		</div>
		<div class="foot">
   			<span class="f1">LuDong Unversity Online Judge 1.0</span>
   			<span class="f2">Developer:Lu Qilu Tang Yukai Xu Fuhao</span>
   			<span class="f2">Copyright@2012-2016 LDU ACM Team. All Rights Reserved.</span>
   		</div>
	</div>
	<jsp:include page="register.jsp"></jsp:include>
	<%
		String sub_result = "Waiting";
		String sub_judge = (String) session.getAttribute("sub_judge");
		if (sub_judge == null)
			sub_judge = "false";
		if (sub_judge.equals("true")) {
			ProblemStatus ps = new ProblemStatus();
			String resultUrl = (String) session.getAttribute("resultUrl");
			ResultSource resultSource = new ResultSource();
			int runid = Integer.parseInt((String) session
					.getAttribute("runid"));
			while (sub_result.equals("Waiting")|| sub_result.equals("Compiling")|| sub_result.equals("Running & Judging")) {
				Thread.sleep(100);
				String sourceString = resultSource.GetResult(resultUrl);
				sub_result = ps.problemStatus(sourceString, runid);
			}
			String p_id = (String) session.getAttribute("pid");
		int pid = Integer.parseInt(p_id);
		ResultSet rs_p=null;
		int psub=0,pac=0;
		String se_p="select p_sub,p_ac from problem where p_id='"+p_id+"'";
		rs_p=SqlConnect.find(se_p);
		if(rs_p.next())
		{
			psub=rs_p.getInt("p_sub")+1;
			pac=rs_p.getInt("p_ac");
		}
		
		System.out.println(psub+pac);
		String up_ps="";
		String radio="";
		
		DecimalFormat df=new DecimalFormat("0.00");
		if(sub_result.equals("Accepted"))
		{
			radio=df.format((pac+1)*1.0/psub);
			
			 up_ps="update problem set p_sub='"+String.valueOf(psub)+"',p_ac='"+String.valueOf(pac+1)+"',p_rd='"+radio+"' where p_id='"+p_id+"'";
		}
		else
		{
			radio=df.format((pac)*1.0/psub);
			out.print(radio);
			up_ps="update problem set p_sub='"+String.valueOf(psub)+"',p_ac='"+String.valueOf(pac)+"',p_rd='"+radio+"' where p_id='"+p_id+"'";
		}
		//ResultSet rs_up=null;
		SqlConnect.add(up_ps);
		//System.out.println(psub+pac+radio);
			request.getSession().setAttribute("sub_judge", "false");
		}
		
		
		
	%>
</body>
</html>
