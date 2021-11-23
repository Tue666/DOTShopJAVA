package com.manage.DAL.Implement;

import java.sql.Date;

import com.manage.DAL.IAccountDAL;

public class AccountDAL extends AbstractDAL implements IAccountDAL {
	
	public int insertAccount(int id,String user,String pass,String name, String gender, String address,String phone,String email,Date createat) {
		String query = "INSERT INTO account(id_account, username, password, name, gender, address, phone, email, createat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return ExecuteInsert(query, id, user, pass, name, gender, address, phone, email, createat);
	}

	@Override
	public int removeAccount(int id) {
		// TODO Auto-generated method stub
		return 0;
	}
}
