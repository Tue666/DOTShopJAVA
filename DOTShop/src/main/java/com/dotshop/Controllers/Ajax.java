package com.dotshop.Controllers;

import java.io.IOException;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.dotshop.Models.CartModel;
import com.dotshop.Models.ProductModel;
import com.dotshop.Service.ICartService;
import com.dotshop.Service.IProductSevice;
import com.dotshop.Service.Implement.CartService;
import com.dotshop.Service.Implement.ProductService;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/ajax")
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IProductSevice productService;
	private ICartService cartService;

	public Ajax() {
		productService = new ProductService();
		cartService = new CartService();
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		JSONObject res = new JSONObject();
		HttpSession session = request.getSession(false);
		int userID = session.getAttribute("id") == null ? 0 : Integer.parseInt(session.getAttribute("id").toString());
		String userName = "admin";
		switch (action) {
		case "LOAD_LIST_PRODUCT": {
			response.setContentType("application/json");

			int take = 10;
			int page = Integer.parseInt(request.getParameter("page"));
			int takedRecords = page * take;

			List<ProductModel> products = productService.findAllWithPagination(page, take);
			int totalRecords = productService.totalRecords();

			Gson gson = new Gson();
			res.put("products", JSONValue.parse(gson.toJson(products)));
			res.put("hasMore", takedRecords < totalRecords);
			response.getWriter().write(res.toJSONString());
		}
			break;
		case "LOAD_CART_BADGE": {
			if (userID == 0) {
				response.getWriter().write("0");
			} else {
				int totalRecordsByUser = cartService.totalRecordsByUserID(userID);
				response.getWriter().write(Integer.toString(totalRecordsByUser));
			}
		}
			break;
		case "TOGGLE_CHECKED": {
			int productID = Integer.parseInt(request.getParameter("productID"));
			Boolean checked = Boolean.parseBoolean(request.getParameter("checked"));

			response.getWriter().write(cartService.toggleChecked(userID, productID, checked, userName));
		}
			break;
		case "UPDATE_QUANTITY_CART": {
			int productID = Integer.parseInt(request.getParameter("productID"));
			int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));

			response.getWriter().write(cartService.updateQuantity(userID, productID, newQuantity, userName));
		}
			break;
		case "ADD_CART": {
			if (userID == 0) {
				res.put("status", "ERROR");
				res.put("message", "Not signed in!");
				response.getWriter().write(res.toJSONString());
			} else {
				response.setContentType("application/json");

				int amount = Integer.parseInt(request.getParameter("amount"));
				int productID = Integer.parseInt(request.getParameter("productID"));

				CartModel cartItem = cartService.findSingle(userID, productID);
				if (cartItem != null) {
					int newQuantity = cartItem.getQuantity() + amount;
					response.getWriter().write(cartService.updateQuantity(userID, productID, newQuantity, userName));
				} else {
					response.getWriter().write(cartService.insert(userID, productID, amount, userName));
				}
			}
		}
			break;
		case "REMOVE_CART": {
			response.setContentType("application/json");

			int productID = Integer.parseInt(request.getParameter("productID"));

			response.getWriter().write(cartService.remove(userID, productID));
		}
		default:
			break;
		}
	}
}
