package com.planeasy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResetDAO {
	public static void resetPassword(String userID, String password) {  
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE user_info SET user_password = ?"
						+ " WHERE user_ID = ?");
			
			statement.setString(1, password);
			statement.setString(2, userID);
			statement.executeUpdate();
			//DBConn.close(connection, statement, result);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}
	}
}
