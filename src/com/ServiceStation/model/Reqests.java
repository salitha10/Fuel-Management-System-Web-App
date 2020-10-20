package com.ServiceStation.model;

import java.sql.Date;
import java.sql.Time;

public class Reqests {
	
	int id;
	Date date;
	Time time;
	String branch;
	String fType;
	float amount;
	String status;
	
	public Reqests(int id, Date date, Time time, String branch, String fType, float amount, String status) {

		this.id = id;
		this.date = date;
		this.time = time;
		this.branch = branch;
		this.fType = fType;
		this.amount = amount;
		this.status = status;
	}


	public int getId() {
		return id;
	}


	public Date getDate() {
		return date;
	}


	public Time getTime() {
		return time;
	}


	public String getBranch() {
		return branch;
	}


	public String getfType() {
		return fType;
	}


	public float getAmount() {
		return amount;
	}


	public String getStatus() {
		return status;
	}

	public void print() {
		System.out.println(fType+" "+amount+" "+status);
	}
}
