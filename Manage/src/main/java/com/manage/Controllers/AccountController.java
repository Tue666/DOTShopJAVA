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

@WebServlet(value = "/account/*")
public class AccountController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private IAccountService accountService;
	
	public AccountController() {
		accountService = new AccountService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect(request.getContextPath() + "/signIn");
		}
		else {
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
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = request.getPathInfo();
		String password = request.getParameter("Password");
		String name = request.getParameter("Name");
		String gender = request.getParameter("Gender");
		String address = request.getParameter("Address");
		String email = request.getParameter("Email");
		String type = request.getParameter("typeaccount");
		String status = request.getParameter("status");
		
		if (path != null) {
			String action = path.substring(1).split("/")[0];
			String id = path.substring(1).split("/")[1];
			int idaccount = Integer.parseInt(id);	
			
			switch (action) {
			case "edit":
	
				String resetpassword = request.getParameter("ResetPassword");
				accountService.updatePassword(resetpassword, idaccount);
				accountService.updateAccount(name, gender, address, email, type, status, idaccount);
				response.sendRedirect(request.getContextPath() + "/account");
				break;
			case "remove":
				
				accountService.removeAccount(idaccount);
				response.sendRedirect(request.getContextPath() + "/account");
				break;
			default:
				break;
			}
		}
		else {
			String phone = request.getParameter("Phone");
			boolean isExisted = accountService.checkPhoneExisted(phone);
			if(isExisted) {
				request.setAttribute("mess", "Phone is Existed !!!");
				request.setAttribute("accounts", accountService.getAccount());
				RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
				rd.forward(request, response);
			}
			else {
				accountService.insertAccount(phone, password, name, gender, address, email,type,status);
				
				RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
				rd.forward(request, response);
			}
		}
	}
}
