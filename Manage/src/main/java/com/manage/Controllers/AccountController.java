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

@WebServlet(value = "/account/*")
public class AccountController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private IAccountService accountService;
	
	public AccountController() {
		accountService = new AccountService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path == null) {
			request.setAttribute("accounts", accountService.getAccount());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
			rd.forward(request, response);
		}
		else if (path.contains("edit")) {
			String id = path.substring(1).split("/")[1];
			request.setAttribute("account",accountService.findByID(Integer.parseInt(id)));
			RequestDispatcher rd = request.getRequestDispatcher("/pages/EditAccount.jsp");
			rd.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path != null) {
			String action = path.substring(1).split("/")[0];
			String id = path.substring(1).split("/")[1];
			int idaccount = Integer.parseInt(id);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
			switch (action) {
			case "edit":
				
				String phone = request.getParameter("Phone");
				String name = request.getParameter("Name");
				String gender = request.getParameter("Gender");
				String address = request.getParameter("Address");
				String email = request.getParameter("Email");
				String type = request.getParameter("typeaccount");
				String status = request.getParameter("status");
				
				String password = request.getParameter("ResetPassword");
				accountService.updatePasswordto1(password, idaccount);
				accountService.updateAccount(phone, name, gender, address, email, type, status, idaccount);
				request.setAttribute("accounts", accountService.getAccount());
				rd.forward(request, response);
				break;
			case "remove":
				accountService.removeAccount(idaccount);
				request.setAttribute("accounts", accountService.getAccount());
				rd.forward(request, response);
				break;
			default:
				break;
			}
		}
		else {
			String phone = request.getParameter("Phone");
			String password = request.getParameter("Password");
			String name = request.getParameter("Name");
			String gender = request.getParameter("Gender");
			String address = request.getParameter("Address");
			String email = request.getParameter("Email");
			String type = request.getParameter("typeaccount");
			String status = request.getParameter("status");
			
			accountService.insertAccount(phone, password, name, gender, address, email,type,status);
			request.setAttribute("accounts", accountService.getAccount());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
			rd.forward(request, response);
		}
	}
}
