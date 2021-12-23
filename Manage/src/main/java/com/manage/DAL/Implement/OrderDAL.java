package com.manage.DAL.Implement;

import java.sql.Date;

import java.util.List;

import com.manage.DAL.IOrderDAL;
import com.manage.Mapper.OrderMapper;
import com.manage.Models.OrderModel;

public class OrderDAL extends AbstractDAL implements IOrderDAL{
	@Override
	public List<OrderModel> getOrder() {
		String query ="SELECT * FROM orders";
		return ExecuteQuery(query, new OrderMapper());
	}
	@Override
	public int insertOrder(int id,int customerID,String customerName,String customerPhone, String customerAddress, String customerEmail, String createdDay, String status) {
		String query = "INSERT INTO orders(ID, CustomerID, CustomerName, CustomerPhone, CustomerAddress, CustomerEmail, CreatedDay, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		return ExecuteInsert(query, id, customerID, customerName, customerPhone, customerAddress, customerEmail, createdDay, status);
	}
	@Override
	public int updateOrder(String customerName,String customerPhone, String customerAddress, String customerEmail, String createdDay, String status, int ID) {
		String query = "UPDATE orders SET customerName = ?, customerPhone = ?, customerAddress = ?, customerEmail = ?, createdDay = ?, status = ? WHERE ID = ? ";
		return ExecuteUpdate(query,customerName, customerPhone, customerAddress, customerEmail, createdDay, status, ID);
	}

	@Override
	public OrderModel findByID(int ID) {
		String query = "SELECT * FROM orders WHERE ID = ? " ;
		return ExecuteOne(query, new OrderMapper(), ID);
	}
	@Override
	public int removeOrder(int ID) {
		String query = "DELETE FROM orders WHERE ID = ?";
		return ExecuteUpdate(query,ID);
	}
}
