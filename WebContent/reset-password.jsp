<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style type="text/css">
		body {
			font-family: 'RobotoDraft', 'Roboto', sans-serif;
			font-size: 0.9em;
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
			padding-left:1em;
			line-height:2em;
			font-size:2.3em;
			color:white;
			font-family:Comic Sans MS, Arial;
			font-style:italic;
		}
		.formSection {
			margin-left:25em;
			width: 35em;
			height: 18em;
			padding: 2em;
			background-color:#6FD3F8;
			border-radius:0.5em;
			float:left;
		}
		.emPwd {
			font-size:2em;
			outline: none;
			display: block;
			width: 98%;
			border: 1px solid #d9d9d9;
			margin: 0 0 20px;
			padding: 0.2em 0 0.2em 0.2em;
			border-radius: 0.3em;
		}
		.login {
			cursor: pointer;
		    background: #166EC4;
		    width: 99%;
		    border: 0;
		    padding: 0.2em;
		    font-size:2em;
		    color: #ffffff;
		    margin-top:0.5em;
		    border-radius: 0.3em;
		}
		.register {
			background: #6FD3F8;
		    padding: 1em;
		    color: #666666;
		    font-size: 21px;
		    text-align: center;
		}
		.rememberPwd {
			width:101%;
			box-sizing: border-box;
		    color: #666666;
		    font-size: 15px;
		}
		.forgotLink {
			float:right;
			padding-right:1em;
		}
		.ssoSection {
			padding-left:5em;
			float:left;
			margin-top:5em;
		}
		.ssoHead {
			color:white;
			display:block;
			font-size:1.6em;
		}
		.ssoLogoSection {
			padding-left:1em;
		}
		.ssoLogo {
			height:3em;
			width:3em;
			padding:1em;
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
<title>Reset password</title>
</head>
<body>
	<div class="logoPad">
		<img class="imgcontainer" alt="PlanEasy_logo" src="Images/planner_iconx.png">
	</div>
	<div class="formSection">
		<form action="changeServlet" method="post">
			<input type="hidden" name="userID" value="${userID}">
			<input type="password" name="password" placeholder="Password" class="emPwd"/>
			<input type="password" name="passwordConfirm" placeholder="Confirm password" class="emPwd"/>
			<input type="submit" value="Reset" class="login"/>
		</form>
	</div>
</body>
<footer>
	<div class="footersLink">
		<a href="about.jsp" style="color:white">About</a> |
		<a href="license.jsp" style="color:white">License</a> |
		<a href="contact.jsp" style="color:white">Contact</a>
	</div>
</footer>
</html>