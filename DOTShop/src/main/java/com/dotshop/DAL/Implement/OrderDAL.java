package com.dotshop.DAL.Implement;

import com.dotshop.DAL.IOrderDAL;

public class OrderDAL extends AbstractDAL implements IOrderDAL {
	@Override
	public int insert(int customerID, String customerName, String customerPhone, String customerAddress,
			String customerEmail) {
		String query = "INSERT orders VALUES (NULL, ?, ?, ?, ?, ?, NOW(), 'Processing')";
		return ExecuteInsert(query, customerID, customerName, customerPhone, customerAddress, customerEmail);
	}
}
