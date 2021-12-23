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


	@Override
	public int updateAccount(String phone, String name, String gender, String address, String email, String type,
			String status,int id) {
		return accountDAL.updateAccount(phone, name, gender, address, email, type, status,id);
	}


	@Override
	public AccountModel findByID(int id) {
		
		return accountDAL.findByID(id);
	}


	@Override
	public int updatePasswordto1(String password, int id) {
		return accountDAL.updatePasswordto1(password,id);
	}


	@Override
	public Boolean checkPhoneExisted(String phone) {
		return accountDAL.checkPhoneExisted(phone) != null;
	}


	@Override
	public int CountAccount() {
		return accountDAL.CountAccount();
	}


	@Override
	public int countAdminAccount() {
		return accountDAL.countAdminAccount();
	}


	@Override
	public int countGuestAccount() {
		return accountDAL.countGuestAccount();
	}


	@Override
	public Boolean signIn(String phone, String password) {
		return accountDAL.signIn(phone, password) != null;
	}


	@Override
	public AccountModel getInfosignIn(String phone, String password) {
		return accountDAL.signIn(phone, password);
	}


	
	

	
}
