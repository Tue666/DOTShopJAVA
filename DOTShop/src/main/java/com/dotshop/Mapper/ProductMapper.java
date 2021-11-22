package com.dotshop.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dotshop.Models.ProductModel;

public class ProductMapper implements IMapper<ProductModel> {
	@Override
	public ProductModel mapRow(ResultSet rs) {
		ProductModel product = new ProductModel();
		try {
			product.setID(rs.getInt("ID"));
			product.setName(rs.getString("Name"));
			product.setSlug(rs.getString("Slug"));
			product.setImage(rs.getString("Image"));
			product.setDescription(rs.getString("Description"));
			product.setPrice(rs.getInt("Price"));
			product.setDiscount(rs.getInt("Discount"));
			product.setQuantity(rs.getInt("Quantity"));
			product.setViewed(rs.getInt("Viewed"));
			product.setSearched(rs.getInt("Searched"));
			product.setSold(rs.getInt("Sold"));
			product.setVATFee(rs.getInt("VATFee"));
			product.set_Limit(rs.getInt("_Limit"));
			product.setTag(rs.getInt("Tag"));
			product.setStatus(rs.getString("Status"));
			product.setCreatedAt(rs.getDate("CreatedAt"));
			product.setCreatedBy(rs.getString("CreatedBy"));
			product.setUpdatedAt(rs.getDate("UpdatedAt"));
			product.setUpdatedBy(rs.getString("UpdatedBy"));
			return product;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
