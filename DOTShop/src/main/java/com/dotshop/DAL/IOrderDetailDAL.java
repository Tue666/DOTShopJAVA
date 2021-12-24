package com.dotshop.DAL;

public interface IOrderDetailDAL {
	int insert(int orderID, int productID, int quantity, int price);
}
