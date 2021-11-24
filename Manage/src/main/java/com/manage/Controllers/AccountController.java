package com.manage.Controllers;

import java.io.IOException;

import com.manage.Service.IAccountService;
import com.manage.Service.Implement.AccountService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/account")
public class AccountController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private IAccountService accountService;
	
	public AccountController() {
		accountService = new AccountService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("accounts", accountService.getAccount());
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
		rd.forward(request, response);
	}
	
}
