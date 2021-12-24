package com.manage.Service;


import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountService {
	
	List<AccountModel> getAccount();
	
	int insertAccount(String phone,String pass,String name, String gender, String address,String email,String type,String status);
	
	int updateAccount(String name, String gender, String address,String email,String type,String status,int id);
	
	int updatePassword(String password,int id);
	
	Boolean checkPhoneExisted(String phone);
	
	AccountModel findByID(int id);
	
	int removeAccount (int id);
	
	int CountAccount();
	
	int countAdminAccount();
	
	int countGuestAccount();
	
	Boolean signIn(String phone,String password);
	
	AccountModel getInfosignIn(String phone);
	

	
}
