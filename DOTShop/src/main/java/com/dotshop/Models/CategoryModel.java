package com.dotshop.Models;

public class CategoryModel extends AbstractModel {
	private String Title;
	private String Slug;
	private String Image;
	private int ParentID;
	private int DisplayOrder;
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

	public int getParentID() {
		return ParentID;
	}

	public void setParentID(int parentID) {
		ParentID = parentID;
	}

	public int getDisplayOrder() {
		return DisplayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
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
