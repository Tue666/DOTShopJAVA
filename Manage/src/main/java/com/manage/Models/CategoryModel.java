package com.manage.Models;


public class CategoryModel extends AbstractModel{
	private String Title;
	private String Slug;
	private String Image;
	private String ParentID;
	private String DisplayOrder;
	private String Banner;
	private String Status;
	
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
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
	public String getParentID() {
		return ParentID;
	}
	public void setParentID(String parentID) {
		ParentID = parentID;
	}
	public String getDisplayOrder() {
		return DisplayOrder;
	}
	public void setDisplayOrder(String displayOrder) {
		DisplayOrder = displayOrder;
	}
	public String getBanner() {
		return Banner;
	}
	public void setBanner(String banner) {
		Banner = banner;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
}
