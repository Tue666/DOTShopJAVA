package com.manage.Service;

import java.sql.Date;
import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountService {
	
	List<AccountModel> getAccount();
	
	String insertAccount(int id,String user,String pass,String name, String gender, String address,String phone,String email,Date createat);
	
	String removeAccount (int id);
}
