package com.shop.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.daos.CategoryDAO;
import com.shop.entities.Category;
import com.shop.helper.FactoryProvider;

@WebServlet(urlPatterns = "/add-category")
public class CategoryController extends HttpServlet{

	private static final long serialVersionUID = 6084552612662486005L;
	
	private static CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//add categpry and add product
		String operation = req.getParameter("operation");
		if(operation.trim().equals("addcategory")) {
			
			// add category
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			
			Category category = new Category();
			category.setTitle(title);
			category.setDescription(description);
			
			// save db
			int categoryId = categoryDAO.saveCategory(category);
			
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("message", "Add category successfully" + categoryId);
			resp.sendRedirect("admin");
			return;
			
		} else if(operation.trim().equals("addproduct")) {
			
		}
		
		
	}
	
}
