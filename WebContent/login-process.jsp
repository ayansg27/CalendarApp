<%@page import="com.planeasy.LoginDAO"%>  
<%@page import="com.planeasy.LoginBean"%>
<jsp:useBean id="obj" class="com.planeasy.LoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  

	/*
	
	LoginBean userInfo = new LoginBean();
	userInfo = LoginDAO.validate(obj);  
	
	if (userInfo.isValid()){  
		session.setAttribute("session","TRUE");
		session.setAttribute("userEmail",userInfo.getEmail());
		String redirectURL = "http://localhost:8080/Plan_Easy/home.jsp";
	    response.sendRedirect(redirectURL);
	}  
	else  
	{  
		out.print("Sorry, email or password error");  
	}  
	
	*/
%>  