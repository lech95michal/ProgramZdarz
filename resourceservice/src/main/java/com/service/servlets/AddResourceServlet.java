package com.service.servlets;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.service.model.ResourceDb;
import com.service.model.ResourceService;

@WebServlet("/add.do")
@MultipartConfig
public class AddResourceServlet extends HttpServlet {

	public String glassfishResource = new File("").getAbsolutePath();
	public String serverPath = "http://localhost:8080/%s";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathToResource = glassfishResource.replaceAll("config", "docroot");
		Part filePart = request.getPart("file");
		String fileName = UUID.randomUUID().toString() + "-" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		String description = request.getParameter("description");
		InputStream fileContent = filePart.getInputStream();

		File uploads = new File(pathToResource);
		File file = new File(uploads, fileName);

		try (InputStream input = fileContent) {
			Files.copy(input, file.toPath());
		}

		ResourceDb resourceDb = new ResourceDb(fileName, description, pathToResource, String.format(serverPath, fileName));
		ResourceService.save(resourceDb);
		getServletContext().getRequestDispatcher("/done.jsp").forward(
				request, response);
	}
}
