package com.dotshop.Service;

import com.dotshop.Models.AccountModel;

public interface IAccountService {
	
	AccountModel findById(int accountId);
	
	Boolean updateAccount(int accountId, String name, String phone, String gender, String address, String email);
	
}
