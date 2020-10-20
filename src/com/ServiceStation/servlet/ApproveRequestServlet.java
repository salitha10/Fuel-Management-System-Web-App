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
 * Servlet implementation class ApproveRequestServlet
 */
@WebServlet("/ApproveRequestServlet")
public class ApproveRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final Logger logger = Logger.getLogger(ApproveRequestServlet.class.getName());

	private Services sv;

	public ApproveRequestServlet() {
		super();
		sv = new Services();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		try {

			if (sv.approveRequest(id)) {

				// Go to next page
				request.setAttribute("approvesuccess", "true");
				System.out.println("Update success");

			}

			else {
				request.setAttribute("approvesuccess", "false");
				System.out.println("Update fail");
			}

			RequestDispatcher dis = request.getRequestDispatcher("GetRequestsServlet");
			dis.forward(request, response);
		}

		catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		}

	}

}
