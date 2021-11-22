package com.dotshop.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dotshop.Models.CartItem;

public class CartItemMapper implements IMapper<CartItem> {
	@Override
	public CartItem mapRow(ResultSet rs) {
		CartItem cartItem = new CartItem();
		try {
			cartItem.setProductID(rs.getInt("ProductID"));
			cartItem.setProductName(rs.getString("ProductName"));
			cartItem.setProductSlug(rs.getString("ProductSlug"));
			cartItem.setProductImage(rs.getString("ProductImage"));
			cartItem.setProductPrice(rs.getInt("ProductPrice"));
			cartItem.setProductDiscount(rs.getInt("ProductDiscount"));
			cartItem.setVATFee(rs.getInt("VATFee"));
			cartItem.setCartQuantity(rs.getInt("CartQuantity"));
			cartItem.setCartChecked(rs.getBoolean("CartChecked"));
			return cartItem;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
}
