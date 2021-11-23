package com.manage.DAL;

import java.sql.Date;

public interface IAccountDAL {
	
	int insertAccount(int id,String user,String pass,String name, String gender, String address,String phone,String email,Date createat);
	
	int removeAccount (int id);
}
