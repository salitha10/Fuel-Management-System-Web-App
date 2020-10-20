package com.ServiceStation.servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ServiceStation.model.Reqests;
import com.ServiceStation.service.Services;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(SearchServlet.class.getName());
	
	private Services sv;
	
	public SearchServlet() {
		super();
		sv = new Services();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String term = request.getParameter("term");

		try {
			List<Reqests> requestdetails = sv.searchRequests(term);

			if (!requestdetails.isEmpty()) {

				// Set details to next page
				request.setAttribute("requestdetails", requestdetails);
				request.setAttribute("term", term);

			}

			RequestDispatcher dis = request.getRequestDispatcher("SearchResults.jsp");
			dis.forward(request, response);

		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

	}

}
