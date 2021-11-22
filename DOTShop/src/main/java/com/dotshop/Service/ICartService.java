package com.dotshop.Service;

import java.util.List;

import com.dotshop.Models.CartItem;
import com.dotshop.Models.CartModel;

public interface ICartService {
	int totalRecordsByUserID(int userID);
	
	CartModel findSingle(int userID, int productID);
	
	List<CartItem> findCartByUserID(int userID);

	String insert(int userID, int productID, int quantity, String userName);
	
	String remove(int userID, int productID);

	String updateQuantity(int userID, int productID, int newQuantity, String userName);
	
	String toggleChecked(int userID, int productID, Boolean checked, String userName);
}
