package com.dotshop.DAL;

import com.dotshop.Models.AccountModel;

public interface IAccountDAL {
	
	AccountModel findById(int accountId);
	
	int updateAccount(int accountId, String name, String phone, String gender, String address, String email);
		
}
