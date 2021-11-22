package com.dotshop.Service.Implement;

import java.util.List;

import com.dotshop.DAL.ICategoryDAL;
import com.dotshop.DAL.Implement.CategoryDAL;
import com.dotshop.Models.CategoryModel;
import com.dotshop.Service.ICategoryService;

public class CategoryService implements ICategoryService {
	private ICategoryDAL categoryDAL;
	
	public CategoryService() {
		categoryDAL = new CategoryDAL();
	}

	@Override
	public List<CategoryModel> findAll() {
		return categoryDAL.findAll();
	}
}
