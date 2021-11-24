package com.manage.Controllers;

import java.io.IOException;

import com.manage.Service.ICategoryService;
import com.manage.Service.Implement.CategoryService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/category")
public class CategoryController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private ICategoryService categoryService;
	
	public CategoryController() {
		categoryService = new CategoryService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("categories", categoryService.getCategory());
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Category.jsp");
		rd.forward(request, response);
	}
}
