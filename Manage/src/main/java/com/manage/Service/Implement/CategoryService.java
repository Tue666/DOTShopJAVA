package com.manage.Service.Implement;

import java.sql.Date;
import java.util.List;

import org.json.simple.JSONObject;

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
	public String removeCategory(int id) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		String message = "Remove category failed because something went wrong!";
		int removed = categoryDAL.removeCategory(id);
		if (removed > 0) {
			status = "SUCCESS";
			message = "The category has been deleted";
		}
		res.put("status", status);
		res.put("message", message);
		res.put("id", id);
		return res.toJSONString();
	}


	@Override
	public List<CategoryModel> getCategory() {
		return categoryDAL.getCategory();
	}
	
}
