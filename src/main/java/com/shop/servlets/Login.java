package com.shop.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.constants.SessionAttr;
import com.shop.daos.UserDAO;
import com.shop.entities.User;
import com.shop.helper.FactoryProvider;

@WebServlet(urlPatterns = "/login")
public class Login extends HttpServlet{

	private static final long serialVersionUID = 4718481161313584980L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;chartset=UTF-8");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/login.jsp");
		requestDispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get data form views
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		//validation
		UserDAO userDAO = new UserDAO(FactoryProvider.getFactory());
		User user = userDAO.getUserByEmailAndPassword(email, password);
		
		HttpSession httpSession = req.getSession();
		
		//login
		if(user == null) {
			httpSession.setAttribute("message", "Invalid Details !! Try with another one");
			resp.sendRedirect("login");
		} else {
			httpSession.setAttribute(SessionAttr.CURRENT_USER, user);
			
			//admin
			if(user.getType().equals(SessionAttr.ROLE_ADMIN)) {
				resp.sendRedirect("admin");
			} else if(user.getType().equals(SessionAttr.ROLE_USER)) {
				resp.sendRedirect("normal");
			} else {
				httpSession.setAttribute("message", "We have not identified user type");
			}
		}
	}
}
