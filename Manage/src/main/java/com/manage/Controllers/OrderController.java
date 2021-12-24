package com.manage.Controllers;

import java.io.IOException;
import java.util.List;

import com.manage.Models.OrderItem;
import com.manage.Service.IOrderDetailService;
import com.manage.Service.IOrderService;
import com.manage.Service.Implement.OrderDetailService;
import com.manage.Service.Implement.OrderService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/order/*")
public class OrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private IOrderService orderService;
	private IOrderDetailService orderDetailService;
	
	public OrderController() {
		orderService = new OrderService();
		orderDetailService = new OrderDetailService();
	}
	//Get DataTable
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect(request.getContextPath() + "/signIn");
		}
		else {
			String path = request.getPathInfo();
			if (path == null) {
				request.setAttribute("orders", orderService.getOrder());
				RequestDispatcher rd = request.getRequestDispatcher("/pages/Order.jsp");
				rd.forward(request, response);
			}
			else if (path.contains("edit")) {
				String id = path.substring(1).split("/")[1];
				request.setAttribute("order",orderService.findByID(Integer.parseInt(id)));
				RequestDispatcher rd = request.getRequestDispatcher("/pages/EditOrder.jsp");
				rd.forward(request, response);
			}
			else if (path.contains("view")) {
				int id = Integer.parseInt(path.substring(1).split("/")[1]);
				List<OrderItem> ordered = orderDetailService.findAllOrdered(id);
				int totalPrice = ordered.stream().reduce(0, (sum, item) -> sum + item.getOrderPrice(), Integer::sum);
				request.setAttribute("order", orderService.findByID(id));
				request.setAttribute("ordered", ordered);
				request.setAttribute("totalPrice", totalPrice);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/OrderDetail.jsp");
				rd.forward(request, response);
			}
		}
	}
	//Edit - remove
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path != null) {
			String action = path.substring(1).split("/")[0];
			String id = path.substring(1).split("/")[1];
			int idorder = Integer.parseInt(id);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Order.jsp");
			switch (action) {
			case "edit":
				orderService.updateOrder("Accepted", idorder);
				response.sendRedirect(request.getContextPath() + "/order");
				break;	
			case "view":
				request.setAttribute("orders", orderService.getOrder());
				rd.forward(request, response);
				break;	
			default:
				break;
			}
		}
	}
}