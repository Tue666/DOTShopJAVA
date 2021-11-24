package com.manage.DAL;

import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountDAL {
	
	List<AccountModel> getAccount();
	
	int insertAccount(String phone,String pass,String name, String gender, String address,String email);
	
	int removeAccount (int id);
}
