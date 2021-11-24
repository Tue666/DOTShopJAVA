package com.manage.Models;

import java.sql.Date;

public class CategoryModel {
	private int ID;
	private String Title;
	private String Slug;
	private String Image;
	private int ParentID;
	private String DisplayOrder;
	private String Banner;
	private String Status;
	private Date CreatedAt;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
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
	public Date getCreatedAt() {
		return CreatedAt;
	}
	public void setCreatedAt(Date createdAt) {
		CreatedAt = createdAt;
	}

	

}
