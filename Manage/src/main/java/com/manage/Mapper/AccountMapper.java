package com.manage.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manage.Models.AccountModel;

public class AccountMapper implements IMapper<AccountModel> {
	@Override
	public AccountModel mapRow(ResultSet rs) {
		AccountModel accountModel = new AccountModel();
		try {
			accountModel.setID(rs.getInt("id_account"));
			accountModel.setUsername(rs.getString("username"));
			accountModel.setPassword(rs.getString("password"));
			accountModel.setName(rs.getString("name"));
			accountModel.setGender(rs.getString("gender"));
			accountModel.setAddress(rs.getString("address"));
			accountModel.setPhone(rs.getString("phone"));
			accountModel.setEmail(rs.getString("email"));
			accountModel.setCreateAt(rs.getDate("createat"));
			return accountModel;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
