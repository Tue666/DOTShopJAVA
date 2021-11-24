package com.manage.Service;


import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountService {
	
	List<AccountModel> getAccount();
	
	int insertAccount(String phone,String pass,String name, String gender, String address,String email);
	
	String removeAccount (int id);
}
