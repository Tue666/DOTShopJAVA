package com.manage.Service.Implement;


import java.util.List;

import com.manage.DAL.IAccountDAL;
import com.manage.DAL.Implement.AccountDAL;
import com.manage.Models.AccountModel;

import org.json.simple.JSONObject;

import com.manage.Service.IAccountService;

public class AccountService implements IAccountService  {
	private IAccountDAL accountDAL;
	
	public AccountService() {
		accountDAL = new AccountDAL();
	}


	@Override
	public int insertAccount(String phone, String pass, String name, String gender, String address,String email) {
		
		return accountDAL.insertAccount(phone, pass, name, gender, address, email);
	}

	@Override
	public String removeAccount(int id) {
		JSONObject res = new JSONObject();
		String status = "ERROR";
		String message = "Remove account failed because something went wrong!";
		int removed = accountDAL.removeAccount(id);
		if (removed > 0) {
			status = "SUCCESS";
			message = "The product has been deleted";
		}
		res.put("status", status);
		res.put("message", message);
		res.put("id", id);
		return res.toJSONString();
	}


	@Override
	public List<AccountModel> getAccount() {
		return accountDAL.getAccount();
	}
	
}
