package com.dotshop.Service.Implement;

import java.util.List;

import com.dotshop.DAL.IProductDAL;
import com.dotshop.DAL.Implement.ProductDAL;
import com.dotshop.Models.ProductModel;
import com.dotshop.Service.IProductSevice;

public class ProductService implements IProductSevice {
	private IProductDAL productDAL;
	
	public ProductService() {
		productDAL = new ProductDAL();
	}
	
	@Override
	public int totalRecords() {
		return productDAL.totalRecords();
	}
	
	@Override
	public List<ProductModel> findSection(String type, int limit, int productID) {
		return productDAL.findSection(type, limit, productID);
	}

	@Override
	public List<ProductModel> findAllWithPagination(int page, int take) {
		return productDAL.findAllWithPagination(page, take);
	}
	
	@Override
	public ProductModel findByID(int productID) {
		return productDAL.findByID(productID);
	}

	@Override
	public ProductModel findBySlug(String slug) {
		return productDAL.findBySlug(slug);
	}
}
