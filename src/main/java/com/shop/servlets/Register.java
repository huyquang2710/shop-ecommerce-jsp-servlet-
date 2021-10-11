package com.shop.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.entities.User;
import com.shop.helper.FactoryProvider;

@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet{

	private static final long serialVersionUID = 6685169167985897135L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;chartset=UTF-8");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/register.jsp");
		requestDispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;chartset=UTF-8");
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		PrintWriter printWriter = resp.getWriter();
		try {
			// get data from views
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			
			//validations
			if(username.isEmpty()) {
				printWriter.println("Name is Blank");
				return;
			} 
			
			
			// register
			User user = new User();
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			user.setPicture("default.img");
			user.setAddress(address);
			user.setType("normal");
						
			Integer id = (Integer) session.save(user);
			System.out.println("ID: " + id);
			
			//close
			transaction.commit();
			session.close();
			
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("message", "Registration Successful !!!");
			
			resp.sendRedirect("register");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
