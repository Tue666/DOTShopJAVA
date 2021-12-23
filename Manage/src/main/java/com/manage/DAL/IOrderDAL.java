package com.manage.DAL;

import java.sql.Date;
import java.util.List;

import com.manage.Models.OrderModel;

public interface IOrderDAL {
	List<OrderModel> getOrder();

	int insertOrder(int id,int customerID,String customerName,String customerPhone, String customerAddress, String customerEmail, String createdDay, String status);

	int updateOrder(String customerName,String customerPhone, String customerAddress, String customerEmail, String createdDay, String status, int ID);
	
	OrderModel findByID(int ID);
	
	int removeOrder(int ID);
}
