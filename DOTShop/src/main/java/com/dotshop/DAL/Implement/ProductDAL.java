package com.dotshop.DAL.Implement;

import java.util.List;

import com.dotshop.DAL.IProductDAL;
import com.dotshop.Mapper.ProductMapper;
import com.dotshop.Models.ProductModel;

public class ProductDAL extends AbstractDAL implements IProductDAL {
	@Override
	public int totalRecords() {
		String query = "SELECT COUNT(DISTINCT Name) FROM product WHERE Status = ?";
		return ExecuteSelected(query, "active");
	}

	@Override
	public List<ProductModel> findSection(String type, int limit, int productID) {
		String query = "";
		// productID == 0 && type include one of [Viewd, Searched, Sold] for top ranking products
		if (productID == 0) {
			query = "SELECT * FROM product WHERE Status = ? ORDER BY " + type + " DESC LIMIT ?";
		}
		// productID != 0 && type include one of [Similar] will match similar products
		else if (productID != 0) {
			query = "SELECT * FROM product WHERE ID != " + productID +" AND Status = ? AND ID IN (SELECT ProductID AS ID FROM category_product WHERE CategoryID IN (SELECT CategoryID FROM category_product WHERE ProductID = " + productID  +") GROUP BY ProductID) LIMIT ?";
		}
		return ExecuteQuery(query, new ProductMapper(), "active", limit);
	}

	@Override
	public List<ProductModel> findAllWithPagination(int page, int take) {
		String query = "SELECT * FROM product WHERE Status = ? ORDER BY CreatedAt DESC LIMIT ? OFFSET ?";
		return ExecuteQuery(query, new ProductMapper(), "active", take, (page - 1) * take);
	}
	
	@Override
	public ProductModel findByID(int productID) {
		String query = "SELECT * FROM product WHERE ID = ? AND Status = ? LIMIT 1";
		return ExecuteOne(query, new ProductMapper(), productID, "active");
	}

	@Override
	public ProductModel findBySlug(String slug) {
		String query = "SELECT * FROM product WHERE Slug = ? AND Status = ? LIMIT 1";
		return ExecuteOne(query, new ProductMapper(), slug, "active");
	}
}
