package com.planeasy;

import static com.planeasy.DatabaseDetails.*;

import java.sql.*;

public class DatabaseConnection {
	private static Connection connection = null;
	static {
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {}
	}
	
	public static Connection getConnection() {
		return connection;
	}
}
