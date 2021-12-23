package com.manage.Service.Implement;

import java.sql.Date;
import java.util.List;

import org.json.simple.JSONObject;

import com.manage.DAL.IOrderDAL;
import com.manage.DAL.Implement.OrderDAL;
import com.manage.Models.OrderModel;
import com.manage.Service.IOrderService;

public class OrderService implements IOrderService{
	private IOrderDAL orderDAL;

	public OrderService() {
		orderDAL = new OrderDAL();
	}

	@Override
	public String insertOrder(int id,int customerID,String customerName,String customerPhone, String customerAddress, String customerEmail, Date createdDay, String status) {
		JSONObject res = new JSONObject();
		String message = "Insert Order failed because something went wrong!";
		res.put("message",message);
		return res.toJSONString();
	}

	@Override
	public String removeOrder(int id) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		String message = "Remove Order failed because something went wrong!";
		int removed = orderDAL.removeOrder(id);
		if (removed > 0) {
			status = "SUCCESS";
			message = "The Order has been deleted";
		}
		res.put("status", status);
		res.put("message", message);
		res.put("id", id);
		return res.toJSONString();
	}


	@Override
	public List<OrderModel> getOrder() {
		return orderDAL.getOrder();
	}
}
