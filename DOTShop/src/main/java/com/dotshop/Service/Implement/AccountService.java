package com.dotshop.Service.Implement;

import com.dotshop.DAL.IAccountDAL;
import com.dotshop.DAL.Implement.AccountDAL;
import com.dotshop.Models.AccountModel;
import com.dotshop.Service.IAccountService;

public class AccountService implements IAccountService {
	private IAccountDAL accountDAL;
	
	public AccountService() {
		accountDAL = new AccountDAL();
	}
	
	@Override
	public AccountModel findById(int accountId) {
		return accountDAL.findById(accountId);
	}

	@Override
	public Boolean updateAccount(int accountId, String name, String phone, String gender, String address, String email) {
		return accountDAL.updateAccount(accountId, name, phone, gender, address, email) > 0;
	}

	
	
}
