<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
	.taskDate{
			float:left;
			background: #EC5E29;
		    height: 1.6em;
		    width: 7em;
		    margin-left: 0.5em;
		    margin-right: 0.5em;
		    border-radius: 0.2em;
		    color: white;
		    text-align: center;
		    font-size: 2em;
		    padding-top: 0.2em;
		}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<input class="taskDate" id="datepicker" type="text" readonly="true"/>
	<input type="hidden" id="dateText" placeholder="date">
	<input type="text" id="magic" placeholder="see some magic">
	<input type="button" id="submit">
</div>

</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
  	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script>
	  	$(function() {
		    $("#datepicker").datepicker({
		      changeMonth: true,
		      changeYear: true,
		      showAnim: "fold",
		      altField: "#dateText",
		      altFormat: "yy-mm-dd", 
		      onSelect: function (dateText, inst) {
		          alert(dateText + "\t" + $("#dateText").val());
		       }
		    });
		});	
	  	/*
	  	$(document).on("click", "#submit", function(){
	  		$("#magic").val($("#dateText").val());
	  	})
	  	
	  	/*
	  	$(document).on("click", "#submit", function(){
	  		var x = $(".selector").datepicker("getDate");
	  		alert(x);
	  		$("#dateText").val = x;	
	  	});
	  	*/
  	
  	</script>
</html>