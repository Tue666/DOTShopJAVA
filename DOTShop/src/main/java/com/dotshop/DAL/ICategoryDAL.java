package com.dotshop.DAL;

import java.util.List;

import com.dotshop.Models.CategoryModel;

public interface ICategoryDAL {
	List<CategoryModel> findAll();
}
