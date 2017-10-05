package com.planeasy;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePasswordServlet
 */
//@WebServlet("/changeServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String password1 = request.getParameter("passwordConfirm");
		String userID = request.getParameter("userID");
		UserDetails user = LoginDAO.selectUserByID(userID);
		
		StatusMsg statusMsg = new StatusMsg();
		
		try {
			if (password.equals(password1)) {
				ResetDAO.resetPassword(userID, password);
		    	request.getRequestDispatcher("password-changed.jsp").forward(request, response);					
			}
			else {
				statusMsg.setCode(-1);
				statusMsg.setMsg("The passwords do not match!");
			}
		} catch (Exception e) {				// catch (SQLException ex) { 
			statusMsg.setCode(-1);
			statusMsg.setMsg(e.getMessage());
			System.out.println("Log In failed: An Exception has occurred! " + e);
		}
		PrintWriter writer = response.getWriter();
		writer.write(Utils.toJson(statusMsg));
		writer.flush();
		writer.close();
	}
}
