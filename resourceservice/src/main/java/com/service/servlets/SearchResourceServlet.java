package com.service.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.ResourceDb;
import com.service.model.ResourceService;


@WebServlet("/search.do")
public class SearchResourceServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		List<ResourceDb> results = ResourceService.find(search);
		request.setAttribute("resources", results);
		getServletContext().getRequestDispatcher("/resourceList.jsp").forward(request, response);
	}
}
