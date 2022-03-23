package com.example.testdelete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// This class can be used to initialize the database connection
public class DatabaseConnection {
	public static Connection initializeDatabase()
		throws SQLException, ClassNotFoundException
	{
		// Initialize all the information regarding
		// Database Connection
           

                    //Step 2. Create Connection
   		String dbDriver = "oracle.jdbc.driver.OracleDriver";
		String dbURL = "jdbc:oracle:thin:@119.160.199.94:1521:mefgi";

		// Database name to access
		
		String dbUsername = "mef190570107017";
		String dbPassword = "mef190570107017";

		Class.forName(dbDriver);
		Connection conn = DriverManager.getConnection(dbURL,dbUsername,dbPassword);
		return conn;
	}
}
