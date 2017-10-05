package com.planeasy;

import java.sql.*;

import org.apache.log4j.Logger;


public class LoginDAO {
	private static final Logger LOGGER = Logger.getLogger(LoginDAO.class.getName());
	
	
	public static UserDetails selectUserByID(String userId) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		UserDetails userDetails = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT user_id, user_email, user_first_name, user_last_name, "
					+ "verification_hash, verification_attempts, status, created_time "
					+ "FROM user_info WHERE user_id = ?");
			statement.setString(1, userId);
			result = statement.executeQuery();
			if (result != null) {
				while (result.next()) {
					userDetails = new UserDetails();
					userDetails.setUser_id(result.getInt(1));
					userDetails.setEmail(result.getString(2));
					userDetails.setFirstName(result.getString(3));
					userDetails.setLastName(result.getString(4));
					userDetails.setVerification_hash(result.getString(5));
					userDetails.setVerification_attempts(result.getInt(6));
					userDetails.setStatus(result.getString(7));
					userDetails.setCreated_time(result.getString(8));
				}
			}
			//DBConn.close(conn, ps, res);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}  
		//catch (ClassNotFoundException | SQLException e) {
			//DBConn.close(conn, ps, res);
			//LOGGER.debug(e.getMessage());
			//System.out.println("Log In failed: An Exception has occurred! " + e);
			//throw new DBException("Excepion while accessing database");
		//}
		return userDetails;
	}
	
	
	
	public static boolean validate(LoginBean bean) {
	//public static LoginBean validate(LoginBean bean) {
		boolean valid = false;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		
		try {  
			connection = DatabaseConnection.getConnection();  
			
			String login_email = bean.getEmail();
			String login_password = bean.getPassword();
			
			String query = "SELECT * FROM user_info WHERE user_email = ? and user_password = ?";
			
			statement = connection.prepareStatement(query); 
			statement.setString(1, login_email);
			statement.setString(2, login_password);
			
			
			result = statement.executeQuery();
			result.absolute(1);
				
			String db_email = result.getString("user_email");
			String db_password = result.getString("user_password");
				
			if (db_email.equalsIgnoreCase(login_email) && db_password.equals(login_password)) {
				valid = true;
			} 
				
			if (valid) {
				String firstName = result.getString("user_first_name");
				String lastName = result.getString("user_last_name");
		        String email = result.getString("user_email");
		        String password = result.getString("user_password");
			     	
		        bean.setFirstName(firstName);
		        bean.setLastName(lastName);
		        bean.setEmail(email);
		        bean.setPassword(password);
		        bean.setValid(true);
			}		 
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}
		
		//finally {
			//try { result.close();} catch (Exception e) {}
			//try { statement.close();} catch (Exception e) {}
			//try { connection.close();} catch (Exception e) {}
		//}
		 
		 return valid;  
	}

	 
	
	//needs work
	public static UserDetails verifyLogin(String email, String password) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		UserDetails user = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT user_id, user_email, user_first_name, user_last_name, status, created_time "
					+ "FROM user_info WHERE user_email = ? AND user_password = ?");
			statement.setString(1, email);
			statement.setString(2, password);
			result = statement.executeQuery();
			
			if(result != null) {
				while(result.next()) {
					user = new UserDetails();
					user.setUser_id(result.getInt(1));
					user.setEmail(result.getString(2));
					user.setFirstName(result.getString(3));
					user.setLastName(result.getString(4));
					user.setStatus(result.getString(5));
					user.setCreated_time(result.getString(6));
				}
			}
		} catch (Exception e) {	
			LOGGER.debug(e.getMessage());
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}
		
		return user;
	}
	
	public static UserDetails selectUSERbyEmail(String inputEmail) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		UserDetails userDetails = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT user_id, user_email, user_first_name, user_last_name,"
					+ " verification_hash, verification_attempts, status, created_time FROM user_info "
					+ "WHERE user_email = ?");
			statement.setString(1, inputEmail);
			result = statement.executeQuery();
			
			if (result != null) {
				while (result.next()) {
					userDetails = new UserDetails();
					userDetails.setUser_id(result.getInt(1));
					userDetails.setEmail(result.getString(2));
					userDetails.setFirstName(result.getString(3));
					userDetails.setLastName(result.getString(4));
					userDetails.setVerification_hash(result.getString(5));
					userDetails.setVerification_attempts(result.getInt(6));
					userDetails.setStatus(result.getString(7));
					userDetails.setCreated_time(result.getString(8));
				}
			}
			//DBConn.close(connection, statement, result);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		} 
		//catch (ClassNotFoundException | SQLException e) {
			//LOGGER.debug(e.getMessage());
			//DBConn.close(connection, statement, result);
			//throw new DBException("Exceptioon while accessing database");
		//}
		return userDetails;
	}	
	
	
	
	public static void updateEmailVerificationHashForResetPassword(String inputEmail, String hash) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE user_info SET verification_hash = ?, "
					+ "verification_attempts = ?, status = ? WHERE user_email = ?");
			
			statement.setString(1, hash);
			statement.setInt(2, 0);
			statement.setString(3, GlobalConstants.IN_RESET_PASSWORD);
			statement.setString(4, inputEmail);
			statement.executeUpdate();
			//DBConn.close(connection, statement, result);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		} 
		//catch (ClassNotFoundException | SQLException e) {
			//LOGGER.debug(e.getMessage());
			//DBConn.close(connection, statement);
			//throw new DBException("Excepion while accessing database");
	}
	
	
	public static boolean verifyEmailHash(String user_id, String hash)  {
		Connection connection = null;
		PreparedStatement statement = null;
		boolean verified = false;
		ResultSet result = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM user_info WHERE user_id = ? "
					+ "AND verification_hash = ?");
			statement.setString(1, user_id);
			statement.setString(2, hash);
			result = statement.executeQuery();
			if (result != null) {
				while (result.next()) {
					verified = true;
				}
			}
			//DBConn.close(connection, ps, res);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}  
		//catch (ClassNotFoundException | SQLException e) {
			//DBConn.close(connection, ps, res);
			//LOGGER.debug(e.getMessage());
			//throw new DBException("Exception while accessing database");
		//}
		return verified;
	}
	
	
	public static void updateStatus(String user_id, String status) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE user_info SET status = ? WHERE user_id = ?");
			statement.setString(1, status);
			statement.setString(2, user_id);
			statement.executeUpdate();
			//DBConn.close(conn, ps);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}  
		//catch (ClassNotFoundException | SQLException e) {
			//LOGGER.debug(e.getMessage());
			//DBConn.close(conn, ps);
			//throw new DBException("Exception while accessing database");
		//}
	}
	
	
	public static int incrementVerificationAttempts(String user_id) {
		Connection connection = null;
		PreparedStatement statement1 = null;
		PreparedStatement statement2 = null;
		ResultSet result = null;
		int attempts = 0;
		try {
			connection = DatabaseConnection.getConnection();
			statement1 = connection.prepareStatement("UPDATE user_info "
					+ "SET verification_attempts = verification_attempts + 1 "
					+ "WHERE user_id = ?");
			statement1.setString(1, user_id);
			statement1.executeUpdate();
			
			statement2 = connection.prepareStatement("SELECT verification_attempts FROM user_info");
			result = statement2.executeQuery();
			
			if (result != null) {
				while (result.next()) {
					attempts = result.getInt(1);
				}
			}
			//DBConn.close(conn, ps, ps2, res);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		} 
		//catch (ClassNotFoundException | SQLException e) {
			//LOGGER.debug(e.getMessage());
			//DBConn.close(conn, ps, ps2, res);
			//throw new DBException("Excepion while accessing database");
		//}
		return attempts;
	}
	
	
	
	public static void updateEmailVerificationHash(String user_id, String hash) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE user_info "
					+ "SET verification_hash = ?, verification_attempts = ? "
					+ "WHERE user_id = ?");
			statement.setString(1, hash);
			statement.setInt(2, 0);
			statement.setString(3, user_id);
			statement.executeUpdate();
			//DBConn.close(conn, ps);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}  
		//catch (ClassNotFoundException | SQLException e) {
			//LOGGER.debug(e.getMessage());
			//DBConn.close(conn, ps);
			//throw new DBException("Excepion while accessing database");
		//}
	}
	
	
}

