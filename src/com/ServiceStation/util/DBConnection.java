package com.ServiceStation.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

	// Logger
	public static final Logger logger = Logger.getLogger(DBConnection.class.getName());

	//Read properties file
	private static Properties prop =  ReadProperties.readPropertiesFile("E:\\Java EE\\ServiceStation\\src\\com\\ServiceStation\\util\\DB.properties");

	// Declaring connection parameters
	private static final String URL = prop.getProperty("url");
	private static final String DRIVER = prop.getProperty("driver");
	private static final String USERNAME = prop.getProperty("userName");
	private static final String PASSWORD = prop.getProperty("password");

	
	private static Connection con;

	// Method to return connection
	public static Connection getConnection() {
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("Database connection Success");
			
		} catch (Exception e) {
			System.out.println("Database connection failed");
			logger.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		}

		return con;
	}

	// Close connection
	public static void closeConnection(PreparedStatement pstmt, Connection conn) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
	}

	public static void main(String [] args) {
	
		DBConnection.getConnection();
	}
}
