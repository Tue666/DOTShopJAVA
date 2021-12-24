package com.manage.Mapper;

import java.sql.ResultSet;

import com.manage.Models.OrderItem;

public class OrderItemMapper implements IMapper<OrderItem> {
	@Override
	public OrderItem mapRow(ResultSet rs) {
		OrderItem orderItem = new OrderItem();
		try {
			orderItem.setProductID(rs.getInt("ProductID"));
			orderItem.setProductImage(rs.getString("ProductImage"));
			orderItem.setProductName(rs.getString("ProductName"));
			orderItem.setOrderQuantity(rs.getInt("OrderQuantity"));
			orderItem.setOrderPrice(rs.getInt("OrderPrice"));
			return orderItem;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
