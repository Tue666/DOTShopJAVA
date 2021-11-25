package com.manage.Service;

import java.sql.Date;
import java.util.List;

import com.manage.Models.CategoryModel;

public interface ICategoryService {
	
	List<CategoryModel> getCategory();
	
	int insertCategory (String title,String slug,String image, String parentID, String displayorder,
			String banner,String status,String createdat,String createdby,String updatedat,String updatedby);
	
	String removeCategory(int id);
}
