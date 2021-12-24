package com.manage.DAL;

import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountDAL {
	
	List<AccountModel> getAccount();
	
	int insertAccount(String phone,String pass,String name, String gender, String address,String email,String type,String status);
	
	int updateAccount(String name, String gender, String address,String email,String type,String status,int id);
	
	int updatePassword(String password, int id);
	
	AccountModel checkPhoneExisted(String phone);
	
	AccountModel findByID(int id);
	
	int removeAccount (int id);
	
	int CountAccount();
	
	int countAdminAccount();
	
	int countGuestAccount();
	
	AccountModel signIn(String phone,String password);
	
	AccountModel getInfosignIn(String phone);
	
}
