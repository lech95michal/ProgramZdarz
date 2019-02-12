package com.service.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ResourceDb implements Serializable {

	@Id
	@GeneratedValue
	private Long id;
	@Column(name = "TITLE")
	private String title;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "RESOURCEPATH")
	private String resourcePath;

	@Column(name = "SERVERPATH")
	private String serverPath;


	public ResourceDb(String title, String description, String resourcePath, String serverPath) {
		this.title = title;
		this.description = description;
		this.resourcePath = resourcePath;
		this.serverPath = serverPath;
	}

	public ResourceDb() {
	}

	@Override
	public String toString() {
		return "ResourceDb{" +
				"id=" + id +
				", title='" + title + '\'' +
				", description='" + description + '\'' +
				", resourcePath='" + resourcePath + '\'' +
				", serverPath='" + serverPath + '\'' +
				'}';
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResourcePath() {
		return resourcePath;
	}

	public void setResourcePath(String resourcePath) {
		this.resourcePath = resourcePath;
	}

	public String getServerPath() {
		return serverPath;
	}

	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}
}
