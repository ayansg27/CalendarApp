package com.planeasy;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;


/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/* 
    	String userID = (String) request.getSession().getAttribute(GlobalConstants.USER);
    	if(userID != null) {
    		request.getRequestDispatcher("home.jsp").forward(request, response);	
    	} else {
    		request.getRequestDispatcher("login.jsp").forward(request, response);	
    	}
    	*/
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
	    String email = request.getParameter("email");
	    String password = BCrypt.hashpw(request.getParameter("password"), GlobalConstants.SALT);
	    StatusMsg status = new StatusMsg();
	    LOGGER.debug(email);
	    
	    try {
	    	UserDetails user = LoginDAO.verifyLogin(email, password);
	    	if(user != null) {
	    		if (user.getStatus().equals(GlobalConstants.ACTIVE) || user.getStatus().equals(GlobalConstants.IN_RESET_PASSWORD)) {
	    			request.getSession().setAttribute(GlobalConstants.USER, user.getUser_id());
					request.getSession().setAttribute(GlobalConstants.USER_NAME, user.getFirstName() + " " + user.getLastName());
					status.setCode(0);
					status.setMsg("Success");
	    		}
	    		else if (user.getStatus().equals(GlobalConstants.NEW)) {
	    			status.setCode(-1);
	    			status.setMsg("Account activation is in pending");
	    		}
	    		else {
	    			status.setCode(-1);
	    			status.setMsg("Unkown error");
	    		}
	    	}
	    	else {
	    		status.setCode(-1);
    			status.setMsg("Username or password is not valid.");
	    	}
	    	
	    } catch (Exception e) {	
			LOGGER.debug(e.getMessage());
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}
	    PrintWriter writer = response.getWriter();
		writer.write(Utils.toJson(status));
		writer.flush();
		writer.close();
	    */
		
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();  
	    
	    LoginBean bean = new LoginBean();
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    bean.setEmail(email);
	    bean.setPassword(password);
	    UserDetails user = LoginDAO.selectUSERbyEmail(email);
	    
	    if (LoginDAO.validate(bean)) {
	    	
	    	request.setAttribute("email", email);
	    	request.setAttribute("userID", user.getUser_id());
	    	request.setAttribute("firstName", user.getFirstName());
	    	request.setAttribute("lastName", user.getLastName());	
	    	
	    	HttpSession session = request.getSession();
	        session.setAttribute("userID", user.getUser_id());
	    	//request.getRequestDispatcher("home.jsp").forward(request, response);
	    	request.getRequestDispatcher("home2.jsp").forward(request, response);
	    }
	    else {
	    	out.print("Username or password error! Please try again!");  
	    	request.getRequestDispatcher("login.jsp").include(request, response);  
	    	//request.getRequestDispatcher("login.jsp").forward(request, response);  
	    	//RequestDispatcher req = request.getRequestDispatcher("login.jsp");  
	        //req.include(request,response);  
	    }
	    out.close();
	}
}
