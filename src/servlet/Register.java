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
			String username=request.getParameter("username");
			boolean re_result=true; //判断注册用户名是否为空或者是否已经注册(true没有存在，false有重复用户名)
			String usersql="select user_name from user where user_name='"+username+"'";
			ResultSet rs=null;
			rs=SqlConnect.find(usersql);
			 if(rs.next())
				 re_result=false;
			// response.setHeader("isExist",String.valueOf(re_result));
			 response.setCharacterEncoding("UTF-8");
			 response.setContentType("application/json; charset=utf-8");
			 String jsonStr = "{\"isExist\":\""+re_result +"\"}";
			 PrintWriter out = null;
			 try {
			     out = response.getWriter();
			     out.write(jsonStr);
			 } catch (IOException e) {
			     e.printStackTrace();
			 } finally {
			     if (out != null) {
			         out.close();
			     }
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				String username = request.getParameter("username");
				String nickname = request.getParameter("nickname");
				String password=request.getParameter("password");
				String school=request.getParameter("school");
				String email=request.getParameter("email");
				String url=(String)request.getSession().getAttribute("url");
				String sql="insert into user(user_name,nick_name,password,school,email) values('"+username+"','"+nickname+"','"+password+"','"+school+"','"+email+"')";
				SqlConnect.add(sql);
				request.getSession().setAttribute("re_password",password);
				request.getSession().setAttribute("re_username",username);
				//response.sendRedirect("index.jsp");
				//System.out.println(url);
				 response.setCharacterEncoding("UTF-8");
				 response.setContentType("application/json; charset=utf-8");
				 String jsonStr = "{\"url\":\""+url+"\"}";
				 PrintWriter out = null;
				 try {
				     out = response.getWriter();
				     out.write(jsonStr);
				 } catch (IOException e) {
				     e.printStackTrace();
				 } finally {
				     if (out != null) {
				         out.close();
				     }
				 }
			}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
