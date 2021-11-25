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
			accountModel.setPhone(rs.getString("phone"));
			accountModel.setPassword(rs.getString("password"));
			accountModel.setName(rs.getString("name"));
			accountModel.setGender(rs.getString("gender"));
			accountModel.setAddress(rs.getString("address"));
			accountModel.setEmail(rs.getString("email"));
			accountModel.setType(rs.getString("typeaccount"));
			accountModel.setStatus(rs.getString("status"));
			return accountModel;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
