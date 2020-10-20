package com.ServiceStation.model;

import java.sql.Date;

public class Orders {
	
	private int id;
	private Date dt;
	private String petrol;
	private String diesel;
	private String kerosine;
	
	public Orders(int id, Date dt, String petrol, String diesel, String kerosine) {
		
		this.id = id;
		this.dt = dt;
		this.petrol = petrol;
		this.diesel = diesel;
		this.kerosine = kerosine;
		
	}

	public int getId() {
		return id;
	}

	public Date getDt() {
		return dt;
	}

	public String getPetrol() {
		return petrol;
	}

	public String getDiesel() {
		return diesel;
	}

	public String getKerosine() {
		return kerosine;
	}

	public void print() {
		System.out.println(dt.toString()+" "+ diesel);
	}
}
