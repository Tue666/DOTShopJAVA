package com.dotshop.Controllers;

import java.io.IOException;

import com.dotshop.DAL.Implement.AccountDAL;
import com.dotshop.Models.AccountModel;
import com.dotshop.Service.IAccountService;
import com.dotshop.Service.Implement.AccountService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/account")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IAccountService accountService;

	public AccountController() {
		accountService = new AccountService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Giả sử id tài khoản là 10	
		int accountId = 10;
		
		AccountModel account = accountService.findById(accountId);		
		
		request.setAttribute("account", account);

		RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Giả sử id tài khoản cần cập nhật là 10	
		int accountId = 10;
		
		// Lấy thông tin từ view
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
					
		// Gọi service xử lí 
		accountService.updateAccount(accountId, name, phone, gender, address, email);
		
		RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
		rd.forward(request, response);
	}
}
