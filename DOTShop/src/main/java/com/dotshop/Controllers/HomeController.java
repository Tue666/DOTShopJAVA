package com.dotshop.Controllers;

import java.io.IOException;

import com.dotshop.Service.ICategoryService;
import com.dotshop.Service.IProductSevice;
import com.dotshop.Service.Implement.CategoryService;
import com.dotshop.Service.Implement.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/landing")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ICategoryService categoryService;
	private IProductSevice productService;

	public HomeController() {
		categoryService = new CategoryService();
		productService = new ProductService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("categories", categoryService.findAll());
		request.setAttribute("topSold", productService.findSection("Sold", 10, 0));
		request.setAttribute("topSearched", productService.findSection("Searched", 10, 0));
		request.setAttribute("topViewed", productService.findSection("Viewed", 10, 0));
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Home.jsp");
		rd.forward(request, response);
	}
}
