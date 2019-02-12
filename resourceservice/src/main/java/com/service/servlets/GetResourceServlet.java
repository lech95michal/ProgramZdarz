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

@WebServlet("/resource.do")
public class GetResourceServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ResourceDb> allResources = ResourceService.getResources();
		req.setAttribute("resources", allResources);
		req.getRequestDispatcher("/resourceList.jsp").forward(req, resp);
	}

}
