package com.service.servlets;

import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.ResourceDb;
import com.service.model.ResourceService;

@WebServlet("/remove.do")
@MultipartConfig
public class RemoveResourceServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String resourcePath = request.getParameter("path");
		String resourceName = request.getParameter("resourcename");
		String resourceId = request.getParameter("id");

		try {
			Files.delete(Paths.get(resourcePath));
		} catch (NoSuchFileException x) {
			System.err.format("%s: no such" + " file or directory%n", resourceName);
		} catch (DirectoryNotEmptyException x) {
			System.err.format("%s not empty%n", resourceName);
		} catch (IOException x) {
			System.err.println(x);
		}

		ResourceDb resourceDb = ResourceService.getResourceById(Long.parseLong(resourceId));
		ResourceService.delete(resourceDb);

		getServletContext().getRequestDispatcher("/done.jsp").forward(
				request, response);
	}
}
