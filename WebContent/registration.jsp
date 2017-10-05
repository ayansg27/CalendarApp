<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style>
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
			padding-left:1em;
			line-height:2em;
			font-size:2.3em;
			color:white;
			font-family:Comic Sans MS, Arial;
			font-style:italic;
		}
		.regWrap {
			width: 40em;
			float:left;
			margin-top:1.7em;
		}
		.regHead {
			margin-left:10em;
			color:white;
			font-size:1.5em;
			text-align:center;
			width: 25em;
			float:left;
		}
		.regSection {
			margin-left:14em;
			margin-top:1.5em;
			width: 33em;
			height: 36.3em;
			padding: 2em;
			background-color:#6FD3F8;  
			border-radius: 0.5em;
			float:left;
			color:#666666;
		}
		.regFields {
			font-size:1.4em;
			outline: none;
			display: block;
			width: 98%;
			border: 1px solid #d9d9d9;
			margin: 0 0 20px;
			padding: 0.2em 0 0.2em 0.2em;
			border-radius: 0.3em;
		}
		.register {
		    color: #666666;
		    font-size: 1.1em;
		    text-align: center;
		    margin-top:1em;
		}
		.logon {
			cursor: pointer;
		    background: #166EC4;
		    width: 99%;
		    border: 0;
		    padding: 0.2em;
		    font-size:2em;
		    color: #ffffff;
		    margin-top:0.5em;
		    //margin-bottom:0.5em;
		    border-radius: 0.2em;
		}
		.ssologo {
			height:3em;
			width:3em;
			padding:1em;
		}
		.ssosection {
			margin-top:13.25em;
			margin-left: 5em;
			float:left;
			display:none;
		}
		.ssohead {
			color:white;
			display:block;
			font-size:1.3em;
		}
		.ssologosection {
			padding-left:2.5em;
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
<title>Registration</title>
</head>
<body>
	<div class="logoPad">
    	<img class="imgcontainer" alt="PlanEasy_logo" src="Images/planner_iconx.png">
	</div>
 	<div class="regWrap">
 		<div class="regHead">
	  		<b>Register your account today!</b>
		</div>
 		<div class="regSection"> 
 			<form action="registration-process.jsp" method="post">  
 				<input type="text" name="firstName" placeholder="First Name" class="regFields"/>
				<input type="text" name="lastName" placeholder="Last Name" class="regFields"/>  
				<input type="text" name="email" placeholder="Email" class="regFields"/>
				<input type="password" name="password" placeholder="Password" class="regFields"/> 
				<input type="password" name="passwordConfirm" placeholder="Confirm Password" class="regFields"/> 
				<input type="text" name="phone" placeholder="Phone" class="regFields"/>
				<input type="text" name="dob" placeholder="Date of birth (YYYY-MM-DD)" class="regFields"/>
				<input type="text" name="studentStatus" placeholder="Student Status" class="regFields"/>
				<input type="checkbox" >I agree to the <a href="terms-and-conditions.jsp" style="color:blue">terms and conditions</a>
				<input type="submit" value="Sign up" class="logon"/>
				<div class="register">
					Already have an account? <a href="login.jsp" style="color:blue">Log in</a>
				</div>
			</form>
	  	</div>
	</div>
	 <div class="ssosection">
		<span class="ssohead">Or sign up using social media:</span>
		<div class="ssologosection">
			<div>
				<img class="ssologo" src="Images/facebook_logo.png" alt="logo">
				<img class="ssologo" src="Images/googleplus_logo.png" alt="logo">
			</div>
			<div>
				<img class="ssologo" src="Images/linkedIn_logo.png" alt="logo">
				<img class="ssologo" src="Images/twitter_logo.png" alt="logo">
			</div>
		</div>
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