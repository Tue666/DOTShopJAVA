package com.dotshop.Controllers;

import java.io.IOException;

import com.dotshop.Models.ProductModel;
import com.dotshop.Service.IProductSevice;
import com.dotshop.Service.Implement.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/product/*")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IProductSevice productService;

	public ProductDetailController() {
		productService = new ProductService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String slug = request.getPathInfo();
		String pathID = slug.substring(slug.lastIndexOf("/") + 1);
		int productID = Integer.parseInt(pathID.split("-")[1]);
		ProductModel product = productService.findByID(productID);
		request.setAttribute("product", product);
		request.setAttribute("similar", productService.findSection("Sold", 10, product.getID()));
		RequestDispatcher rd = request.getRequestDispatcher("/pages/ProductDetail.jsp");
		rd.forward(request, response);
	}
}
