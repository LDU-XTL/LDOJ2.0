package servlet;


import java.io.IOException;
import java.sql.ResultSet;



import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.http.client.ClientProtocolException;

import problem.ProblemStatus;
import server.Server;
import server.SqlConnect;
import server.problemStatus_sql;
import code.fileout;

import com.llwwlql.CodeSubmit;
import com.llwwlql.Login;
import com.llwwlql.ResultSource;

import constant.Constant;

public class SubHandle extends HttpServlet {
	private final String[] User_id = { "Fox233", "Fox234", "Fox235" };
	private static int i=0;
	private String user_name=null;
	private String nick_name=null;
	private String sub_language=null;
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		try {
			String result=(String)req.getSession().getAttribute("result");
			if(result.equals("false"))
				{
				String judge_name="",judge_pass="";
					 judge_name=(String)req.getSession().getAttribute("username");
					 judge_pass=(String)req.getSession().getAttribute("userpass");
					req.getSession().setAttribute("login_username", judge_name);
					req.getSession().setAttribute("login_userpass", judge_pass);
					resp.sendRedirect("../jsp/Login.jsp");
				}
			else
				{
					nick_name=(String)req.getSession().getAttribute("nick_name");
					user_name=(String)req.getSession().getAttribute("user_name");
					sub_language=req.getParameter("s_select");
					String str = req.getParameter("s_txt");
					String problem_id=String.valueOf(req.getParameter("Problem_id"));
					System.out.println(problem_id);
					ResultSet rs=null;
					int count=0;
					
					String sql="SELECT COUNT(problem_id) as problem_count FROM problemstatus WHERE problem_id="+problem_id+" and username='"+user_name+"';";
		
					Server server=new Server();
					rs=server.operate(sql,1);
					if(rs.next())
					{
						count=rs.getInt("problem_count");
					}
				
					String fileName = "C:/Test2";
					new fileout(str,fileName,count);
					
					i = (i+1)%3;
					Login login = new Login(User_id[i], "lduacm", problem_id);			
					String location = login.PostLogin();
					String language=Constant.p_language[Integer.parseInt(sub_language)];
					String file_name=fileName+"/"+String.valueOf(count+1)+".txt";
					CodeSubmit codeSubmit = new CodeSubmit(problem_id,sub_language);
					codeSubmit.setSource(file_name);
					//代码提交
					codeSubmit.Submit(location);
					
					problemStatus_sql psSql = new problemStatus_sql();
					psSql.insert(user_name,nick_name,User_id[i], Integer.parseInt(problem_id), "Wating","","",language,"", "2016-10-11 08:19:52",file_name);
					
					String resultUrl = codeSubmit.getSTATUSUTL() + User_id[i];
					int runid=psSql.selectrun_id(file_name);
					req.getSession().setAttribute("resultUrl",resultUrl);
					req.getSession().setAttribute("runid",String.valueOf(runid));
					req.getSession().setAttribute("sub_judge","true");
					resp.sendRedirect("../jsp/first_page.jsp");
		//			System.out.println(result);
		//			//int pid=Integer.parseInt(problem_id);
					/*ResultSet rs_p=null;
					int psub=0,pac=0;
					String se_p="select p_sub,p_ac from problem where p_id='"+problem_id+"'";
					rs_p=server.operate(se_p,1);
					if(rs_p.next())
					{
						psub=rs_p.getInt("p_sub")+1;
						pac=rs_p.getInt("p_ac");
					}
					System.out.println(psub+pac);
					String up_ps="";
					String radio="";
					DecimalFormat df=new DecimalFormat("0.00");
					if(result.equals("Accepted"))
					{
						radio=df.format((pac+1)*1.0/psub);
						 up_ps="update problem set p_sub='"+String.valueOf(psub)+"',p_ac='"+String.valueOf(pac+1)+",p_rd='"+radio+" where p_id='"+problem_id+"'";
					}
					else
					{
							radio=df.format((pac)*1.0/psub);
							up_ps="update problem set p_sub='"+String.valueOf(psub)+"',p_ac='"+String.valueOf(pac+1)+",p_rd='"+radio+" where p_id='"+problem_id+"'";
					}
					//ResultSet rs_up=null;
					SqlConnect.add(up_ps);
					System.out.println(psub+pac+radio);*/
			}
			
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
