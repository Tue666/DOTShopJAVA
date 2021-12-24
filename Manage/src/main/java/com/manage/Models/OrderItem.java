package com.manage.Models;

public class OrderItem {
	private int ProductID;
	private String ProductImage;
	private String ProductName;
	private int OrderQuantity;
	private int OrderPrice;
	
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getOrderQuantity() {
		return OrderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		OrderQuantity = orderQuantity;
	}
	public int getOrderPrice() {
		return OrderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		OrderPrice = orderPrice;
	}
}
