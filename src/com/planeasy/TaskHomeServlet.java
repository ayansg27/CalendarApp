package com.planeasy;
//import java.io.*;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class TaskHomeServlet
 */
//@WebServlet("/TaskHomeServlet")
public class TaskHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job = request.getParameter("job");
		// for displaying tasks dynamically on the home page
		if (job.equals("fetch")) {
			String userID = request.getParameter("userID");
			String taskDate = request.getParameter("taskDate");
			// making a database call to retrieve all tasks for given date using taskDAO
			ArrayList<TaskBean> task_list = TaskDAO.returnTasklist(userID, taskDate);
			// converting ArrayList to JsonArray
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(task_list, new TypeToken<List<TaskBean>>() {}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			// returing the JsonArray
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}	
		// for returning task details by task_id
		if (job.equals("fetchTaskByID")) {
			String taskID = request.getParameter("taskID");
			// retrieving task details as a TaskBean object
			TaskBean taskDetails= TaskDAO.returnTaskByID(taskID);
			// converting TaskBean to JsonElement
			Gson gson = new Gson();
			JsonElement jsonElement = gson.toJsonTree(taskDetails, new TypeToken<TaskBean>() {}.getType());
			// returning the JsonElement
			response.setContentType("application/json");
			response.getWriter().print(jsonElement);			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job = request.getParameter("job");
		
		// for deleting selected task
		if (job.equals("delete")) {
			String taskID = request.getParameter("taskID");
			String userID = request.getParameter("userID");
			// making a database call through TaskDAO to delete this entry
			boolean deleteRow = TaskDAO.deleteTask(taskID, userID);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(deleteRow);
		}
		
		// for adding new task
		if (job.equals("add")) {
			String userID = request.getParameter("userID");
			String taskName = request.getParameter("taskName");
			String taskDate = request.getParameter("taskDate"); 
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String taskStatus = request.getParameter("taskStatus");
			String taskPriority = request.getParameter("taskPriority");
			// making a database call through TaskDAO to add this entry
			boolean addNewTask = TaskDAO.addTask(userID, taskName, taskDate, startTime, endTime, taskStatus, taskPriority);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(addNewTask);
		}
		
		// for editing selected task
		if (job.equals("edit")) {
			String taskID = request.getParameter("taskID");
			String taskName = request.getParameter("taskName");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String taskStatus = request.getParameter("taskStatus");
			String taskPriority = request.getParameter("taskPriority");
			// making database call through TaskDAO to update this record
			boolean editRow = TaskDAO.editTask(taskID, taskName, startTime, endTime, taskStatus, taskPriority);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(editRow);
		}
	
		
	}
}
