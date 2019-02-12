package com.service.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthorizationFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("username") != null
				|| req.getRequestURI().endsWith("login.jsp")
				|| req.getRequestURI().endsWith("login.do")
				|| req.getRequestURI().endsWith("css")
				|| req.getRequestURI().endsWith("png")) {
			chain.doFilter(req, resp);
		} else {
			resp.sendRedirect(resp.encodeRedirectURL("login.jsp"));
		}
	}

	@Override
	public void destroy() {

	}
}