package com.dotshop.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dotshop.Models.CartModel;

public class CartMapper implements IMapper<CartModel> {
	@Override
	public CartModel mapRow(ResultSet rs) {
		CartModel cart = new CartModel();
		try {
			cart.setID(rs.getInt("ID"));
			cart.setUserID(rs.getInt("UserID"));
			cart.setProductID(rs.getInt("ProductID"));
			cart.setQuantity(rs.getInt("Quantity"));
			cart.setChecked(rs.getBoolean("Checked"));
			cart.setCreatedAt(rs.getDate("CreatedAt"));
			cart.setCreatedBy(rs.getString("CreatedBy"));
			cart.setUpdatedAt(rs.getDate("UpdatedAt"));
			cart.setUpdatedBy(rs.getString("UpdatedBy"));
			return cart;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
