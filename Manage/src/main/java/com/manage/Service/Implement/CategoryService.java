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
	public String insertCategory(int id,String title,String slug,String image, int parentID, String displayorder,String banner,String status,Date createdat) {
		JSONObject res = new JSONObject();
		String message = "Insert category failed because something went wrong!";
		res.put("message",message);
		return res.toJSONString();
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
