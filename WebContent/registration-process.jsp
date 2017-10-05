<%@page import="com.planeasy.RegistrationDAO"%>  
<jsp:useBean id="user" class="com.planeasy.RegistrationBean"/>  
  
<jsp:setProperty property="*" name="user"/>  
  
<%  
	int result = RegistrationDAO.createUser(user);  
 
	if (result > 0) {  
		session.setAttribute("session","TRUE");
		String redirectURL = "http://localhost:8080/Plan_Easy/signup-complete.jsp";
    	response.sendRedirect(redirectURL);
	}  
	else {  
		out.print("Sorry, registration error!");  
		session.setAttribute("session","FALSE");
	}	
%> 

