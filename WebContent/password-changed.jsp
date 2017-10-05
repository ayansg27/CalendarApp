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
		.content {
			color:white;
			display:block;
			margin:auto;
			padding-top: 7em;
			font-size: 1.9em;
			font-family: Calibre;
			text-align: center;
		}
		.content1 {
			color:white;
			display:block;
			margin:auto;
			padding-top: 2.5em;
			font-size: 1.9em;
			font-family: Calibre;
			text-align: center;
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
<title>Password changed!</title>
</head>
<body>
	<div class="logoPad">
		<img class="imgcontainer" alt="PlanEasy_logo" src="Images/planner_iconx.png">
	</div>
	<div class="content">
		<p>Password has been changed successfully!</p>
	</div>
	<div class="content1">
		<span>
			Click <a href="login.jsp" style="color:orange"><b><i>here</i></b></a> to sign in.
		</span>
	</div>
</body>
<footer>
	<div class="footersLink">
		<a href="about.jsp" style="color:white">About</a> |
		<a href="license.jsp" style="color:white">License</a> |
		<a href="contact.jsp" style="color:white">Contact us</a> 
	</div>
</footer>	