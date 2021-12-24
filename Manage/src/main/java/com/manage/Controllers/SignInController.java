package com.manage.Controllers;

import java.io.IOException;

import com.manage.Models.AccountModel;
import com.manage.Service.IAccountService;
import com.manage.Service.Implement.AccountService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value= "/signIn")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IAccountService accountService;
	
	public SignInController() {
		accountService = new AccountService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rdlogin = request.getRequestDispatcher("/pages/Login.jsp");
		rdlogin.forward(request, response);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		AccountModel acc = accountService.getInfosignIn(phone);
		boolean signIn = accountService.signIn(phone, password);
		if(signIn) {
			String status = acc.getStatus();
			String role = acc.getType();
			if(role.equals("Admin") && status.equals("Active")) {
				HttpSession session = request.getSession();
				session.setAttribute("id",acc.getID());
				session.setAttribute("phone",acc.getPhone());
				request.setAttribute("accounts", accountService.getAccount());
				request.setAttribute("countAccounts",accountService.CountAccount());
				request.setAttribute("countAdminAccounts",accountService.countAdminAccount());
				request.setAttribute("countGuestAccounts",accountService.countGuestAccount());
				response.sendRedirect(request.getContextPath() + "/landing");
			}
			if(role.equals("Guest")){
				request.setAttribute("warning", "Your account can't sign in in this page");
				RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
				rdhome.forward(request, response);
			}	 
			if(status.equals("Block")) {
					request.setAttribute("warning", "Your account is Blocked");
					RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
					rdhome.forward(request, response);
			}
		}else {
			request.setAttribute("mess", "Wrong username or password");
			RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
			rdhome.forward(request, response);
		}
	}
}
