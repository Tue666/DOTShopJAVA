package com.manage.DAL;

import java.sql.Date;
import java.util.List;

import com.manage.Models.AccountModel;

public interface IAccountDAL {
	
	List<AccountModel> getAccount();
	
	int insertAccount(int id,String user,String pass,String name, String gender, String address,String phone,String email,Date createat);
	
	int removeAccount (int id);
}
