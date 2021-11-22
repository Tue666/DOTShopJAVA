package com.dotshop.Models;

public class ProductModel extends AbstractModel {
	private String Name;
	private String Slug;
	private String Image;
	private String Description;
	private int Price;
	private int Discount;
	private int Quantity;
	private int Viewed;
	private int Searched;
	private int Sold;
	private int VATFee;
	private int _Limit;
	private int Tag;
	private String Status;
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getSlug() {
		return Slug;
	}
	public void setSlug(String slug) {
		Slug = slug;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getDiscount() {
		return Discount;
	}
	public void setDiscount(int discount) {
		Discount = discount;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public int getViewed() {
		return Viewed;
	}
	public void setViewed(int viewed) {
		Viewed = viewed;
	}
	public int getSearched() {
		return Searched;
	}
	public void setSearched(int searched) {
		Searched = searched;
	}
	public int getSold() {
		return Sold;
	}
	public void setSold(int sold) {
		Sold = sold;
	}
	public int getVATFee() {
		return VATFee;
	}
	public void setVATFee(int vATFee) {
		VATFee = vATFee;
	}
	public int get_Limit() {
		return _Limit;
	}
	public void set_Limit(int _Limit) {
		this._Limit = _Limit;
	}
	public int getTag() {
		return Tag;
	}
	public void setTag(int tag) {
		Tag = tag;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
}
