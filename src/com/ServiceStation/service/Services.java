package com.ServiceStation.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ServiceStation.model.FuelStock;
import com.ServiceStation.model.Orders;
import com.ServiceStation.model.Reqests;
import com.ServiceStation.util.DBConnection;
import com.ServiceStation.util.Queries;

public class Services implements ServiceDAO {

	public static final Logger logger = Logger.getLogger(Services.class.getName());

	/**
	 * Service Implementation
	 */

	protected static java.sql.Connection con = null;
	private static ResultSet rs = null;
	protected static boolean isSuccess;
	protected static PreparedStatement ps = null;

	// Varibles;
	LocalDate dt;
	LocalTime tm;
	float mx;
	float cnt;
	int id;
	Date date;
	Time time;
	String type;
	float max;
	float current;
	String petrol;
	String diesel;
	String kerosine;
	String branch;
	String fType;
	float amount;
	String status;

	// Get Fuel Stock details
	public List<FuelStock> getFuelStock() {

		ArrayList<FuelStock> fuelstockdetails = new ArrayList<>();

		try {

			// Open connection and execute query
			con = DBConnection.getConnection();
			ps = con.prepareStatement(Queries.GET_FUELSTOCK);
			rs = ps.executeQuery();

			// Get data
			while (rs.next()) {

				id = rs.getInt(1);
				date = rs.getDate(2);
				time = rs.getTime(3);
				type = rs.getString(4);
				max = rs.getFloat(5);
				current = rs.getFloat(6);

				FuelStock fs = new FuelStock(id, date, time, type, max, current);
				fuelstockdetails.add(fs);
			}
		} catch (Exception e) {
			System.out.println("Error getting data");
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);

		return fuelstockdetails;

	}

	// Update Fuel Stock records
	public boolean updateFuelStock(String id, String date, String time, String type, String max, String current) {

		// Convert to sql data
		dt = LocalDate.parse(date);
		tm = LocalTime.parse(time);
		mx = Float.parseFloat(max);
		cnt = Float.parseFloat(current);

		try {
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.UPDATE_FSTOCK);

			// Set data in prepared-statement

			java.sql.Date r_date = java.sql.Date.valueOf(dt);
			ps.setDate(1, r_date);

			java.sql.Time r_time = java.sql.Time.valueOf(tm);
			ps.setTime(2, r_time);

			ps.setString(3, type);

			ps.setFloat(4, mx);
			ps.setFloat(5, cnt);
			ps.setInt(6, Integer.parseInt(id));

			int rs = ps.executeUpdate();

			if (rs > 0) {
				isSuccess = true;

			} else {
				isSuccess = false;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);

		return isSuccess;

	}

	// Delete fuel stock
	public boolean deleteFuelStock(int ID) {
		try {

			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.DELETE_FSTOCK);
			ps.setInt(1, ID);

			int rs = ps.executeUpdate();

			if (rs > 0) {
				System.out.println("Delete success");
				isSuccess = true;
			} else {
				System.out.println("Delete failed");
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);

		return isSuccess;
	}

	// Insert into fuel stock
	public boolean insertFuelStock(String date, String time, String type, String max, String current) {

		// Convert to sql data
		dt = LocalDate.parse(date);
		tm = LocalTime.parse(time);
		mx = Float.parseFloat(max);
		cnt = Float.parseFloat(current);

		try {
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.INSERT_FSTOCK);

			// Set data in prepared-statement

			java.sql.Date r_date = java.sql.Date.valueOf(dt);
			ps.setDate(1, r_date);

			java.sql.Time r_time = java.sql.Time.valueOf(tm);
			ps.setTime(2, r_time);

			ps.setString(3, type);

			ps.setFloat(4, mx);
			ps.setFloat(5, cnt);

			int rs = ps.executeUpdate();

			if (rs > 0) {
				isSuccess = true;

			} else {
				isSuccess = false;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);
		return isSuccess;

	}

