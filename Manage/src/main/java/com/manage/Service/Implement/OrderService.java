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
	public List<OrderModel> getOrder() {
		return orderDAL.getOrder();
	}

	@Override
	public int updateOrder(String status, int ID) {
		return orderDAL.updateOrder(status, ID);
	}
	@Override
	public OrderModel findByID(int ID) {

		return orderDAL.findByID(ID);
	}

}
