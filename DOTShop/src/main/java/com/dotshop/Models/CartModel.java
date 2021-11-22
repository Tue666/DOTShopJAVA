package com.dotshop.Models;

public class CartModel extends AbstractModel {
	private int UserID;
	private int ProductID;
	private int Quantity;
	private Boolean Checked;
	
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public Boolean getChecked() {
		return Checked;
	}
	public void setChecked(Boolean checked) {
		Checked = checked;
	}
}
