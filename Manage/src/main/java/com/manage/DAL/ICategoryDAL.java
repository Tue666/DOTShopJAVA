package com.manage.DAL;

import java.sql.Date;
import java.util.List;

import com.manage.Models.CategoryModel;

public interface ICategoryDAL {
	
	List<CategoryModel> getCategory();
	
	int insertCategory(int id,String title,String slug,String image, int parentID, String displayorder,String banner,String status,Date createdat);
	
	int removeCategory (int id);
}
