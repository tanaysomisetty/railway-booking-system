package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ApplicationDB {

	public ApplicationDB() {

	}

	public Connection getConnection() {
		// creates connection string to the AWS RDBS
		// jdcbd:mysql://<hostname>:port/Database
		String connectionURL = "jdbc:mysql://cs336test.c7y8oeljbznd.us-east-2.rds.amazonaws.com:3306/CustomerLogin";
		Connection connection = null;

		try {
			// Load JDBC driver - the interface standardizing the connection procedure. Look
			// at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			///what does this do?
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// Create a connection to your DB
			connection = DriverManager.getConnection(connectionURL, "moussa", "league12");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//why do we need this?
	public static void main(String[] args) {
		ApplicationDB dao = new ApplicationDB();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);		
		dao.closeConnection(connection);
	}
}
