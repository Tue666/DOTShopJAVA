package com.dotshop.DAL.Implement;

import com.dotshop.DAL.IOrderDetailDAL;

public class OrderDetailDAL extends AbstractDAL implements IOrderDetailDAL {
	@Override
	public int insert(int orderID, int productID, int quantity, int price) {
		String query = "INSERT orderdetail VALUES (?, ?, ?, ?)";
		return ExecuteInsert(query, orderID, productID, quantity, price);
	}
}
