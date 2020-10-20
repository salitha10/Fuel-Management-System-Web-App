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
 * Servlet implementation class InsertFuelStockServlet
 */
@WebServlet("/InsertFuelStockServlet")
public class InsertFuelStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(InsertFuelStockServlet.class.getName());

	private Services sv;

	public InsertFuelStockServlet() {
		super();
		sv = new Services();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String type = request.getParameter("type");
		String max = request.getParameter("max");
		String current = request.getParameter("current");

		try {

			if (sv.insertFuelStock(date, time, type, max, current)) {

				// Go to next page
				request.setAttribute("fsinsertsuccess", "true");
				System.out.println("Update success");

			}

			else {
				request.setAttribute("fsinsertsuccess", "false");
				System.out.println("Update fail");
			}

			RequestDispatcher dis = request.getRequestDispatcher("GetFuelStockServlet");
			dis.forward(request, response);

		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}
	}

}
