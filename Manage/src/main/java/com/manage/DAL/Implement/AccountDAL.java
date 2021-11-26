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
	
	public int updateAccount(String phone,String name, String gender, String address,String email,String type,String status,int id) {
		String query = "UPDATE account SET phone = ?, name = ?, gender = ?, address = ?, email = ?, typeaccount = ?, status = ? WHERE id_account = ? ";
		return ExecuteUpdate(query,phone, name, gender, address,email,type,status,id);
	}

	@Override
	public int removeAccount(int id) {
		String query = "DELETE FROM account WHERE id_account = ?";
		return ExecuteUpdate(query,id);
	}
	@Override
	public AccountModel findByID(int id) {
		String query = "SELECT * FROM account WHERE id_account = ? " ;
		return ExecuteOne(query, new AccountMapper(), id);
	}
	@Override
	public int updatePasswordto1(String password, int id) {
		String query = "Update account Set password = ? WHERE id_account = ? ";
		return ExecuteUpdate(query,password,id);
	}
	@Override
	public AccountModel checkPhoneExisted(String phone) {
		String query = "SELECT * FROM account WHERE phone = ?";
		return ExecuteOne(query,new AccountMapper(),phone);
	}
}
