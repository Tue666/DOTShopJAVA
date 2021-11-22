package com.dotshop.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dotshop.Models.CategoryModel;

public class CategoryMapper implements IMapper<CategoryModel> {
	@Override
	public CategoryModel mapRow(ResultSet rs) {
		CategoryModel category = new CategoryModel();
		try {
			category.setID(rs.getInt("ID"));
			category.setTitle(rs.getString("Title"));
			category.setSlug(rs.getString("Slug"));
			category.setImage(rs.getString("Image"));
			category.setParentID(rs.getInt("ParentID"));
			category.setDisplayOrder(rs.getInt("DisplayOrder"));
			category.setBanner(rs.getString("Banner"));
			category.setStatus(rs.getString("Status"));
			category.setCreatedAt(rs.getDate("CreatedAt"));
			category.setCreatedBy(rs.getString("CreatedBy"));
			category.setUpdatedAt(rs.getDate("UpdatedAt"));
			category.setUpdatedBy(rs.getString("UpdatedBy"));
			return category;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
