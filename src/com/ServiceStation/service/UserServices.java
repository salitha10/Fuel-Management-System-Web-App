package com.ServiceStation.service;

import com.ServiceStation.util.DBConnection;
import com.ServiceStation.util.Queries;

public class UserServices extends Services implements UserServicesDAO{

	/**
	 * Singleton pattern
	 */
	
	//Object
	private static UserServices instance = new UserServices();
	
	//Private constructor
	private UserServices() {}
	
	//Get instance
	public static UserServices getInstance() {
		return instance;
	}
	
	@Override
	public boolean SignUp(String fname, String lname, String phone, String email, String password) {
		

			try {
				
				con = DBConnection.getConnection();

				ps = con.prepareStatement(Queries.SIGN_UP);

				// Set data in prepared-statement
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, email);
				ps.setString(4, password);
				ps.setString(5, phone);
				
				int rs = ps.executeUpdate();

				if (rs > 0) {
					isSuccess = true;

				} else {
					isSuccess = false;
				}
			}

			catch (Exception e) {
				e.printStackTrace();
			}

			// Closing connection
			DBConnection.closeConnection(ps, con);
			return isSuccess;

		}
	

	@Override
	public void Login(String email, String password) {
		// TODO Auto-generated method stub
		
	}
}
