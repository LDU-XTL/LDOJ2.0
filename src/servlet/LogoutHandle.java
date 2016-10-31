package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Constant;

public class LogoutHandle extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * ¹¦ÄÜ£º×¢ÏúµÇÂ½×´Ì¬
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.getSession().setAttribute("login_status","false");
			//Constant.login_status=false;
			request.getSession().setAttribute("result", "false");
			String url=(String)request.getSession().getAttribute("url");
			response.sendRedirect(url);
		
	}

}
