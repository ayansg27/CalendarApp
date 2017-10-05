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
		    background-color: #94DBFA;
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
			color: blue;
			background: #F9F579;
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
			width:35.3em;
		}
		.task tbody {
	        height: 15em;
	        display: block;
	        overflow-y:auto;
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
		    width: calc( 100% - 1.15em ); 
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
			<div class="t">
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
		</div>		
	</body>
	<footer>
		<div class="footersLink">
			<a href="about.jsp" style="color:white">About</a> |
			<a href="license.jsp" style="color:white">License</a> |
			<a href="contact.jsp" style="color:white">Contact</a>
		</div>
	</footer>
<!-- 	<script src="https://code.jquery.com/jquery-3.2.0.js"></script> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		$( function() {
		    $( "#datepicker" ).datepicker({
		      changeMonth: true,
		      changeYear: true,
		      showAnim: "fold"
		    });
		});
		$(document).on('click', '#taskTable tr', function () {
			var elemID=$(this).attxfr('id');
			$("#"+elemID).addClass('selected').siblings().removeClass("selected");
			$("#editTask").removeClass("tskButtonDisabled").addClass('tskButton');
			$('#editTask').prop("disabled", false);
			$("#deleteTask").removeClass("tskButtonDisabled").addClass('tskButton');
			$('#deleteTask').prop("disabled", false);
		}); 
		$(document).click(function(event) {
			if(!$(event.target).closest('#taskTbl').length){
				$("#taskTbl").children().removeClass("selected");
				$("#editTask").removeClass("tskButton").addClass('tskButtonDisabled');
				$('#editTask').prop("disabled", true);
				$("#deleteTask").removeClass("tskButton").addClass('tskButtonDisabled');
				$('#deleteTask').prop("disabled", true);
			}
		});
		$(document).ready(function() {
			//setting current date
			var d = new Date();
			var month = d.getMonth()+1;
			var day = d.getDate();
			var output = (month<10 ? '0' : '')+month+'/'+(day<10 ? '0' : '')+day+'/'+d.getFullYear();
			$("#datepicker").val(output);
			var dt = $.datepicker.formatDate('yy-mm-dd', d);
			
			//fetching user
			var user='<%= session.getAttribute("userID") %>';
			//fetching user tasks
			findTasks(user,dt);
		});
		$('#decDt').on('click',function(){
			date = new Date(Date.parse($('#datepicker').val()));
			date.setDate(date.getDate() - 1);
			var formatted = $.datepicker.formatDate("mm/dd/yy",date);
			$('#datepicker').val(formatted);
			
			$("#taskTbl").empty();
			
			var dt = $.datepicker.formatDate('yy-mm-dd', date);
			//fetching user 
			var user='<%= session.getAttribute("userID") %>';
			//fetching user 
			findTasks(user,dt);
		});
		$('#incDt').on('click',function(){
			date = new Date(Date.parse($('#datepicker').val()));
			date.setDate(date.getDate() + 1);
			var formatted = $.datepicker.formatDate("mm/dd/yy",date);
			$('#datepicker').val(formatted);
			
			$("#taskTbl").empty();
			
			var dt = $.datepicker.formatDate('yy-mm-dd', date);
			//fetching user tasks
			var user='<%= session.getAttribute("userID") %>';
			//fetching user tasks
			findTasks(user,dt);
		}); 
		function findTasks(userID,date){
			$.ajax({
			     url: "${pageContext.request.contextPath}/taskHomeServlet",
			     type: "GET",
			     //dataType: "json",
			     data: {
			       userID: userID,
			       taskDate: date
			     },
			     error: function () {
			    	 console.log("error occured!!!");
			     },
			     success: function (responseData) {
				     //debugger;
			    	 if(responseData!=null){
					    //$("#taskTbl").find("tr:get(0)").remove();
			    		 var trHTML = '';
						 $.each(responseData,function(key,value){
						   	trHTML += 
				              '<tr id='+value['task_id']+'><td>' + value['task_name'] + 
				              '</td><td>' + value['start_time'] + 
				              '</td><td>' + value['end_time'] + 
				              '</td><td>' + (value['task_status']!=undefined?value['task_status']:'') + 
				              '</td></tr>';  
						   	//$('#taskTbl').append(trHTML);
						 });
						 $('#taskTbl').append(trHTML);
				     }
			     }
			});
		}
	</script>
</html>