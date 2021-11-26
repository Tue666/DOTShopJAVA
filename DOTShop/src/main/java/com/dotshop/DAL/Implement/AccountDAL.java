package com.dotshop.DAL.Implement;

import com.dotshop.DAL.IAccountDAL;
import com.dotshop.Mapper.AccountMapper;
import com.dotshop.Models.AccountModel;

public class AccountDAL extends AbstractDAL implements IAccountDAL {

	@Override
	public AccountModel findById(int accountId) {
		
		String query = "SELECT * FROM account WHERE id_account = " + accountId;
		
		return ExecuteOne(query, new AccountMapper());
	}

	@Override
	public int updateAccount(int accountId, String name, String phone, String gender, String address, String email) {

		String query = "UPDATE account SET name = ?, phone = ?, gender = ?, address = ?, email = ? WHERE id_account = ? ";
		return ExecuteUpdate(query,name, phone, gender, address, email, accountId);

	}
}
