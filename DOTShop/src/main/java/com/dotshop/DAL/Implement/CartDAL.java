package com.dotshop.DAL.Implement;

import java.util.List;

import com.dotshop.DAL.ICartDAL;
import com.dotshop.Mapper.CartItemMapper;
import com.dotshop.Mapper.CartMapper;
import com.dotshop.Models.CartItem;
import com.dotshop.Models.CartModel;

public class CartDAL extends AbstractDAL implements ICartDAL {
	@Override
	public int totalRecordsByUserID(int userID) {
		String query = "SELECT COUNT(DISTINCT ID) FROM cart WHERE UserID = ?";
		return ExecuteSelected(query, userID);
	}

	@Override
	public CartModel findSingle(int userID, int productID) {
		String query = "SELECT * FROM cart WHERE UserID = ? AND ProductID = ?";
		return ExecuteOne(query, new CartMapper(), userID, productID);
	}

	@Override
	public List<CartItem> findCartByUserID(int userID) {
		String query = "SELECT p.ID AS ProductID, p.Name AS ProductName, p.Slug AS ProductSlug, p.Image AS ProductImage, p.Price AS ProductPrice, p.Discount AS ProductDiscount, p.VATFee, c.Quantity AS CartQuantity, c.Checked AS CartChecked FROM product AS p JOIN cart AS c ON p.ID = c.ProductID WHERE c.UserID = ? ORDER BY c.CreatedAt DESC";
		return ExecuteQuery(query, new CartItemMapper(), userID);
	}
	
	@Override
	public List<CartItem> findSelectedByUserID(int userID) {
		String query = "SELECT p.ID AS ProductID, p.Name AS ProductName, p.Slug AS ProductSlug, p.Image AS ProductImage, p.Price AS ProductPrice, p.Discount AS ProductDiscount, p.VATFee, c.Quantity AS CartQuantity, c.Checked AS CartChecked FROM product AS p JOIN cart AS c ON p.ID = c.ProductID WHERE c.UserID = ? AND Checked = true ORDER BY c.CreatedAt DESC";
		return ExecuteQuery(query, new CartItemMapper(), userID);
	}

	@Override
	public int insert(int userID, int productID, int quantity, String userName) {
		String query = "INSERT INTO cart(UserID, ProductID, Quantity, CreatedBy) VALUES (?, ?, ?, ?)";
		return ExecuteInsert(query, userID, productID, quantity, userName);
	}

	@Override
	public int remove(int userID, int productID) {
		String query = "";
		// Product ID = 0 will remove all checked item
		if (productID == 0) {
			query = "DELETE FROM cart WHERE UserID = ? AND Checked = true";
			return ExecuteUpdate(query, userID);
		} else {
			query = "DELETE FROM cart WHERE UserID = ? AND ProductID = ?";
			return ExecuteUpdate(query, userID, productID);
		}
	}

	@Override
	public int updateQuantity(int userID, int productID, int newQuantity, String userName) {
		String query = "UPDATE cart SET Quantity = ?, UpdatedAt = NOW(), UpdatedBy = ? WHERE UserID = ? AND ProductID = ?";
		return ExecuteUpdate(query, newQuantity, userName, userID, productID);
	}

	@Override
	public int toggleChecked(int userID, int productID, Boolean checked, String userName) {
		String query = "";
		// Product ID = 0 will toggle all
		if (productID == 0) {
			query = "UPDATE cart SET Checked = ?, UpdatedAt = NOW(), UpdatedBy = ? WHERE UserID = ?";
			return ExecuteUpdate(query, checked, userName, userID);
		} else {
			query = "UPDATE cart SET Checked = ?, UpdatedAt = NOW(), UpdatedBy = ? WHERE UserID = ? AND ProductID = ?";
			return ExecuteUpdate(query, checked, userName, userID, productID);
		}
	}
	
}
