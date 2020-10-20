package com.ServiceStation.service;

public interface UserServicesDAO {
	
	//Sign up
	public boolean SignUp(String fname, String lname, String phone, String email, String password);
	
	//Login
	public void Login(String email, String password);

}
