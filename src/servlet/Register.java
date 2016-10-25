package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import server.SqlConnect;

public class Register extends HttpServlet {

	 /**
	  用户注册处理
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			try {
				String username=request.getParameter("re_username");
				String nick_name=request.getParameter("re_nickname");
				String password=request.getParameter("re_password");
				String school=request.getParameter("re_school");
				String email=request.getParameter("re_email");
				String url=(String)request.getSession().getAttribute("url");
				String re_result=""; //判断注册用户名是否为空或者是否已经注册
				String usersql="select user_name from user where user_name='"+username+"'";
				ResultSet rs=null;
				rs=SqlConnect.find(usersql);
				if(username=="")
				{
					re_result="empty";
				}
				else if(rs.next())
				{
					//JOptionPane.showMessageDialog(null,"User name already exists");
					re_result="user_name existed";
				}
				else
				{
					String sql="insert into user(user_name,nick_name,password,school,email) values('"+username+"','"+nick_name+"','"+password+"','"+school+"','"+email+"')";
					SqlConnect.add(sql);
					request.getSession().setAttribute("re_password",password);
					request.getSession().setAttribute("re_username",username);
					response.sendRedirect(url);
				}
				request.getSession().setAttribute("re_result",re_result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