	/**
	 * 
	 * Order functions
	 * 
	 * 
	 */

	public List<Orders> getOrderDetails() {

		ArrayList<Orders> orderList = new ArrayList<>();

		try {

			// Open connection and execute query
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.GET_ORDER);
			rs = ps.executeQuery();

			// Get data
			while (rs.next()) {

				id = rs.getInt(1);
				date = rs.getDate(2);
				petrol = rs.getString(3);
				diesel = rs.getString(4);
				kerosine = rs.getString(5);

				Orders od = new Orders(id, date, petrol, diesel, kerosine);
				od.print();
				orderList.add(od);
			}

		} catch (Exception e) {
			System.out.println("Error getting data");
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);

		return orderList;
	}

	// Insert data into order table
	public boolean insertOrderDetails(String petrol, String diesel, String kerosine) {

		try {
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.INSERT_ORDER);

			// Set data in prepared-statement

			ps.setFloat(1, Float.parseFloat(petrol));
			ps.setFloat(2, Float.parseFloat(diesel));
			ps.setFloat(3, Float.parseFloat(kerosine));

			int rs = ps.executeUpdate();

			if (rs > 0) {
				isSuccess = true;

			} else {
				isSuccess = false;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);
		return isSuccess;

	}

	// Delete Order
	public boolean deleteOrder(int ID) {

		try {

			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.DELETE_ORDER);
			ps.setInt(1, ID);

			int rs = ps.executeUpdate();

			if (rs > 0) {
				System.out.println("Delete success");
				isSuccess = true;
			} else {
				System.out.println("Delete failed");
				isSuccess = false;
			}

		} catch (Exception e) {
			System.out.println("Error Deleting data");
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);
		return isSuccess;

	}

	/**
	 * 
	 * Restock requests table
	 * 
	 */

	// Get details from requests table
	public List<Reqests> getRequestDetails() {

		ArrayList<Reqests> requestList = new ArrayList<>();

		try {

			// Open connection and execute query
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.GET_RESTOCKREQESTS);
			rs = ps.executeQuery();

			// Get data
			while (rs.next()) {

				id = rs.getInt(1);
				date = rs.getDate(2);
				time = rs.getTime(3);
				branch = rs.getString(4);
				fType = rs.getString(5);
				amount = rs.getFloat(6);
				status = rs.getString(7);

				Reqests rq = new Reqests(id, date, time, branch, fType, amount, status);
				requestList.add(rq);
			}

		} catch (Exception e) {
			System.out.println("Error getting data");
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);

		return requestList;
	}

	// Approve request
	public boolean approveRequest(String id) {
		try {
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.APPROVE_REQUEST);

			// Set data in prepared-statement
			ps.setInt(1, Integer.parseInt(id));

			int rs = ps.executeUpdate();

			if (rs > 0) {
				isSuccess = true;

			} else {
				isSuccess = false;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);
		return isSuccess;

	}

	// Search requests
	public List<Reqests> searchRequests(String term) {

		ArrayList<Reqests> resultList = new ArrayList<>();

		try {

			// Open connection and execute query
			con = DBConnection.getConnection();

			ps = con.prepareStatement(Queries.SEARCH_REQESTS);
			ps.setString(1, "%" + term.toLowerCase() + "%");

			rs = ps.executeQuery();

			// Get data
			while (rs.next()) {

				int id = rs.getInt(1);
				Date date = rs.getDate(2);
				time = rs.getTime(3);
				branch = rs.getString(4);
				fType = rs.getString(5);
				amount = rs.getFloat(6);
				status = rs.getString(7);

				Reqests rq = new Reqests(id, date, time, branch, fType, amount, status);
				rq.print();
				resultList.add(rq);
			}

		} catch (Exception e) {
			System.out.println("Error getting data");
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}

		// Closing connection
		DBConnection.closeConnection(ps, con);

		return resultList;
	}

}
