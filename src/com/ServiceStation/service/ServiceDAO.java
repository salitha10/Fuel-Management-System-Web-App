package com.ServiceStation.service;

import java.util.List;

import com.ServiceStation.model.FuelStock;
import com.ServiceStation.model.Reqests;

/**
 * 
 * @author Salitha
 *	
 *	All methods for fuel management
 *
 */
public interface ServiceDAO {

	//Get data from fuel stock table
	public List<FuelStock> getFuelStock();
	
	//Update Fuel Stock records
	public boolean updateFuelStock(String id, String date, String time, String type, String max, String current);
	
	//Delete Fuel stock records
	public boolean deleteFuelStock(int ID);
	
	//Insert into fuel stock records
	public boolean insertFuelStock(String date, String time, String type, String max, String current);
	
	//Insert Into Orders
	public boolean insertOrderDetails(String petrol, String diesel, String kerosine) ;
	
	//Delete order details
	public boolean deleteOrder(int ID);
	
	// Get details from requests table
	public List<Reqests> getRequestDetails();
	
	//Approve request
	public boolean approveRequest(String id);
	
	//Search requests
	public List<Reqests> searchRequests(String term);
	
	
}
