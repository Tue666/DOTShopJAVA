package com.manage.Service;

import java.sql.Date;
import java.util.List;

import com.manage.Models.OrderModel;

public interface IOrderService {
	List<OrderModel> getOrder();

	int updateOrder(String status, int ID);

	OrderModel findByID(int ID);
	
}