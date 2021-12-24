package com.manage.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manage.Models.OrderModel;

public class OrderMapper implements IMapper<OrderModel>{
	@Override
	public OrderModel mapRow(ResultSet rs) {
		OrderModel orderModel = new OrderModel();
		try {
			orderModel.setID(rs.getInt("ID"));
			orderModel.setCustomerID(rs.getInt("CustomerID"));
			orderModel.setCustomerName(rs.getString("CustomerName"));
			orderModel.setCustomerPhone(rs.getString("CustomerPhone"));
			orderModel.setCustomerAddress(rs.getString("CustomerAddress"));
			orderModel.setCustomerEmail(rs.getString("CustomerEmail"));
			orderModel.setCreatedAt(rs.getString("CreatedAt"));
			orderModel.setStatus(rs.getString("Status"));
			return orderModel;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
