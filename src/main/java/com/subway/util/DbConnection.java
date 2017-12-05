package com.subway.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
public class DbConnection {

    static Connection con;
  
    public static Connection getConnection() throws SQLException
    {
    	
        if (con == null)
        	   try
        {
       
  
        String PROPERTIES_FILE = "Jdbc.properties";
        InputStream inputStream = Thread.currentThread().getContextClassLoader()
                   .getResourceAsStream(PROPERTIES_FILE);
        Properties props = new Properties();

        props.load(inputStream);

        	String driver = props.getProperty("MYSQLJDBC.driver");
        	if (driver != null) {
        	    Class.forName(driver) ;
        	}

        	String url = props.getProperty("MYSQLJDBC.url");
        String username = props.getProperty("MYSQLJDBC.username");
        String password = props.getProperty("MYSQLJDBC.password");
        con = DriverManager.getConnection(url, username, password);
            //Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            System.err.println(e.getMessage());
        } catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return con;
    }
   
}