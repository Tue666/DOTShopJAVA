package com.manage.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manage.Models.AccountModel;

public class AccountMapper implements IMapper<AccountModel> {
	@Override
	public AccountModel mapRow(ResultSet rs) {
		AccountModel accountModel = new AccountModel();
		try {
			accountModel.setID(rs.getInt("ID"));
			accountModel.setUsername(rs.getString("Username"));
			accountModel.setPassword(rs.getString("Password"));
			accountModel.setName(rs.getString("Name"));
			accountModel.setGender(rs.getString("Gender"));
			accountModel.setAddress(rs.getString("Address"));
			accountModel.setPhone(rs.getString("Phone"));
			accountModel.setEmail(rs.getString("Email"));
			accountModel.setCreateAt(rs.getDate("CreateAt"));
			return accountModel;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
}
