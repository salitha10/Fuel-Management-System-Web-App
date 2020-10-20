package com.ServiceStation.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ServiceStation.model.Orders;
import com.ServiceStation.service.Services;


/**
 * Servlet implementation class GetOrdersServlet
 */
@WebServlet("/GetOrdersServlet")
public class GetOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public static final Logger logger = Logger.getLogger(GetOrdersServlet.class.getName());
	
	private Services sv;
	
    public GetOrdersServlet() {
        super();
       
        sv = new Services();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			List <Orders> orderdetails = sv.getOrderDetails();

			if (!orderdetails.isEmpty()) {

				// Set details to next page
				request.setAttribute("ords", orderdetails);
				System.out.println(Arrays.toString(orderdetails.toArray()));
			}
			
			
			RequestDispatcher dis = request.getRequestDispatcher("Order.jsp");
			dis.forward(request, response);

		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

	}

}
