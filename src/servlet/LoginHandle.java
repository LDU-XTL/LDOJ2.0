package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import constant.Constant;
import server.Server;
import server.SqlConnect;

public class LoginHandle extends HttpServlet {
	
	public void doGet (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String result="false";
		try {
			String username="";
			String userpass="";
			String nick_name="";
			username=request.getParameter("username");
			userpass=request.getParameter("userpass");
			request.getSession().setAttribute("user_name",username);
			String url=(String)request.getSession().getAttribute("url");
			System.out.println(url);
			String sql="select user_name,password from user where user_name='"+username+"'";
			ResultSet rs=null;
			rs=SqlConnect.find(sql);
			
			if(!rs.next())
			{
				result="false";
				JOptionPane.showMessageDialog(null, "No user name found");
			}
			else {
				if(rs.getString("password").equals(userpass))
				{
					result="true";
					Constant.login_status=true;
					String nicksql="select nick_name from user where user_name='"+username+"'";
					ResultSet rsnick=null;
					rsnick=SqlConnect.find(nicksql);
					if(rsnick.next())
						nick_name=rsnick.getString("nick_name");
					request.getSession().setAttribute("nick_name",nick_name);
				}
				else 
				{
					result="false";
					JOptionPane.showMessageDialog(null, "Wrong password");
				}
			}
			if(result.equals("true"))
			{
				request.getSession().setAttribute("result","true");
				request.getSession().setAttribute("username",username);
				response.sendRedirect(url);
			}
			else
				response.sendRedirect(url);
			//response.sendRedirect("index.jsp");
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
