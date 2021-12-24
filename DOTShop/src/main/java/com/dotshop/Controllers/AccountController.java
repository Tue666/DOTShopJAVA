package com.dotshop.Controllers;

import java.io.IOException;

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
		else if (path.contains("changePassword")) {
			if(request.getSession().getAttribute("id") == null) {
				response.sendRedirect(request.getContextPath() + "/signIn");
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/pages/ChangePassword.jsp");
				rd.forward(request, response);
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		// Lấy thông tin từ view
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		boolean isExisted = accountService.checkPhoneExisted(phone);
		if (path != null) {
			String action = path.substring(1).split("/")[0];
			switch (action) {	
			case "signUp":
				if(isExisted) {
					request.setAttribute("mess", "Phone is Existed");
					RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
					rdhome.forward(request, response);
				}
				else {
					String confirmpassword = request.getParameter("confirmpassword");
					if(password.equals(confirmpassword)) {
						accountService.signUp(phone, password, "Guest", "Active");
						request.setAttribute("success", "Sign Up Success");
						RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
						rdhome.forward(request, response);
					}else {
						request.setAttribute("warning", "Passwords are not the same");
						RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
						rdhome.forward(request, response);
					}
				}
				break;
			case "changePassword":
				String oldpassword = request.getParameter("oldpassword");
				int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
				boolean Checkpassword = accountService.checkOldPassword(oldpassword, accountId);
					if(Checkpassword) {
						String confirmpassword = request.getParameter("confirmpassword");
						if(password.equals(confirmpassword)) {
							accountService.changePassword(password, accountId);
							request.setAttribute("success", "Change Password success");
							RequestDispatcher rdhome = request.getRequestDispatcher("/pages/ChangePassword.jsp");
							rdhome.forward(request, response);
						}else {
							request.setAttribute("mess", "Passwords are not the same");
							RequestDispatcher rdhome = request.getRequestDispatcher("/pages/ChangePassword.jsp");
							rdhome.forward(request, response);
						}
					}else {
						request.setAttribute("mess", "Old password is not correct");
						RequestDispatcher rdhome = request.getRequestDispatcher("/pages/ChangePassword.jsp");
						rdhome.forward(request, response);
					}
					
				break;
			default:
				break;
			}
		}
		else {
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			// Gọi service xử lí 
			int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());;
			accountService.updateAccount(accountId, name, gender, address, email);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/Account.jsp");
			rd.forward(request, response);
		}
		
	}
}