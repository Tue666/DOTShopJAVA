package com.manage.Controllers;

import java.io.IOException;

import com.manage.Service.IOrderService;
import com.manage.Service.Implement.OrderService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/order")
public class OrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private IOrderService orderService;

	public OrderController() {
		orderService = new OrderService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orders", orderService.getOrder());
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Order.jsp");
		rd.forward(request, response);
	}
}