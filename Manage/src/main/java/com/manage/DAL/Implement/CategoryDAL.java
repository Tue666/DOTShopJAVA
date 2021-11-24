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
	public int insertCategory(int id,String title,String slug,String image, int parentID, String displayorder,String banner,String status,Date createdat) {
		String query = "INSERT INTO category(ID, Title, Slug, Image, ParentID, DisplayOrder, Banner, Status, CreatedAt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return ExecuteInsert(query, id, title, slug, image, parentID, displayorder, banner, status, createdat);
	}

	@Override
	public int removeCategory(int id) {
		String query = "DELETE FROM category WHERE ID = ?";
		return ExecuteUpdate(query,id);
	}
}
