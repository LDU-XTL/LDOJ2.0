package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Constant;

public class change_cs_prev extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int status_rank=Integer.parseInt((String)request.getSession().getAttribute("status_rank"));
		status_rank+=8;
		request.getSession().setAttribute("status_rank", String.valueOf(status_rank));
	response.sendRedirect("../jsp/prev_page.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Constant.status_rank+=8;
		response.sendRedirect("../jsp/prev_page.jsp");
	}
}
