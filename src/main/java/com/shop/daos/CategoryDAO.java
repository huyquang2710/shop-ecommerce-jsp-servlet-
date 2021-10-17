package com.shop.daos;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shop.entities.Category;

public class CategoryDAO {
	private SessionFactory factory;
	public CategoryDAO(SessionFactory factory) {
		this.factory = factory;
	}
	public Integer saveCategory(Category category) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		int id = (int) session.save(category);
		
		transaction.commit();
		session.close();
		return id;
	}
}
