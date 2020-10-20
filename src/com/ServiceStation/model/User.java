package com.ServiceStation.model;

public class User {

	private int id;
	private String fname;
	private String lname;
	private String phone;
	private String email;
	
	public User(int id, String fname, String lname, String phone, String email) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public String getFname() {
		return fname;
	}

	public String getLname() {
		return lname;
	}

	public String getPhone() {
		return phone;
	}
	
	public String getEmail() {
		return email;
	}


}
