package com.dotshop.DAL;

import java.util.List;

import com.dotshop.Models.ProductModel;

public interface IProductDAL {
	int totalRecords();

	List<ProductModel> findSection(String type, int limit, int productID);

	List<ProductModel> findAllWithPagination(int page, int take);
	
	ProductModel findByID(int productID);
	
	ProductModel findBySlug(String slug);
	
	int updateQuantityByAmount(int productID, int amount, String type);
}
