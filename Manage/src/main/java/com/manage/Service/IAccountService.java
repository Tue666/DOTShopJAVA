package com.manage.Service;

import java.sql.Date;

public interface IAccountService {
	
	String insertAccount(int id,String user,String pass,String name, String gender, String address,String phone,String email,Date createat);
	
	String removeAccount (int id);
}
