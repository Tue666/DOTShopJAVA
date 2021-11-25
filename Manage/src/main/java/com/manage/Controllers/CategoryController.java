package com.manage.Controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("Title");
		String slug = request.getParameter("Slug");
		String image = request.getParameter("Image");
		String parentID = request.getParameter("ParentID");
		String displayorder = request.getParameter("DisplayOrder");
		String banner = request.getParameter("Banner");
		String status = request.getParameter("Status");
//		Date createdat = (Date) new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("DateCreatedat"));
		String createdat = request.getParameter("DateCreatedat");
		String createdby = request.getParameter("Createdby");
		
	   categoryService.insertCategory( title, slug, image, parentID, displayorder, banner,status,createdat,createdby,"2021-11-05","admin");
		request.setAttribute("categories", categoryService.getCategory());
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Category.jsp");
		rd.forward(request, response);
	}
}
