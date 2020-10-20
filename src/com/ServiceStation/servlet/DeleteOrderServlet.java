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
 * Servlet implementation class DeleteOrderServlet
 */
@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(DeleteOrderServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private Services sv;

	public DeleteOrderServlet() {
		super();
		sv = new Services();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		try {

			// Run Deletion
			if (sv.deleteOrder(id)) {
				request.setAttribute("deletedorder", "true");

			} else {
				request.setAttribute("deletedorder", "false");
			}
			RequestDispatcher rd = request.getRequestDispatcher("GetOrdersServlet");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}
	}

}
