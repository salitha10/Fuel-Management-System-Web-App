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
 * Servlet implementation class UpdateFuelStockServlet
 */
@WebServlet("/UpdateFuelStockServlet")
public class UpdateFuelStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(UpdateFuelStockServlet.class.getName());

	private Services sv;

	public UpdateFuelStockServlet() {
		super();

		sv = new Services();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String type = request.getParameter("type");
		String max = request.getParameter("max");
		String current = request.getParameter("current");

		try {

			if (sv.updateFuelStock(id, date, time, type, max, current)) {

				
				request.setAttribute("fsupdatesuccess", "true");
				System.out.println("Update success");

			}

			else {
				request.setAttribute("fsupdatesuccess", "false");
				System.out.println("Update fail");
			}

			// Go to next page
			RequestDispatcher dis = request.getRequestDispatcher("GetFuelStockServlet");
			dis.forward(request, response);
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}
	}

}
