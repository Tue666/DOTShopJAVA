package com.manage.Service.Implement;

import java.util.List;

import com.manage.DAL.IOrderDetailDAL;
import com.manage.DAL.Implement.OrderDetailDAL;
import com.manage.Models.OrderItem;
import com.manage.Service.IOrderDetailService;

public class OrderDetailService implements IOrderDetailService {
	private IOrderDetailDAL orderDetailDAL;
	
	public OrderDetailService() {
		orderDetailDAL = new OrderDetailDAL();
	}
	
	@Override
	public List<OrderItem> findAllOrdered(int orderID) {
		return orderDetailDAL.findAllOrdered(orderID);
	}
}
