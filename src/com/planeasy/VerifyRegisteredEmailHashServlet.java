package com.planeasy;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;



/**
 * Servlet implementation class VerifyRegisteredEmailHash
 */
//@WebServlet("/verifyServlet")
public class VerifyRegisteredEmailHashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(VerifyRegisteredEmailHashServlet.class.getName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyRegisteredEmailHashServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //http://localhost:8080/Plan_Easy/verifyServlet?
    //scope=activation  &  userId=19    &      hash=1gq094pzams9i0tx68mw42qip571j9
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get user Id and email verification code Hash code  
				Integer userId = Integer.parseInt(request.getParameter("userId"));
				String hash = BCrypt.hashpw(request.getParameter("hash"), GlobalConstants.SALT);
				String scope = request.getParameter("scope");
				String message = null;
				try {
					// verify with database
					if(LoginDAO.verifyEmailHash(userId.toString(), hash) && scope.equals(GlobalConstants.ACTIVATION)) {
					   //update status as active
						LoginDAO.updateStatus(userId.toString(), "active");
					   message = "Email verified successfully. Your account is now activated. <br/><br/>"
					   		+ "Click <a href=\"login.jsp\">here</a> to login";
					} 
					else if(LoginDAO.verifyEmailHash(userId.toString(), hash) && scope.equals(GlobalConstants.RESET_PASSWORD)) {
					   //update status as active
						LoginDAO.updateStatus(userId.toString(), "active");
					   //put some session for user
					   request.getSession().setAttribute("userID", userId);
					   request.getSession().setAttribute(GlobalConstants.IS_RESET_PASSWORD_VERIFIED, GlobalConstants.YES);
					   request.getRequestDispatcher("reset-password.jsp").forward(request, response);
					} 
					else {
					   //now increment verification attempts 
					   int attempts = LoginDAO.incrementVerificationAttempts(userId.toString());
					   
					   if(attempts == 20) {
						   // reset verification code if attempts equal to 20 
						   String hashcode = Utils.prepareRandomString(30);
						   LoginDAO.updateEmailVerificationHash(userId.toString(), BCrypt.hashpw(hashcode, GlobalConstants.SALT));
						   UserDetails up = LoginDAO.selectUserByID(userId.toString());
						   MailUtil.sendEmailRegistrationLink(userId.toString(), up.getEmail(), hashcode);
						   message = "20 times Wrong Email Validation Input Given. We are sending a new activation link to your Email";
					   } 
					   else {
						   message = "Wrong Email Validation Input";   
					   }
					}
					
				//} catch (DBException e) {
					//LOGGER.debug(e.getMessage());
					//message = e.getMessage();
				// }
				} catch (AddressException e) {
					message = e.getMessage();
					LOGGER.debug(e.getMessage());
				} catch (MessagingException e) {
					message = e.getMessage();
					LOGGER.debug(e.getMessage());
				}
				if(message!=null) {
					request.setAttribute(GlobalConstants.MESSAGE, message);
					request.getRequestDispatcher("message-to-user.jsp").forward(request, response);	
				} 
				/*
				} catch (Exception e) {				// catch (SQLException ex) { 					
					System.out.println("Log In failed: An Exception has occurred! " + e);
				}
				*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
