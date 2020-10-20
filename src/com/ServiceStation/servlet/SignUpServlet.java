package com.ServiceStation.servlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ServiceStation.service.UserServices;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(SignUpServlet.class.getName());
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */

	private static UserServices usv;

	public SignUpServlet() {
		super();

		usv = UserServices.getInstance();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException  {

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");

		try {

			if (usv.SignUp(fname, lname, phone, email, password)) {

				request.setAttribute("signupsuccess", "true");

			} else {
				request.setAttribute("signupsuccess", "false");
			}

			RequestDispatcher dis = request.getRequestDispatcher("SignUp.jsp");
			dis.forward(request, response);
			
		} 
		 catch (Exception e) {

			System.out.println("Error sign up");
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

	}

}
