package com.manage.DAL;

import java.sql.Date;
import java.util.List;

import com.manage.Models.OrderModel;

public interface IOrderDAL {
	List<OrderModel> getOrder();

	int updateOrder(String status, int ID);
	
	OrderModel findByID(int ID);
	
}
