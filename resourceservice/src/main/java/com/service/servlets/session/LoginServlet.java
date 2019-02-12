package com.service.servlets.session;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.model.authorization.User;
import com.service.model.authorization.UserDao;


@WebServlet(urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {

	@EJB
	private UserDao userDao;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String login = req.getParameter("login");
		String password = req.getParameter("password");

		User user = userDao.findUser(login);

		if (user != null && password.equals(user.getPassword())) {
			HttpSession session = req.getSession();
			session.setAttribute("username", login);
			resp.sendRedirect(resp.encodeRedirectURL("index.jsp"));
		} else {
			resp.sendRedirect(resp.encodeRedirectURL("login.jsp?invalidData"));
		}
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(resp.encodeRedirectURL("login.jsp"));
	}
}