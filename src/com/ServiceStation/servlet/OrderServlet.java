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

import com.ServiceStation.service.Services;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(OrderServlet.class.getName());

	private Services sv;

	public OrderServlet() {
		super();
		sv = new Services();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String petrol = request.getParameter("petrol");
		String diesel = request.getParameter("diesel");
		String kerosine = request.getParameter("kerosine");

		try {

			if (sv.insertOrderDetails(petrol, diesel, kerosine)) {
					request.setAttribute("ordersuccess", "true");
				// Go to next page
				System.out.println("Update success");

			}

			else {
				request.setAttribute("ordersuccess", "false");
				System.out.println("Update fail");
			}

			RequestDispatcher dis = request.getRequestDispatcher("GetOrdersServlet");
			dis.forward(request, response);

		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}
	}

}
