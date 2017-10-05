<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style type="text/css">
		body {
			font-family: "RobotoDraft", "Roboto", sans-serif;
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
		.taskSection {
			width: 37em;
		    height: 21em;
		    padding: 2em;
		    background-color: #6FD3F8;
		    border-radius: 0.5em;
		    float: left;
		    margin-left: 16em;
		    margin-top: 2em;
		}
		.addDivSection {
			width: 16em;
		    height: 19.5em;
		    padding: 1em;
		    background-color: #6FD3F8;
		    border-radius: 0.5em;
		    float: right;
		    margin-left: 2em;
		    margin-top: 2em;		
		    display: none;
		}
		.editDivSection {
			width: 16em;
		    height: 18em;
		    padding: 1em;
		    background-color: #94DBFA;
		    border-radius: 0.5em;
		    float: right;
		    margin-left: 2em;
		    margin-top: 2em;		
		    display: none;
		}
		.footersLink{
			position : absolute;
		    bottom : 0;
		    height : 40px;
		    margin-top : 40px;
		    color:white;
		    padding-left:44%;
		}
		.taskWrap{
			float:left;
		}
		.taskHead{
			font-size: 2em;
		    padding-top: 1.5em;
		    font-weight: bold;
		    color: white;
		    padding-left: 16em;
		    padding-bottom: 0.5em;
		    
		}
		.taskNav{
			padding-left:25em;
			width:30em;
		}
		.logocontainer{
			width:4em;
			height:4em;
			float:left;
			cursor:pointer;
		}
		.taskDate{
			float:left;
			background: #D3F1F2;
		    height: 1.6em;
		    width: 7em;
		    margin-left: 0.5em;
		    margin-right: 0.5em;
		    border-radius: 0.2em;
		    color: #007073;
		    text-align: center;
		    font-size: 2em;
		    padding-top: 0.2em;
		}
		.taskDetails {
			font-size:1.2em;
			outline: none;
			display: block;
			width: 98%;
			border: 0.5px solid #d9d9d9;
			margin: 0 0 10px;
			padding: 0.1em 0 0.1em 0.1em;
			border-radius: 0.1em;
		}
		.submit {
			cursor: pointer;
		    background: #166EC4;
		    width: 99%;
		    border: 0;
		    padding: 0.2em;
		    font-size:1.4em;
		    color: #ffffff;
		    margin-top:0.5em;
		    //margin-bottom:0.5em;
		    border-radius: 0.2em;
		}
		.colHead{
			color: #570000;
			background: #F4DBF4;
		}
		.task{
			width:100%;
			border: 1px solid #1476C4;
			border-radius: 5px;
			background:#F5F5F9;
		}
		.member tr{
			text-align: center;
			cursor: pointer;
			border-bottom: 1px solid #72B2E5;
			width:36.7em;
		}
		.task tbody {
	        height: 15em;
	        display: block;
	        overflow-y:auto;
	        //width:100%;
	        //width: calc( 100% - 1em );
	    }
	    .task thead, tbody tr {
		    display:table;
		    table-layout:fixed;
		}
		.task thead, tbody{
			width:100%;
		}
		.task thead {
		    //width: calc( 100% - 1.15em ); 
		    width:100%;
			border-bottom: 1px solid #72B2E5;
		}
		.task td, th {
			border-right: 1px solid #72B2E5;
			border-left: 1px solid #72B2E5;
		}
		.tskButton {
			cursor: pointer;
		    background: #217FC9;
		    width: 5em;
		    border: 0;
		    padding: 0.2em;
		    font-size:2em;
		    color: #ffffff;
		    margin:0.5em;
		    border-radius: 0.3em;
		}
		.tskButtonDisabled {
			cursor: pointer;
		    background: #E1E6EA;
		    width: 5em;
		    border: 0;
		    padding: 0.2em;
		    font-size:2em;
		    color: #ffffff;
		    margin:0.5em;
		    border-radius: 0.3em;
		}
		.member tr:hover {
		    background-color: rgba(41, 103, 182, 0.89);
		    color: #FFF;
		}
		.member tr.selected{
		    background-color: rgba(41, 103, 182, 0.89);
		    color: #FFF;
		} 
		.member tr.disabled {
			background-color: grey;
		}
		.closeBtn {
			text-align: right;
			float:right;
			margin-bottom: 0.5em;
			cursor: pointer;
		}
		.logoutSection {
			width: 7em;
		    height: 5em;
		    //float: right;
		   //padding-right:9em;
			//padding-top:4em;
			color:white;
			position: fixed;
			right: 6em;
			top:4em;
		}
		.logoutBtn {
			//color: brown;
			//font-size: 3em;
			font-style: "Monospace";
			//float: right;
			text-decoration: underline;
			cursor: pointer;
		    //width: 1.7em;
		    //height: 3em;
		    background: silver;
		    width: 4em;
		    border: 0;
		    padding: 0.2em;
		    font-size:1em;
		    color: brown;
		    margin:0.5em;
		    border-radius: 0.3em;
		}
		.logoutBtn:hover {
			background: red;
			color: white;
		}
	</style>
	<body>
		<div class="logoPad">
			<img class="imgcontainer" alt="PlanEasy_logo" src="Images/planner_iconx.png">
		</div>
		<div class="taskWrap">
			<div class="taskHead">
		  		Plans for
			</div>
			<div class="taskNav">
				<img class="logocontainer" id="decDt" alt="leftA_logo" src="Images/arrowLeft.png">
				<input class="taskDate" id="datepicker" type="text" readonly="true"/>
				<img class="logocontainer" id="incDt"alt="RightA_logo" src="Images/arrowRight.png">
			</div>
			<div class="taskSection">
				<table id="taskTable" class="task">
					<thead>
						<tr class="colHead">
							<th scope="col">Task Name</th>
							<th scope="col">Start Time</th>
							<th scope="col">End Time</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody id="taskTbl" class="member">
						
					</tbody>
				</table>
				<div class="tskButWrap">
					<input type="button" id="addTask" value="Add" class="tskButton" />
					<input type="button" id="editTask" value="Edit" class="tskButtonDisabled" disabled/>
					<input type="button" id="deleteTask" value="Delete" class="tskButtonDisabled" disabled/>
				</div>
			</div>
			<div class="addDivSection" id="taskDiv">
				<span id="close" class="closeBtn">X</span>
				<form name="newTask" id="newTask">
					<input type="hidden" id="taskID">
					<input type="hidden" id="pickerDate">
					<input type="text" name="taskName" id="taskName" placeholder="Task name" class="taskDetails"/>
					<label for="startTime">Start Time: </label>
					<input type="time" name="startTime" id="startTime" class="taskDetails"/>
					<label for="endTime">End Time: </label>
					<input type="time" name="endTime" id="endTime" class="taskDetails"/>
					<select id="taskStatus" name="taskStatus" id="taskStatus" class="taskDetails">
						<option value="" disabled selected>Task status</option>
				    	<option value="Not started">Not started</option>
				    	<option value="Completed">Completed</option>
				    	<option value="Missed">Missed</option>
				  </select>
				  <select id="taskPriority" name="taskPriority" id="taskPriority" class="taskDetails">
				  		<option value="" disabled="disabled" selected="selected" hidden="hidden">Task priority</option>
				    	<option value="Low">Low</option>
				    	<option value="Medium">Medium</option>
				    	<option value="High">High</option>
				  </select>
					<input type="submit" id="saveTask" value="Add Task" class="submit"/>	
				</form>
			</div>			
		</div>	
		<div class="logoutSection">
			<form action="logoutServlet" action="post">	
				<input type="submit" value="Logout" name="logout" class="logoutBtn">
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
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!--   	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script> -->
<!--   	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script> -->
<!--   	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
  	
  	<script   src="https://code.jquery.com/jquery-1.12.1.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.css" />
  	<script>
		$(function() {
		    $("#datepicker").datepicker({
		      changeMonth: true,
		      changeYear: true,
		      showAnim: "fold", 
		      altField: "#pickerDate",
		      altFormat: "yy-mm-dd",
		      onSelect: function (dateText, dateInstance) {
		          //fetching user id
				  var userID="<%= session.getAttribute("userID") %>";
				  //fetching user tasks
				  findTasks(userID,$("#pickerDate").val());
		       }
		    });
		});	 
		// task home page for current date
		$(document).ready(function() {
			// clearing out the form
			//document.getElementById("newTask").reset();	
			$("#newTask")[0].reset(); // $("#newTask")[0].reset(); form.reset() is a DOM element method
			//setting current date
			var d = new Date();
			var month = d.getMonth()+1;
			var day = d.getDate();
			var output = (month<10 ? "0" : "")+month+"/"+(day<10 ? "0" : "")+day+"/"+d.getFullYear();
			//assigning to datepicker
			$("#datepicker").val(output);
			
			var dt = $.datepicker.formatDate("yy-mm-dd", d);
			
			//fetching user id
			var userID="<%= session.getAttribute("userID") %>";
			//fetching user tasks
			findTasks(userID,dt);			
		});
		// for enabling edit & delete on selecting a task
		$(document).on("click", "#taskTable tr", function() {
			var divStatus = $("#taskDiv").css("display");
			if (divStatus == "none") {
				var elemID=$(this).attr("id");
				$("#"+elemID).addClass("selected").siblings().removeClass("selected");
				$("#editTask").removeClass("tskButtonDisabled").addClass("tskButton");
				$("#editTask").prop("disabled", false);
				$("#deleteTask").removeClass("tskButtonDisabled").addClass("tskButton");
				$("#deleteTask").prop("disabled", false);
			}
			else {
				alert("Please close the task box or submit it first!");
			}
			
		}); 
		// for disabling edit and delete when clicked outside the table 
		$(document).click(function(event) {
			if(!$(event.target).closest("#taskTbl").length){
				$("#taskTbl").children().removeClass("selected");
				$("#editTask").removeClass("tskButton").addClass("tskButtonDisabled");
				$("#editTask").prop("disabled", true);
				$("#deleteTask").removeClass("tskButton").addClass("tskButtonDisabled");
				$("#deleteTask").prop("disabled", true);
			}
		});
		// on clicking delete task
		$(document).on("click", "#deleteTask", function() {		
			var decision = confirm("Are you sure you want to permanently delete this task?");
			if(decision) {
				var userID = "<%= session.getAttribute("userID") %>";
				var taskID = $("#taskTbl tr.selected").attr("id");
				//$("#taskTbl tr.selected").remove();
				//$("#"+taskID).remove();
				
				// deleting the relevant task
				deleteTask(taskID,userID);	
				
				// getting the date from the datepicker as a Date object
				var d = $("#datepicker").datepicker("getDate");
				// converting to MySql format date
				var date = $.datepicker.formatDate("yy-mm-dd", d);
				
				// reloading the tasks and displaying the updated tasks with the deleted one now ommitted
				findTasks(userID,date);
			}
		});
		// on clicking add button
		$(document).on("click", "#addTask", function() {			
			// clearing the form
			$("#newTask")[0].reset();
			// clearing out validation
			$("#newTask").validate().resetForm();
			// disabling add button
			$("#addTask").removeClass("tskButton").addClass("tskButtonDisabled");
			$("#addTask").prop("disabled", true);	
			// make the add task section visible
			$(".addDivSection").toggle();	
			// modifying the submit button value
			$("#saveTask").val("Add Task");
		}); 
		// on clicking edit button
		$(document).on("click", "#editTask", function() {
			// disabling edit button
			//$("#editTask").removeClass("tskButton").addClass("tskButtonDisabled");
			//$("#editTask").prop("disabled", true);					
			// clearing the form
			$("#newTask")[0].reset();
			// clearing out validation
			$("#newTask").validate().resetForm();
			// disabling add button
			$("#addTask").removeClass("tskButton").addClass("tskButtonDisabled");
			$("#addTask").prop("disabled", true);
			// make the edit task section visible
			$(".addDivSection").toggle();	
			// retrieving the task id that is to be edited
			var taskID = $("#taskTbl tr.selected").attr("id");
			// setting taskID as the value of hidden element to fetch it later
			$("#taskID").val(taskID);			
			// now we bind the existing task values to this form
			// modifying the submit button value
			$("#saveTask").val("Update Task");
			fillForm(taskID);
		});
		// validating input in the add task form, and adding task to the database and displaying in the table
		$(function() {
			var validator = $("form[name='newTask']").validate({
				rules: {
					taskName: "required", 
					startTime: {
						required: true
						//,time: true
					},
					endTime: {
						required: true 
						//,time: true
					}
				},
				submitHandler: function(form) { 
					// since same form is used for add/edit, check for add
					if ($("#saveTask").val() == "Add Task") {
						// modifying submit handler to call function addTask that performs ajax call
						var userID = "<%= session.getAttribute("userID") %>";
						var taskName = $("#taskName").val();
						// getting the date from the datepicker as a Date object
						var d = $("#datepicker").datepicker("getDate");
						// converting to MySql format date
						var taskDate = $.datepicker.formatDate("yy-mm-dd", d);
						var startTime = $("#startTime").val();
						// converting to MySql time format 
						if(startTime.length <= 5) {
							startTime += ":00";
							}
						var endTime = $("#endTime").val();
						// converting to MySql time format 
						if(endTime.length <= 5) {
							endTime += ":00";
							}					
						var taskStatus = $("#taskStatus option:selected").text();
						var taskPriority = $("#taskPriority option:selected").text();
						// now calling addTask method for ajax call
						addTask(userID, taskName, taskDate, startTime, endTime, taskStatus, taskPriority);
						// clearing out the form
						$("#newTask")[0].reset();
						// resetting validations
						validator.resetForm();
						// after alert about insert success/failure, hiding the add section again
						$(".addDivSection").toggle();
						// reloading the tasks and displaying the updated tasks with the new task
						findTasks(userID, taskDate);
						// enabling the div after tasks are fetched
						//$(".taskSection *").prop("disabled",false);
						//$(".taskNav *").prop("disabled",false);
						// enabling add button again
						$("#addTask").removeClass("tskButtonDisabled").addClass("tskButton");
						$("#addTask").prop("disabled", false);
					}
					
					// check submit button for edit function
					if ($("#saveTask").val() == "Update Task") {
						// modifying submit handler to call function updateTask that performs ajax call
						// retrieving the task id that is to be edited
						var taskID = $("#taskID").val();
						// fetching details from the form
						var taskName = $("#taskName").val();
						var startTime = $("#startTime").val();
						// converting to MySql time format 
						if(startTime.length <= 5) {
							startTime += ":00";
						}	
						var endTime = $("#endTime").val();
						// converting to MySql time format 
						if(endTime.length <= 5) {
							endTime += ":00";
						}					
						var taskStatus = $("#taskStatus option:selected").text();
						var taskPriority = $("#taskPriority option:selected").text();
						// now calling editTask method for ajax call
						editTask(taskID, taskName, startTime, endTime, taskStatus, taskPriority);
						// clearing out the form
						$("#newTask")[0].reset();
						// resetting validations
						validator.resetForm();
						// after alert about update success/failure, hiding the add section again												
						$(".addDivSection").toggle();
						// storing session attribute userID in a var to call findTasks
						var userID = "<%= session.getAttribute("userID") %>";
						// getting the date from the datepicker as a Date object
						var d = $("#datepicker").datepicker("getDate");
						// converting to MySql format date
						var taskDate = $.datepicker.formatDate("yy-mm-dd", d);
						// reloading the tasks and displaying the updated tasks 
						findTasks(userID, taskDate);
						// enabling the div after it is updated
						//$(".taskSection *").prop("disabled",false);
						//$(".taskNav *").prop("disabled",false);
						// enabling add button again
						$("#addTask").removeClass("tskButtonDisabled").addClass("tskButton");
						$("#addTask").prop("disabled", false);
					}
					
				}
			});
		});

		// for close button on add/edit task section
		$(document).on("click", "#close", function(){
			// hide the addTask div section 
			$(".addDivSection").toggle();	
			// enabling the div after it is updated
			//$(".taskSection *").prop("disabled",false);
			//$(".taskNav *").prop("disabled",false);
			// enabling add button again
			$("#addTask").removeClass("tskButtonDisabled").addClass("tskButton");
			$("#addTask").prop("disabled", false);
			// clearing the form
			$("#newTask")[0].reset();
			// clearing out validation
			$("#newTask").validate().resetForm();
		});
		 
		
		
		
		
		
		
		// left button to go to previous day								
		$("#decDt").on("click",function(){
			date = new Date(Date.parse($("#datepicker").val()));
			date.setDate(date.getDate() - 1);
			var formatted = $.datepicker.formatDate("mm/dd/yy",date);
			$("#datepicker").val(formatted);
			
			$//("#taskTbl").empty();
			
			var dt = $.datepicker.formatDate("yy-mm-dd", date);
			//fetching user 
			var userID="<%= session.getAttribute("userID") %>";
			//fetching user 
			findTasks(userID,dt);
			// hiding add task section in case it was visible previously 
			$(".addDivSection").hide();
			// clearing out form in case of previous entries
			//document.getElementById("newTask").reset();		// $("#newTask").reset() not working for this
			$("#newTask")[0].reset();
			// enabling add button in case it was disabled
			$("#addTask").removeClass("tskButtonDisabled").addClass("tskButton");
			$("#addTask").prop("disabled", false);
		});
		// right button to go to next day
		$("#incDt").on("click",function(){
			date = new Date(Date.parse($("#datepicker").val()));
			date.setDate(date.getDate() + 1);
			var formatted = $.datepicker.formatDate("mm/dd/yy",date);
			$("#datepicker").val(formatted);
			
			//$("#taskTbl").empty();
			
			var dt = $.datepicker.formatDate("yy-mm-dd", date);
			//fetching user tasks
			var userID="<%= session.getAttribute("userID") %>";
			//fetching user tasks
			findTasks(userID,dt);
			// hiding add task section in case it was visible
			$(".addDivSection").hide();
			// clearing out form in case of previous entries
			//document.getElementById("newTask").reset();		// $("#newTask").reset() not working for this
			$("#newTask")[0].reset();
			// enabling add button in case it was disabled
			$("#addTask").removeClass("tskButtonDisabled").addClass("tskButton");
			$("#addTask").prop("disabled", false);
		}); 
			
		
		// function to find tasks and dynamically add to table and display tasks for a given date
		function findTasks(userID,date){
			$.ajax({
			     url: "${pageContext.request.contextPath}/taskHomeServlet",
			     type: "GET",
			     //dataType: "json",
			     data: {
			       userID: userID,
			       taskDate: date, 
			       job: "fetch"
			     },
			     error: function () {
			    	 console.log("error occured!!!");
			     },
			     success: function (responseData) {
				     //debugger;
			    	 if(responseData!=null){
					    $("#taskTbl").empty();
			    		 var trHTML = "";
						 $.each(responseData,function(key,value){
						   	trHTML += 
				              "<tr id="+value["task_id"]+"><td>" + value["task_name"] + 
				              "</td><td>" + value["start_time"] + 
				              "</td><td>" + value["end_time"] + 
				              "</td><td>" + (value["task_status"]!=undefined?value["task_status"]:"") + 
				              "</td></tr>";  
						   	//$("#taskTbl").append(trHTML);  // same as doing after loop
						 });
						 $("#taskTbl").append(trHTML);
				     }
			     }
			});
		}
		
		// function to delete task
		function deleteTask(taskID,userID){
			$.ajax({
			     url: "${pageContext.request.contextPath}/taskHomeServlet",
			     type: "POST",
			     data: {
			       taskID: taskID,
			       userID: userID,
			       job: "delete"
			     },
			     error: function (err) {
			    	 console.log("ajax call error " + err);
			     },
			     success: function(responseEx) {
			    	 //alert(responseEx);
			    	 
			    	 if (responseEx == "false") {	// on unsuccessful database operation
			    		 alert("Database error! Task could not be deleted. Please try again.");
			    	 }
			    	 else {		// succesful delete
			    		 alert("One less thing to do!");
			    		 //$("#"+taskID).remove();
			    	 }
			    	 console.log("success for ajax call: check database for deletion." + responseEx);			    	 
			     }
			});
		}
		
		// function to add new task
		function addTask(userID, taskName, taskDate, startTime, endTime, taskStatus, taskPriority){
			$.ajax({
				url: "${pageContext.request.contextPath}/taskHomeServlet",
			     type: "POST",
			     data: {
			       userID: userID,
			       taskName: taskName,
			       taskDate: taskDate, 
			       startTime: startTime,
			       endTime: endTime,
			       taskStatus: taskStatus,
			       taskPriority: taskPriority,
			       job: "add"
			     },
			     error: function(err) {
			    	 console.log("ajax call error" + err);
			    	 alert("There was an error with the Ajax call. Please try again.");
			     },
			     success: function(responseEx) {
			    	 if (responseEx == "false") {	// on unsuccessful database operation
			    		 alert("Database error! Task could not be added. Please try again.");
			    	 }
			    	 else {		// succesfully added new task to database
			    		 alert("Task has been added succesfully!");
			    	 }
			    	 console.log("success for ajax call: check database for successful insert. Ajax response is: " + responseEx);	
			     }
			});
		}
		
		// function to edit (update) task details
		function editTask(taskID, taskName, startTime, endTime, taskStatus, taskPriority) {		
			$.ajax({
				url: "${pageContext.request.contextPath}/taskHomeServlet",
			     type: "POST",
			     data: {
			       taskID: taskID,
			       taskName: taskName, 
			       startTime: startTime,
			       endTime: endTime,
			       taskStatus: taskStatus,
			       taskPriority: taskPriority,
			       job: "edit"
			     },
			     error: function(err) {
			    	 console.log("ajax call error" + err);
			    	 alert("There was an error with the Ajax call. Please try again.");
			     },
			     success: function(responseEx) {
			    	 if (responseEx == "false") {	// on unsuccessful database operation
			    		 alert("Database error! Task could not be added. Please try again.");
			    	 }
			    	 else {		// succesfully added new task to database
			    		 alert("Task has been updated succesfully!");
			    	 }
			    	 console.log("success for ajax call: check database for successful update. Ajax response is: " + responseEx);	
			     }
			});
		}
		
		// function to find task by task_id and bind its information onto the "newTask" form
		function fillForm(taskID){
			$.ajax({
				url: "${pageContext.request.contextPath}/taskHomeServlet",
			    type: "GET",
			    data: {
			    	taskID: taskID,
			    	job: "fetchTaskByID"
			    },
			    error: function () {
			    	console.log("error occurred!!!");
			    },
			    success: function (responseData) {
			    	$("#newTask")[0].reset();
			    	$(":input").removeAttr("placeholder");
			    	$("#taskName").val(responseData["task_name"]);
			    	$("#startTime").val(responseData["start_time"]);
			    	$("#endTime").val(responseData["end_time"]);
			    	$("#taskStatus").val(responseData["task_status"]);
			    	$("#taskPriority").val(responseData["task_priority"]);
			    	//$("#saveTask").val("Update Task");
			    	console.log("Successful ajax call. Check form for correct details.");
			    }
			});
		}
		
		
		
	</script>
</html>