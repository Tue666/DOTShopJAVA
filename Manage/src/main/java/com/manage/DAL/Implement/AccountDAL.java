package com.manage.DAL.Implement;


import java.util.List;

import com.manage.DAL.IAccountDAL;
import com.manage.Mapper.AccountMapper;
import com.manage.Models.AccountModel;

public class AccountDAL extends AbstractDAL implements IAccountDAL {
	
	@Override
	public List<AccountModel> getAccount() {
		String query ="SELECT * FROM account";
		return ExecuteQuery(query, new AccountMapper());
	}
	@Override
	public int insertAccount(String phone,String pass,String name, String gender, String address,String email,String type,String status) {
		String query = "INSERT INTO account(phone, password, name, gender, address, email,typeaccount,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		return ExecuteInsert(query, phone, pass, name, gender, address,email,type,status);
	}

	@Override
	public int removeAccount(int id) {
		String query = "DELETE FROM account WHERE id_account = ?";
		return ExecuteUpdate(query,id);
	}
}
