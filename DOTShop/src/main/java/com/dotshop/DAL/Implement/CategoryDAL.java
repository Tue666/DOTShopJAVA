package com.dotshop.DAL.Implement;

import java.util.List;

import com.dotshop.DAL.ICategoryDAL;
import com.dotshop.Mapper.CategoryMapper;
import com.dotshop.Models.CategoryModel;

public class CategoryDAL extends AbstractDAL implements ICategoryDAL {
	@Override
	public List<CategoryModel> findAll() {
		String query = "SELECT * FROM category WHERE Status = ?";
		return ExecuteQuery(query, new CategoryMapper(), "active");
	}
}
