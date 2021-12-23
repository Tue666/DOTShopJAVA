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
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		AccountModel acc = accountService.getInfosignIn(phone);
		boolean signIn = accountService.signIn(phone, password);
		String status = (String) acc.getStatus().toString();
		System.out.print(status);

		if(signIn) {
				if(status.equals("Block")) {
					request.setAttribute("warning", "Your account is Blocked");
					RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
					rdhome.forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("id",acc.getID());
					session.setAttribute("phone",acc.getPhone());
					session.setAttribute("role", acc.getType());
					response.sendRedirect(request.getContextPath() + "/landing");
					
				}	
		}else {
			request.setAttribute("mess", "Wrong username or password");
			RequestDispatcher rdhome = request.getRequestDispatcher("/pages/Login.jsp");
			rdhome.forward(request, response);
		}
	}
}
