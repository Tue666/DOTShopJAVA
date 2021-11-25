package com.manage.DAL.Implement;

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
	public int updateCategory(String title,String slug,String image, String parentID, String displayorder,String banner,String status,String createdat,String createdby,String updatedat,String updatedby, int ID) {
		String query = "UPDATE category SET title = ?, slug = ?, image = ?, parentID = ?, displayorder = ?, banner = ?, status = ?, createdat = ?, createdby = ?, updatedat = ?, updatedby = ?  WHERE ID = ? ";
		return ExecuteUpdate(query,title, slug, image, parentID, displayorder, banner, status, createdat, createdby, updatedat, updatedby, ID);
	}
	
	@Override
	public CategoryModel findByID(int ID) {
		String query = "SELECT * FROM category WHERE ID = ? " ;
		return ExecuteOne(query, new CategoryMapper(), ID);
	}
	
	@Override
	public int removeCategory(int ID) {
		String query = "DELETE FROM category WHERE ID = ?";
		return ExecuteUpdate(query,ID);
	}
}
