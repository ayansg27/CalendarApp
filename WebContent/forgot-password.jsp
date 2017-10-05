<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style type="text/css">
		body {
			font-family: 'RobotoDraft', 'Roboto', sans-serif;
			font-size: 1em;
			//background-image: url(Images/bg3.jpg);
			background-color:#444;
			-webkit-background-size: cover;
    		-moz-background-size: cover;
    		-o-background-size: cover;
    		background-size: cover;
    		background-position: top center !important;
			background-repeat: no-repeat !important;   
			background-attachment: fixed; 		
		}
		.logoPad {
			padding-left:4em;
			padding-top:2.5em;
			color:white;
			float:left;
		}
		.imgcontainer {
			width:6em;
			height:4em;
		}
		.logoHead {
			display:block;
			padding-left:1.7em;
			line-height:2em;
			font-size:2em;
			color:white;
			font-family:Comic Sans MS, Arial;
			font-style:italic;
		}
		.headingSection {
    		color: white;
    		font-size:3.3em;
    		padding-top: 0.9em;
    		padding-left: 10.5em;
    		font-family:Times New Roman, sans-serif;
		}
		.content {
			color:white;
			display:block;
			padding: 0.7em 4.5em;
			font-size: 1.9em;
			font-family: Calibre;
			text-align: center;
		}
		.formSection {
			margin-left:25em;
			margin-top:2.3em;
			width: 35em;
			height: 10em;
			padding: 2em;
			background-color:#6FD3F8;
			border-radius:1em;
			float:left;
		}
		.email {
			font-size:2em;
			outline: none;
			display: block;
			width: 98%;
			border: 1px solid #d9d9d9;
			margin: 0 0 20px;
			padding: 0.2em 0 0.2em 0.2em;
			border-radius: 0.2em;
		}
		.submit {
			cursor: pointer;
		    background: #166EC4;
		    width: 99%;
		    border: 0;
		    padding: 0.2em;
		    font-size:2em;
		    color: #ffffff;
		    margin-top:0.5em;
		    border-radius: 0.2em;
		}
		footer {
		    position: fixed;
		    bottom: 0.9em;
		    width: 100%;
		}
		.footersLink{
			position : absolute;
		    bottom : 0;
		    height : 40px;
		    margin-top : 40px;
		    color:white;
		    margin-left:40%;
		}	
	</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forgot Password</title>
</head>
<body>
	<div class="logoPad">
		<img class="imgcontainer" alt="PlanEasy_logo" src="Images/planner_iconx.png">
	</div>
	<div class="headingSection">
		Forgot Password
	</div>
	<div class="content">
		<p>Enter the email address associated with your account. A password reset link <br>
		will be sent to you on that email address.</p>
	</div>
	<div class="formSection">
		<form action=forgotServlet method="post">	
			<input type="text" name="email" placeholder="Email" class="email"/>
			<input type="submit" value="Submit" class="submit"/>
		</form>
	</div>
</body>
<footer>
	<div class="footersLink">
		<a href="about.jsp" style="color:white">About</a> |
		<a href="license.jsp" style="color:white">License</a> |
		<a href="contact.jsp" style="color:white">Contact us</a> 
	</div>
</footer>
</html>