package com.manage.DAL.Implement;

import java.util.List;

import com.manage.DAL.IOrderDetailDAL;
import com.manage.Mapper.OrderItemMapper;
import com.manage.Models.OrderItem;

public class OrderDetailDAL extends AbstractDAL implements IOrderDetailDAL {
	@Override
	public List<OrderItem> findAllOrdered(int orderID) {
		String query = "SELECT OD.ProductID, P.Image AS ProductImage, P.Name AS ProductName, OD.Quantity AS OrderQuantity, OD.Price AS OrderPrice FROM orderdetail AS OD JOIN product AS P ON OD.ProductID = P.ID WHERE OD.OrderID = " + orderID;
		return ExecuteQuery(query, new OrderItemMapper());
	}
}
