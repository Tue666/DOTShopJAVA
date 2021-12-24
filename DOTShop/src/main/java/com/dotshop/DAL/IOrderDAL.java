package com.dotshop.DAL;

public interface IOrderDAL {
	int insert(int customerID, String customerName, String customerPhone, String customerAddress, String customerEmail);
}
