package com.dotshop.Service;

import com.dotshop.Models.AccountModel;

public interface IAccountService {
	
	AccountModel findById(int accountId);
	
	Boolean updateAccount(int accountId, String name, String phone, String gender, String address, String email);
	
	Boolean signIn(String phone,String password);
	
	AccountModel getInfosignIn(String phone);
	
	int signUp(String phone, String password, String role, String status);
	
	Boolean checkPhoneExisted(String phone);
}
