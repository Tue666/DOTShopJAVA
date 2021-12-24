package com.manage.DAL;

import java.util.List;

import com.manage.Models.OrderItem;

public interface IOrderDetailDAL {
	List<OrderItem> findAllOrdered(int orderID);
}
