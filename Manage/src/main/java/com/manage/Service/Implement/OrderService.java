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
	//ADD
	@Override
	public String insertOrder(int id,int customerID,String customerName,String customerPhone, String customerAddress, String customerEmail, String createdDay, String status) {
		JSONObject res = new JSONObject();
		String message = "Insert Order failed because something went wrong!";
		res.put("message",message);
		return res.toJSONString();
	}
	@Override
	public List<OrderModel> getOrder() {
		return orderDAL.getOrder();
	}

	@Override
	public int updateOrder(String customerName,String customerPhone, String customerAddress, String customerEmail, String createdDay, String status, int ID) {
		return orderDAL.updateOrder(customerName, customerPhone, customerAddress, customerEmail, createdDay, status, ID);
	}
	@Override
	public OrderModel findByID(int ID) {

		return orderDAL.findByID(ID);
	}

	@Override
	public int removeOrder(int ID) {
		return orderDAL.removeOrder(ID);
	}
}
