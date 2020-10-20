package com.ServiceStation.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReadProperties {
/**
 * This method reads properties file
 * @param DB.properties
 * @return
 */
	public static final Logger logger = Logger.getLogger(ReadProperties.class.getName());
	
	// Read properties file and return properties object
	public static Properties readPropertiesFile(String fileName) {

		FileInputStream fis = null;
		Properties prop = null;

		try {
			fis = new FileInputStream(fileName);
			prop = new Properties();
			prop.load(fis);
			
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
			logger.log(Level.SEVERE, fnfe.getMessage());
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
			logger.log(Level.SEVERE, ioe.getMessage());
			
		} finally {
			
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
				logger.log(Level.SEVERE, e.getMessage());
			}
		}
		return prop;
	}
}
