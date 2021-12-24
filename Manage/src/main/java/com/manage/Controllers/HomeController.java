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

@WebServlet(value = "/landing")

public class HomeController extends HttpServlet {

	private static final long serialVersionUID = -7503673196303764780L;
	private IAccountService accountService;
	
	public HomeController() {
		accountService = new AccountService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect(request.getContextPath() + "/signIn");
		}
		else {
			request.setAttribute("countAccounts",accountService.CountAccount());
			request.setAttribute("countAdminAccounts",accountService.countAdminAccount());
			request.setAttribute("countGuestAccounts",accountService.countGuestAccount());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Home.jsp");
			rd.forward(request, response);
		}
		
	}
}