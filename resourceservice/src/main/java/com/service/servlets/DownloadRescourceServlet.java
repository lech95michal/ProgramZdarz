package com.service.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class DownloadRescourceServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public static int BUFFER_SIZE = 1024 * 100;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resourcePath = request.getParameter("path");
		String resourceName = request.getParameter("resourcename");
		File file = new File(resourcePath);
		OutputStream outStream = null;
		FileInputStream inputStream = null;

		if (file.exists()) {

			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);

			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", resourceName);
			response.setHeader(headerKey, headerValue);

			try {

				outStream = response.getOutputStream();
				inputStream = new FileInputStream(file);
				byte[] buffer = new byte[BUFFER_SIZE];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
			} catch (IOException ioExObj) {
				System.out.println("Exception While Performing The I/O Operation?= " + ioExObj.getMessage());
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}

				outStream.flush();
				if (outStream != null) {
					outStream.close();
				}
			}
		} else {
			response.getWriter().println("<h3>File " + resourceName + " Is Not Present .....!</h3>");
		}
	}
}

