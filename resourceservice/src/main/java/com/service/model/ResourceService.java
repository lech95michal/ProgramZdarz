package com.service.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.service.Resource;
import com.service.util.HibernateUtil;

public class ResourceService {

	private ResourceService() {};

	public static ResourceDb getResourceById(Long id) {
		ResourceDb resourceDb;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			resourceDb = session.get(ResourceDb.class, id);
		}

		return resourceDb;
	}

	public static List<ResourceDb> getResources() {
		List<ResourceDb> clothes;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			clothes = session.createQuery("from ResourceDb").list();
		}
		return clothes;
	}

	public static List<ResourceDb> find(String searchContext) {
		List<ResourceDb> allResources = getResources();
		List<ResourceDb> tempResources = new ArrayList<>();
		for (ResourceDb resource : allResources) {
			if (resource.getTitle().contains(searchContext) || resource.getDescription().contains(searchContext)) {
				tempResources.add(resource);
			}
		}
		return tempResources;
	}

	public static void save(ResourceDb resourceDb) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			session.beginTransaction();
			session.save(resourceDb);
			session.getTransaction().commit();
		}
	}

	public static void delete(ResourceDb resourceDb) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			session.beginTransaction();
			session.delete(resourceDb);
			session.getTransaction().commit();
		}
	}
}
