package com.manage.Service;


import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountService {
	
	List<AccountModel> getAccount();
	
	int insertAccount(String phone,String pass,String name, String gender, String address,String email,String type,String status);
	
	int updateAccount(String phone,String name, String gender, String address,String email,String type,String status,int id);
	
	int updatePasswordto1(String password,int id);
	
	AccountModel findByID(int id);
	
	int removeAccount (int id);
}
