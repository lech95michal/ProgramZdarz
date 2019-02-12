package com.service.servlets.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/logout.do")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("username") != null){
			session.invalidate();
			resp.sendRedirect(resp.encodeRedirectURL("login.jsp"));
		} else {
			resp.sendRedirect(resp.encodeRedirectURL("resourceAdd.jsp"));
		}

	}
}
