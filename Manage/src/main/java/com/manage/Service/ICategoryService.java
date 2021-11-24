package com.manage.Service;

import java.sql.Date;
import java.util.List;

import com.manage.Models.CategoryModel;

public interface ICategoryService {
	
	List<CategoryModel> getCategory();
	
	String insertCategory(int id,String title,String slug,String image, int parentID, String displayorder,String banner,String status,Date createdat);
	
	String removeCategory(int id);
}
