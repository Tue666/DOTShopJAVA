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

@WebServlet("/account/*")
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
			int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
			AccountModel account = accountService.findById(accountId);		
			request.setAttribute("account", account);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
			rd.forward(request, response);
		}else if (path.contains("signUp")) {
			response.sendRedirect(request.getContextPath() + "/signIn");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		// Lấy thông tin từ view
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String role = "Guest";
		String status = "Active";
		if (path != null) {
			String action = path.substring(1).split("/")[0];
			switch (action) {	
			case "signUp":
				accountService.signUp(phone, password, role, status,confirmpassword);
				request.setAttribute("success", "Sign Up Success");
				RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
				rdhome.forward(request, response);
				break;
			default:
				break;
			}
		}
		else {
			// Gọi service xử lí 
			int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());;
			accountService.updateAccount(accountId, name, phone, gender, address, email);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
			rd.forward(request, response);
		}
		
	}
}