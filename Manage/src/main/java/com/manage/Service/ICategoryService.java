package com.manage.Service;

import java.util.List;

import com.manage.Models.CategoryModel;

public interface ICategoryService {
	
	List<CategoryModel> getCategory();
	
	int insertCategory (String title,String slug,String image, String parentID, String displayorder, String banner,String status,String createdat,String createdby,String updatedat,String updatedby);
	
	int updateCategory(String title,String slug,String image, String parentID, String displayorder, String banner,String status,String createdat,String createdby,String updatedat,String updatedby, int ID);
	
	CategoryModel findByID(int ID);
	
	int removeCategory(int ID);
}
