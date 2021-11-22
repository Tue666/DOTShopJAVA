package com.dotshop.Models;

public class CartItem {
	private int ProductID;
	private String ProductName;
	private String ProductSlug;
	private String ProductImage;
	private int ProductPrice;
	private int ProductDiscount;
	private int VATFee;
	private int CartQuantity;
	private Boolean CartChecked;
	
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getProductSlug() {
		return ProductSlug;
	}
	public void setProductSlug(String productSlug) {
		ProductSlug = productSlug;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}
	public int getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(int productPrice) {
		ProductPrice = productPrice;
	}
	public int getProductDiscount() {
		return ProductDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		ProductDiscount = productDiscount;
	}
	public int getVATFee() {
		return VATFee;
	}
	public void setVATFee(int vATFee) {
		VATFee = vATFee;
	}
	public int getCartQuantity() {
		return CartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		CartQuantity = cartQuantity;
	}
	public Boolean getCartChecked() {
		return CartChecked;
	}
	public void setCartChecked(Boolean cartChecked) {
		CartChecked = cartChecked;
	}
}
