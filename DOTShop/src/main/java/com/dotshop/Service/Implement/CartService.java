package com.dotshop.Service.Implement;

import java.util.List;

import org.json.simple.JSONObject;

import com.dotshop.DAL.ICartDAL;
import com.dotshop.DAL.IProductDAL;
import com.dotshop.DAL.Implement.CartDAL;
import com.dotshop.DAL.Implement.ProductDAL;
import com.dotshop.Models.CartItem;
import com.dotshop.Models.CartModel;
import com.dotshop.Models.ProductModel;
import com.dotshop.Service.ICartService;
import com.google.gson.Gson;

public class CartService implements ICartService {
	private ICartDAL cartDAL;
	private IProductDAL productDAL;

	public CartService() {
		cartDAL = new CartDAL();
		productDAL = new ProductDAL();
	}

	@Override
	public int totalRecordsByUserID(int userID) {
		return cartDAL.totalRecordsByUserID(userID);
	}

	@Override
	public CartModel findSingle(int userID, int productID) {
		return cartDAL.findSingle(userID, productID);
	}

	@Override
	public List<CartItem> findCartByUserID(int userID) {
		return cartDAL.findCartByUserID(userID);
	}

	@SuppressWarnings("unchecked")
	@Override
	public String insert(int userID, int productID, int quantity, String userName) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		String message = "Insert product failed because something went wrong!";
		ProductModel product = productDAL.findByID(productID);
		int productQuantity = product.getQuantity();
		int productLimit = product.get_Limit();

		if (productQuantity < 0) {
			message = "Sold out!";
		} else if (quantity > productLimit && productLimit > 0 && productLimit <= productQuantity) {
			message = "Maximum purchase quantity for this product is " + productLimit;
		} else if (quantity > productQuantity) {
			message = "The remaining quantity of the product is " + productQuantity;
		} else {
			int insertedID = cartDAL.insert(userID, productID, quantity, userName);
			if (insertedID > 0) {
				status = "SUCCESS";
				message = "Added product successfully";
				res.put("totalRecords", cartDAL.totalRecordsByUserID(userID));
			}
		}
		res.put("status", status);
		res.put("message", message);
		return res.toJSONString();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String remove(int userID, int productID) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		String message = "Update product failed because something went wrong!";

		int removed = cartDAL.remove(userID, productID);
		if (removed > 0) {
			status = "SUCCESS";
			message = "The product has been deleted";
		}
		res.put("status", status);
		res.put("message", message);
		res.put("productID", productID);
		return res.toJSONString();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String updateQuantity(int userID, int productID, int newQuantity, String userName) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		String message = "Update product failed because something went wrong!";
		int prevent = 0;
		ProductModel product = productDAL.findByID(productID);
		int productQuantity = product.getQuantity();
		int productLimit = product.get_Limit();

		if (productQuantity < 0) {
			message = "Sold out!";
			prevent = 1;
		} else if (newQuantity > productLimit && productLimit > 0 && productLimit <= productQuantity) {
			message = "Maximum purchase quantity for this product is " + productLimit;
			prevent = productLimit;
		} else if (newQuantity > productQuantity) {
			message = "The remaining quantity of the product is " + productQuantity;
			prevent = productQuantity;
		} else {
			int updatedRows = cartDAL.updateQuantity(userID, productID, newQuantity, userName);
			if (updatedRows >= 1) {
				status = "SUCCESS";
				message = "Updated product successfully";
				Gson gson = new Gson();
				res.put("item", gson.toJson(cartDAL.findSingle(userID, productID)));
			}
		}
		res.put("status", status);
		res.put("message", message);
		res.put("prevent", prevent);
		return res.toJSONString();
	}

	@Override
	public String toggleChecked(int userID, int productID, Boolean checked, String userName) {
		int res = cartDAL.toggleChecked(userID, productID, checked, userName);
		return res > 0 ? "SUCCESS" : "FAILED";
	}
}
