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
 * Servlet implementation class DeleteFuelStockServlet
 */
@WebServlet("/DeleteFuelStockServlet")
public class DeleteFuelStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(DeleteFuelStockServlet.class.getName());
	
	private Services sv;

	public DeleteFuelStockServlet() {
		super();
		sv = new Services();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//Get ID
		int id = Integer.parseInt(request.getParameter("id"));

		try {

			// Run delete
			if (sv.deleteFuelStock(id)) {
				request.setAttribute("deleted", "true");
			}

			else {
				request.setAttribute("deleted", "false");
				System.out.println("Error deleting data!");
			}

			RequestDispatcher rd = request.getRequestDispatcher("GetFuelStockServlet");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}
	}

}
