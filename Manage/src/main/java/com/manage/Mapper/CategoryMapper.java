package com.manage.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manage.Models.CategoryModel;

public class CategoryMapper implements IMapper<CategoryModel> {
	@Override
	public CategoryModel mapRow(ResultSet rs) {
		CategoryModel categoryModel = new CategoryModel();
		try {
			categoryModel.setID(rs.getInt("ID"));
			categoryModel.setTitle(rs.getString("Title"));
			categoryModel.setSlug(rs.getString("Slug"));
			categoryModel.setImage(rs.getString("Image"));
			categoryModel.setParentID(rs.getString("ParentID"));
			categoryModel.setDisplayOrder(rs.getString("DisplayOrder"));
			categoryModel.setBanner(rs.getString("Banner"));
			categoryModel.setStatus(rs.getString("Status"));
			categoryModel.setCreatedAt(rs.getDate("CreatedAt"));
			categoryModel.setCreatedBy(rs.getString("CreatedBy"));
			categoryModel.setUpdatedAt(rs.getDate("UpdatedAt"));
			categoryModel.setUpdatedBy(rs.getString("UpdatedBy"));
			return categoryModel;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
