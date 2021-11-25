package com.manage.DAL.Implement;

import java.sql.Date;
import java.util.List;

import com.manage.DAL.ICategoryDAL;
import com.manage.Mapper.CategoryMapper;
import com.manage.Models.CategoryModel;

public class CategoryDAL extends AbstractDAL implements ICategoryDAL{
	
	@Override
	public List<CategoryModel> getCategory() {
		String query ="SELECT * FROM category";
		return ExecuteQuery(query, new CategoryMapper());
	}
	@Override
	public int insertCategory( String title,String slug,String image, String parentID, String displayorder,String banner,String status,String createdat,String createdby,String updatedat,String updatedby) {
		String query = "INSERT INTO category( Title, Slug, Image, ParentID, DisplayOrder, Banner, Status, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return ExecuteInsert(query, title, slug, image, parentID, displayorder, banner, status, createdat, createdby, updatedat, updatedby);
	}

	@Override
	public int removeCategory(int id) {
		String query = "DELETE FROM category WHERE ID = ?";
		return ExecuteUpdate(query,id);
	}
}
