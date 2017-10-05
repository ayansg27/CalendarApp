package com.planeasy;

import java.io.*;
import java.sql.*;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;



/**
 * Servlet implementation class RegistrationServlet
 */
//@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(RegistrationServlet.class.getName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String studentStatus = request.getParameter("studentStatus");
		
		StatusMsg status = new StatusMsg();
		String output = "";
		
		
		
		
		if (!validate(email, firstName, lastName, password, phone, dob, studentStatus)) {
	    	status.setCode(-1);
	    	status.setMsg("Please fill out all the fields!");
			output = Utils.toJson(status);
		}
		else if (!password.equals(passwordConfirm)) {
			status.setCode(-1);
	    	status.setMsg("Passwords do not match. Please enter the same password in both fields.");
			output = Utils.toJson(status);
		}
		else {
			UserDetails user = new UserDetails();
			//RegistrationBean user = new RegistrationBean();
			user.setEmail(email);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setPassword(password);
			user.setPhone(phone);
			user.setDob(dob);
			user.setStudentStatus(studentStatus);
			
			/*
			// generate hash for password
			user.setPassword(BCrypt.hashpw(password,GlobalConstants.SALT));
			// generate hash code for email verification
			String hash = Utils.prepareRandomString(30);
			// generate hash for password
			user.setVerification_hash(BCrypt.hashpw(hash, GlobalConstants.SALT));
			*/
			
			try {
				if (!RegistrationDAO.isEmailExists(email)) {
					// create account if email is not previously registered
					String id = RegistrationDAO.insertRow(user);
					
					// send verification email
					//MailUtil.sendEmailRegistrationLink(id, email, hash);
					//status.setCode(0);
					//status.setMsg("Registration link sent to your mail successfully. Please verify your email.");
					//output = Utils.toJson(status);					
					
					request.getRequestDispatcher("signup-complete.jsp").forward(request, response);
				}
				else {
		    		// tell the user that the email is already in use
		    		status.setCode(-1);
					status.setMsg("This email is already registered. Please log in instead.");
					output = Utils.toJson(status);
		    	}
			} catch (Exception e) {
				LOGGER.debug(e.getMessage());
				status.setCode(-1);
				status.setMsg(e.getMessage());
				output = Utils.toJson(status);
			}
		}
		
		// send output to user
	    PrintWriter writer = response.getWriter();
	    writer.write(output);
	    writer.flush();
	    writer.close();
	    
	}
	
	public static boolean validate(String email, String firstName, String lastName, String password, String phone, 
			String dob, String studentStatus) {
		if(email == null) {
			return false;
		}
		else if(firstName == null) {
			return false;
		}
		else if(lastName == null) {
			return false;
		}
		else if(password == null) {
			return false;
		}
		else if(phone == null) {
			return false;
		}
		else if(dob == null) {
			return false;
		}
		else if(studentStatus == null) {
			return false;
		}
		else {
			return true;
		}
	}

}
