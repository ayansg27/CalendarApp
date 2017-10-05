package com.planeasy;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class ForgotPasswordServlet
 */
//@WebServlet("/forgotServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		StatusMsg statusMsg = new StatusMsg();
		try {
			UserDetails userDetails = LoginDAO.selectUSERbyEmail(email);
			if (userDetails != null) {
				String hash = Utils.prepareRandomString(30);
				LoginDAO.updateEmailVerificationHashForResetPassword(email, BCrypt.hashpw(hash,GlobalConstants.SALT));
				MailUtil.sendResetPasswordLink(userDetails.getUser_id()+"", email, hash);
				statusMsg.setCode(0);
				statusMsg.setMsg("We have sent reset password link to your email");
				// new line
				request.getRequestDispatcher("reset-sent.jsp").forward(request, response);
			}
			else {
				statusMsg.setCode(-1);
				statusMsg.setMsg("This email doesn't exist");
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
