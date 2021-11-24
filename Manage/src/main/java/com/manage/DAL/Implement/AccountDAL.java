package com.manage.DAL.Implement;

import java.sql.Date;
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
	public int insertAccount(int id,String user,String pass,String name, String gender, String address,String phone,String email,Date createat) {
		String query = "INSERT INTO account(id_account, username, password, name, gender, address, phone, email, createat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return ExecuteInsert(query, id, user, pass, name, gender, address, phone, email, createat);
	}

	@Override
	public int removeAccount(int id) {
		String query = "DELETE FROM account WHERE id_account = ?";
		return ExecuteUpdate(query,id);
	}
}
