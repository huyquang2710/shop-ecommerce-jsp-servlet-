package com.shop.daos;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.shop.entities.User;

public class UserDAO {
	private SessionFactory factory;

	public UserDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	//get username password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "FROM User WHERE email =: e and password =: p";
			Session session = factory.openSession();
			
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(query);
			
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user = (User) q.uniqueResult();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
