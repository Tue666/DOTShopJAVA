package com.manage.Service.Implement;

import java.util.List;

import com.manage.DAL.ICategoryDAL;
import com.manage.DAL.Implement.CategoryDAL;
import com.manage.Models.CategoryModel;
import com.manage.Service.ICategoryService;

public class CategoryService implements ICategoryService{
	private ICategoryDAL categoryDAL;
	
	public CategoryService() {
		categoryDAL = new CategoryDAL();
	}
	@Override
	public int insertCategory(String title,String slug,String image, String parentID, 
			String displayorder,String banner,String status,String createdat,String createdby,String updatedat,String updatedby) {
		
		return categoryDAL.insertCategory(title, slug, image, parentID, displayorder, banner, status, createdat, createdby, updatedat, updatedby);
	}

	@Override
	public List<CategoryModel> getCategory() {
		return categoryDAL.getCategory();
	}
	
	@Override
	public int updateCategory(String title,String slug,String image, String parentID, 
			String displayorder,String banner,String status,String createdat,String createdby,String updatedat,String updatedby, int ID) {
		return categoryDAL.updateCategory(title, slug, image, parentID, displayorder, banner, status, createdat, createdby, updatedat, updatedby, ID);
	}

	@Override
	public CategoryModel findByID(int ID) {
		
		return categoryDAL.findByID(ID);
	}
	
	@Override
	public int removeCategory(int ID) {
		return categoryDAL.removeCategory(ID);
	}
}
