package com.planeasy;

import java.sql.*;

import org.apache.log4j.Logger;


public class RegistrationDAO {
	
	private static final Logger LOGGER = Logger.getLogger(RegistrationDAO.class.getName());
	

	public static int createUser(RegistrationBean bean) {  
		int count = 0;  
		Connection connection = null;
	    PreparedStatement statement = null;
	    
		try{  
			connection = DatabaseConnection.getConnection();  
			
			
		    String query = "INSERT INTO user_info "
		    				+ "(user_first_name, user_last_name, user_email, user_password, "
		    				+ "user_phone, user_dob, student_status_type)"
		    				+ " values (?, ?, ?, ?, ?, DATE(?), ?)";
			
		    statement = connection.prepareStatement(query);
		    statement.setString(1,bean.getFirstName());  
		    statement.setString(2,bean.getLastName());
		    statement.setString(3,bean.getEmail());  
		    statement.setString(4,bean.getPassword());
		    statement.setString(5,bean.getPhone());
		    statement.setString(6,bean.getDob());
		    statement.setString(7,bean.getStudentStatus());
			
		    
		    if(bean.getFirstName().equals(null) || bean.getLastName().equals(null) || bean.getEmail().equals(null)
		    		|| bean.getPassword().equals(null) || bean.getPhone().equals(null) || bean.getDob().equals(null)
		    		|| bean.getStudentStatus().equals(null)) {
		    	return 0;
		    }
		    
		    
			// execute the preparedstatement
			count = statement.executeUpdate();
		              
		} catch (SQLException e) {
			System.out.println("Log In failed: An Exception has occurred! " + e);
		} 
		
		//finally {						//some exception handling
			//try { 
				//statement.close(); 
				//} catch (Exception e) {}			
			//try { 
			//	connection.close(); 
			//	} catch (Exception e) {}
		 // }  
		    
		
		return count;  
	}

	
	public static boolean isEmailExists(String email) {
		Connection connection = null;
		PreparedStatement statement = null;
		boolean verified = false;
		ResultSet result = null;
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT 1 FROM user_info WHERE user_email = ?");
			statement.setString(1, email);
			result = statement.executeQuery();
			if (result != null) {
				while (result.next()) {
					verified = true;
				}
			}
			//DBConn.close(connection, statement, result);
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}  
		//catch (ClassNotFoundException | SQLException e) {
			//DBConn.close(conn, ps, res);
			//LOGGER.debug(e.getMessage());
			//System.out.println("Log In failed: An Exception has occurred! " + e);
			//throw new DBException("Excepiton while accessing database");
		//}
		return verified;
	}
	
	
	
	public static String insertRow(UserDetails user) {
		Connection connection = null;
		PreparedStatement statement1 = null;
		PreparedStatement statement2 = null;
		ResultSet result = null;
		
		String id = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			connection.setAutoCommit(false);
			
			String query = "INSERT INTO user_info "
    				+ "(user_first_name, user_last_name, user_email, user_password, "
    				+ "user_phone, user_dob, student_status_type, verification_hash)"
    				+ " values (?, ?, ?, ?, ?, DATE(?), ?, ?)";
			
			statement1 = connection.prepareStatement(query);
			statement1.setString(1, user.getFirstName());  
		    statement1.setString(2, user.getLastName());
		    statement1.setString(3, user.getEmail());  
		    statement1.setString(4, user.getPassword());
		    statement1.setString(5, user.getPhone());
		    statement1.setString(6, user.getDob());
		    statement1.setString(7, user.getStudentStatus());
		    statement1.setString(8, user.getVerification_hash());
		    statement1.executeUpdate();
		    
		    statement2 = connection.prepareStatement("SELECT LAST_INSERT_ID()");
			result = statement2.executeQuery();
			
			if (result != null) {
				while (result.next()) {
					id = result.getString(1);
				}
			}
			
			connection.commit();
		} catch (SQLException e) {
			System.out.println("Log In failed: An Exception has occurred! " + e);
		} 		
		return id;
	}	
	
}