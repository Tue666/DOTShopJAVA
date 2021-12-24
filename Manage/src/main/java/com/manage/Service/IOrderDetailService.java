package com.manage.Service;

import java.util.List;

import com.manage.Models.OrderItem;

public interface IOrderDetailService {
	List<OrderItem> findAllOrdered(int orderID);
}
