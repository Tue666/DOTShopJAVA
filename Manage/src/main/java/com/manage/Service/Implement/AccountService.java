package com.manage.Service.Implement;


import java.util.List;

import com.manage.DAL.IAccountDAL;
import com.manage.DAL.Implement.AccountDAL;
import com.manage.Models.AccountModel;


import com.manage.Service.IAccountService;

public class AccountService implements IAccountService  {
	private IAccountDAL accountDAL;
	
	public AccountService() {
		accountDAL = new AccountDAL();
	}


	@Override
	public int insertAccount(String phone, String pass, String name, String gender, String address,String email,String type,String status) {
		
		return accountDAL.insertAccount(phone, pass, name, gender, address, email,type,status);
	}

	@Override
	public int removeAccount(int id) {
		return accountDAL.removeAccount(id);
	}


	@Override
	public List<AccountModel> getAccount() {
		return accountDAL.getAccount();
	}
	
}
