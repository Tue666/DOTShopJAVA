package com.manage.Service;

import java.sql.Date;
import java.util.List;

import com.manage.Models.OrderModel;

public interface IOrderService {
	List<OrderModel> getOrder();

	String insertOrder(int id,int customerID,String customerName,String customerPhone, String customerAddress, String customerEmail, Date createdDay, String status);

	String removeOrder(int id);
}