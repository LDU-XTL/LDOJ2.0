package servlet;

import java.io.IOException;
import java.io.PrintWriter;
<<<<<<< HEAD
import java.sql.ResultSet;
import java.sql.SQLException;
=======
>>>>>>> master

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import server.Server;
import server.SqlConnect;

public class LoginHandle extends HttpServlet {
	
	public void doGet (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		boolean result=false;
		try {
			String username="";
			String userpass="";
			username=request.getParameter("username");
			userpass=request.getParameter("userpass");
			//System.out.println(username+" "+userpass);
			request.setAttribute("username", username);
			request.setAttribute("userpass",userpass);
			String pre_url=(String)request.getAttribute("url");
			System.out.println(pre_url);
			String sql="select user_name,password from user where user_name='"+username+"'";
			ResultSet rs=null;
			rs=SqlConnect.find(sql);
			if(!rs.next())
			{
				request.setAttribute("result",false);
				//response.sendRedirect(pre_url);
			}
			else {
				if(rs.getString("password").equals(userpass))
				{
					request.setAttribute("result",true);
				}
				else 
					request.setAttribute("result",false);
			}
			response.sendRedirect("../index.jsp?username="+username);
			//response.sendRedirect("index.jsp");
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//response.sendRedirect("../index.jsp?"+username);
		//request.getRequestDispatcher("../index.jsp").forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
=======
public class LoginHandle extends HttpServlet {

	/**
	 	登陆信息验证，并跳转到当前页面
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username=request.getParameter("username");
		String userpass=request.getParameter("userpass");
		String sql="select ";
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

>>>>>>> master
	}

}
