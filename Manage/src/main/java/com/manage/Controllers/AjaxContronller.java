package com.manage.Controllers;


import java.io.IOException;

import com.manage.Service.IAccountService;
import com.manage.Service.Implement.AccountService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/ajax")
public class AjaxContronller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAccountService accountService;

	public AjaxContronller() {
		accountService = new AccountService();
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action) {
		case "Check_Phone":{
				String phone = request.getParameter("myphone");
				response.getWriter().write(accountService.checkPhoneExisted(phone) ? "OK" : "NO");
			}	
		}
	}
}
