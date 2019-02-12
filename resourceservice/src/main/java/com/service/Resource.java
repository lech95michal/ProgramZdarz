package com.service;

import java.io.InputStream;

public class Resource {

	private String title;
	private String description;
	private InputStream content;
	private String resourcePath;
	private String serverPath;

	public Resource(String title, String description, InputStream content, String resourcePath, String serverPath) {
		this.title = title;
		this.description = description;
		this.content = content;
		this.resourcePath = resourcePath;
		this.serverPath = serverPath;
	}

	public String getResourcePath() {
		return resourcePath;
	}

	public void setResourcePath(String resourcePath) {
		this.resourcePath = resourcePath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() { return description; }

	public void setDescription(String description) { this.description = description; }

	public InputStream getContent() {
		return content;
	}

	public void setContent(InputStream content) {
		this.content = content;
	}


	public String getServerPath() {
		return serverPath;
	}

	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}
}
