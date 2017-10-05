<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
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
    		padding-left: 11.5em;
    		font-family:Times New Roman, sans-serif;
		}
		.content {
			color:white;
			display:block;
			margin:auto;
			padding-top: 3.7em;
			font-size: 1.9em;
			font-family: Calibre;
			text-align: center;
		}
		footer {
		    position: fixed;
		    bottom: 0.9em;
		    width: 100%;
		}
		.footersLink {
			position : absolute;
		    bottom : 0;
		    height : 40px;
		    margin-top : 40px;
		    color: white;
		    margin-left:40%;
		}
		.not-active {
 			pointer-events: none;
 			cursor: default;
 			color: silver;
 			text-decoration:none;
		}
		a:link {
		    color: red;
		}
		a:visited {
		    color: grey;
		}
		a:hover {
		    color: hotpink;
		}
		a:active {
		    color: blue;
		}
	</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>License</title>
</head>
<body>
	<div class="logoPad">
		<img class="imgcontainer" alt="PlanEasy_logo" src="Images/planner_iconx.png">
	</div>
	<div class="headingSection">
		License
	</div>
	<div class="content">
		<p> This project was developed with the help of various open source projects <br>
		and libraries. You can fork this project on : <a href="https://github.com/ayansg27/CalendarApp">GitHub</a></p>
	</div>	
</body>
<footer>
	<div class="footersLink">
		<a href="about.jsp" style="color:white">About</a> |
		<a href="" class="not-active">License</a> |
		<a href="contact.jsp" style="color:white">Contact</a> 
	</div>
</footer>
</html>