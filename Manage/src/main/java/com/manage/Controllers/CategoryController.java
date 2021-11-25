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

@WebServlet(value = "/category/*")
public class CategoryController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private ICategoryService categoryService;
	
	public CategoryController() {
		categoryService = new CategoryService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path == null) {
			request.setAttribute("categories", categoryService.getCategory());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Category.jsp");
			rd.forward(request, response);
		}
		else if (path.contains("edit")) {
			String id = path.substring(1).split("/")[1];
			request.setAttribute("category",categoryService.findByID(Integer.parseInt(id)));
			RequestDispatcher rd = request.getRequestDispatcher("/pages/EditCategory.jsp");
			rd.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path != null) {
			String action = path.substring(1).split("/")[0];
			String id = path.substring(1).split("/")[1];
			int idcategory = Integer.parseInt(id);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Category.jsp");
			switch (action) {
			case "edit":
				
				String title = request.getParameter("Title");
				String slug = request.getParameter("Slug");
				String image = request.getParameter("Image");
				String parentID = request.getParameter("ParentID");
				String displayorder = request.getParameter("DisplayOrder");
				String banner = request.getParameter("Banner");
				String status = request.getParameter("Status");
				String createdat = request.getParameter("DateCreatedat");
				String createdby = request.getParameter("Createdby");

				categoryService.updateCategory(title, slug, image, parentID, displayorder, banner,status,createdat,createdby,createdat,"Not updated yet", idcategory);
				request.setAttribute("categories", categoryService.getCategory());
				rd.forward(request, response);
				break;
			case "remove":
				categoryService.removeCategory(idcategory);
				request.setAttribute("categories", categoryService.getCategory());
				rd.forward(request, response);
				break;
			default:
				break;
			}
		}
		else {
			String title = request.getParameter("Title");
			String slug = request.getParameter("Slug");
			String image = request.getParameter("Image");
			String parentID = request.getParameter("ParentID");
			String displayorder = request.getParameter("DisplayOrder");
			String banner = request.getParameter("Banner");
			String status = request.getParameter("Status");
			String createdat = request.getParameter("DateCreatedat");
			String createdby = request.getParameter("Createdby");
			
		   categoryService.insertCategory( title, slug, image, parentID, displayorder, banner,status,createdat,createdby,createdat,"Not updated yet");
			request.setAttribute("categories", categoryService.getCategory());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Category.jsp");
			rd.forward(request, response);
		}
	}
}
