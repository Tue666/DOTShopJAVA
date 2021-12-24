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
	public int updateOrder(String status, int ID) {
		String query = "UPDATE orders SET status = ? WHERE ID = ? ";
		return ExecuteUpdate(query, status, ID);
	}

	@Override
	public OrderModel findByID(int ID) {
		String query = "SELECT * FROM orders WHERE ID = ? " ;
		return ExecuteOne(query, new OrderMapper(), ID);
	}
}
