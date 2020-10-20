package com.ServiceStation.model;

import java.sql.Time;
import java.util.Date;

public class FuelStock {

	private int id;
	private Date date;
	private Time time;
	private String type;
	private float max;
	private float current;
	
	public FuelStock(int id, Date date, Time time, String type, float max, float current) {
		
		this.id = id;
		this.date = date;
		this.time = time;
		this.type = type;
		this.max = max;
		this.current = current;
		
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

	public String getType() {
		return type;
	}

	public float getMax() {
		return max;
	}

	public float getCurrent() {
		return current;
	}
	
	public void print() {
		System.out.println(type);
	}
	
}
