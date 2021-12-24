package com.dotshop.Service.Implement;

import java.util.List;

import org.json.simple.JSONObject;

import com.dotshop.DAL.IAccountDAL;
import com.dotshop.DAL.ICartDAL;
import com.dotshop.DAL.IOrderDAL;
import com.dotshop.DAL.IOrderDetailDAL;
import com.dotshop.DAL.IProductDAL;
import com.dotshop.DAL.Implement.AccountDAL;
import com.dotshop.DAL.Implement.CartDAL;
import com.dotshop.DAL.Implement.OrderDAL;
import com.dotshop.DAL.Implement.OrderDetailDAL;
import com.dotshop.DAL.Implement.ProductDAL;
import com.dotshop.Models.AccountModel;
import com.dotshop.Models.CartItem;
import com.dotshop.Service.IPaymentService;

public class PaymentService implements IPaymentService {
	private IAccountDAL accountDAL;
	private IOrderDAL orderDAL;
	private IOrderDetailDAL orderDetailDAL;
	private ICartDAL cartDAL;
	private IProductDAL productDAL;
	
	public PaymentService() {
		accountDAL = new AccountDAL();
		orderDAL = new OrderDAL();
		orderDetailDAL = new OrderDetailDAL();
		cartDAL = new CartDAL();
		productDAL = new ProductDAL();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String order(int userID) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		int statusCode = 401;
		String message = "Unauthorized";
		
		if (userID == 0) {
			res.put("status", status);
			res.put("statusCode", statusCode);
			res.put("message", message);
			return res.toJSONString();
		}
		
		List<CartItem> cartSelected = cartDAL.findSelectedByUserID(userID);
		if (cartSelected.size() < 1) {
			statusCode = 403;
			message = "Select at least one product to place an order!";
			res.put("status", status);
			res.put("statusCode", statusCode);
			res.put("message", message);
			return res.toJSONString();
		}
		
		AccountModel customer = accountDAL.findById(userID);
		int insertedOrder = orderDAL.insert(customer.getID(), customer.getName(), customer.getPhone(), customer.getAddress(), customer.getEmail());
		if (insertedOrder > 0) {
			cartSelected.forEach(item -> {
				orderDetailDAL.insert(insertedOrder, item.getProductID(), item.getCartQuantity(), item.getProductPrice());
				productDAL.updateQuantityByAmount(item.getProductID(), item.getCartQuantity(), "DESC");
			});
			cartDAL.remove(customer.getID(), 0);
			status = "SUCCESS";
			statusCode = 201;
			message = "Create order successfully!";
		}
		
		res.put("status", status);
		res.put("statusCode", statusCode);
		res.put("message", message);
		return res.toJSONString();
	}
}
