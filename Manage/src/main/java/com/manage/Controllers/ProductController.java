package com.manage.Controllers;

import java.io.IOException;
import com.manage.Service.IProductService;
import com.manage.Service.Implement.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/product")
public class ProductController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private IProductService productService;
	
	public ProductController() {
		productService = new ProductService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("producties", productService.getProduct());
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Product.jsp");
		rd.forward(request, response);
	}
}
