package com.ServiceStation.util;

public class Queries {
	
	/**
	 * 
	 * Fuelstock table
	 * 
	 */
	
	//Get data from fuel stock table
	public static final String GET_FUELSTOCK = "SELECT * FROM fuelstock";
	
	//Update data in fuel stock table
	public static final String UPDATE_FSTOCK = "UPDATE fuelstock SET date=?,time=?,fuelType=?,maxCapacity=?,currentAmount=? WHERE recordID=?";

	//Delete data in fuel stock table
	public static final String DELETE_FSTOCK = "DELETE FROM fuelstock WHERE recordID = ?";
	
	//Insert row into fuel stock table
	public static final String INSERT_FSTOCK = "INSERT INTO fuelstock (date,time,fuelType,maxCapacity,currentAmount) VALUES (?,?,?,?,?)";
	
	/**
	 * 
	 * Order table
	 * 
	 */
	
	//Get all data from orders
	public static final String GET_ORDER = "SELECT * FROM fuelorders";
	
	//Insert row into order table
	public static final String INSERT_ORDER = "INSERT INTO fuelorders (date_time, petrolAmount, dieselAmount, kerosineAmount) VALUES (NOW(),?,?,?) ";
	
	//Delete order
	public static final String DELETE_ORDER = "DELETE FROM fuelorders WHERE recordID = ?";
	
	/**
	 * 
	 * Restock requests table
	 * 
	 */

	//Get all data from request table
	public static final String GET_RESTOCKREQESTS = "SELECT * FROM restockrequests";

	//Update request status
	public static final String APPROVE_REQUEST = "UPDATE restockrequests SET status = 'Approved' WHERE recordID = ? ";

	public static final String SEARCH_REQESTS = "SELECT * FROM restockrequests WHERE LOWER (branch) LIKE  ?";

	
	/**
	 * 
	 * 
	 * User Details
	 * 
	 */
	//Sign Up
	public static final String SIGN_UP = "INSERT INTO userDetails (fname,lname,email,password,phoneNo) VALUES (?,?,?,?,?) ";
	
		
}

	
	