package com.dotshop.DAL;

import java.util.List;

import com.dotshop.Models.CartItem;
import com.dotshop.Models.CartModel;

public interface ICartDAL {
	int totalRecordsByUserID(int userID);
	
	CartModel findSingle(int userID, int productID);
	
	List<CartItem> findCartByUserID(int userID);
	
	List<CartItem> findSelectedByUserID(int userID);
	
	int insert(int userID, int productID, int quantity, String userName);
	
	int remove(int userID, int productID);
	
	int updateQuantity(int userID, int productID, int newQuantity, String userName);
	
	int toggleChecked(int userID, int productID, Boolean checked, String userName);
}
