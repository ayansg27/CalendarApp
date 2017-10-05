package com.planeasy;

import java.util.*;
import java.sql.*;

import org.apache.log4j.Logger;

public class TaskDAO {
	private static final Logger LOGGER = Logger.getLogger(TaskDAO.class.getName());
	
	// method to fetch all tasks for a particular date for a given user 
	public static ArrayList<TaskBean> returnTasklist(String userID, String taskDate) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		TaskBean bean = null; 
		ArrayList<TaskBean> task_list = null; 
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT task_id, user_id, task_name, task_date, "
					+ "start_time, end_time, task_status, task_priority" 
					+ " FROM tasks WHERE user_id = ? AND task_date = ?");
			statement.setString(1, userID);
			statement.setString(2, taskDate);
			result = statement.executeQuery();
			
			if (result != null) {
				task_list = new ArrayList<TaskBean>();
				while (result.next()) {
					bean = new TaskBean();
					bean.setTask_id(result.getString(1));
					bean.setUser_id(result.getString(2));
					bean.setTask_name(result.getString(3));
					bean.setTask_date(result.getString(4));
					bean.setStart_time(result.getString(5));
					bean.setEnd_time(result.getString(6));
					bean.setTask_status(result.getString(7));
					bean.setTask_priority(result.getString(8));
					
					task_list.add(bean);
				}
			}			
			if (task_list != null) {
				ArrayListSorter listSorter = new ArrayListSorter(task_list);
				//ArrayList<TaskBean> sortedList = listSorter.getSortedListByStartTime();
				task_list = listSorter.getSortedListByStartTime();
				//task_list = sortedList;
			}
			
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("An Exception has occurred! " + e);
		} 		
		return task_list;
	}
	
	// method to delete a particular task (that is selected from home page)
	public static boolean deleteTask(String taskID, String userID) {
		Connection connection = null;
		PreparedStatement statement = null;
		int result = -1;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("DELETE FROM tasks WHERE task_id=? "
					+ "AND user_id=?");
			statement.setString(1, taskID);
			statement.setString(2, userID);
			result = statement.executeUpdate();
			
		} catch (Exception e) {				// catch (SQLException ex) { 
			System.out.println("An Exception has occurred! " + e);
			//e.printStackTrace();			
		} 		
		if (result != 1) {
			return false;
		}
		else {
			return true;
		}
	}
	
	
	// method to add a task entered by the user
	public static boolean addTask(String userID, String taskName, String taskDate, String startTime, 
			String endTime, String taskStatus, String taskPriority) {
		Connection connection = null;
		PreparedStatement statement = null;
		int result = -1;
		// setting status to null in case nothing was selected
		if (taskStatus.equals("Task status")) {
			taskStatus = null;
		}
		// setting priority to null in case nothing was selected
		if (taskPriority.equals("Task priority")) {
			taskPriority = null;
		}
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("INSERT INTO "
					+ "tasks(user_id, task_name, task_date, start_time, end_time, task_status, task_priority) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?)");
			statement.setString(1, userID);
			statement.setString(2, taskName);
			statement.setString(3, taskDate);
			statement.setString(4, startTime);
			statement.setString(5, endTime);
			statement.setString(6, taskStatus);
			statement.setString(7, taskPriority);
			
			result = statement.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("An Exception has occurred! " + e);
		}
		
		if (result != 1) {
			return false;
		}
		else {
			return true;
		}
	}
	
	
	// return the task details by task_id
	public static TaskBean returnTaskByID(String taskID) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		TaskBean task_details = new TaskBean(); 
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT task_id, user_id, task_name, task_date, "
						+ "start_time, end_time, task_status, task_priority" 
						+ " FROM tasks WHERE task_id = ?");
			statement.setString(1, taskID);
			result = statement.executeQuery();
				
			if (result != null) {
				while (result.next()) {
					task_details = new TaskBean();	
					task_details.setTask_id(result.getString(1));
					task_details.setUser_id(result.getString(2));
					task_details.setTask_name(result.getString(3));
					task_details.setTask_date(result.getString(4));
					task_details.setStart_time(result.getString(5));
					task_details.setEnd_time(result.getString(6));
					task_details.setTask_status(result.getString(7));
					task_details.setTask_priority(result.getString(8));
					/*
					if (result.getString(7) == null) {
						task_details.setTask_status("Task status");
					}
					else {
						task_details.setTask_status(result.getString(7));
					}
					if (result.getString(8) == null) {
						task_details.setTask_priority("Task priority");
					}
					else {
						task_details.setTask_priority(result.getString(8));
					}				
					*/	
				}
			}			
			
			} catch (Exception e) {				// catch (SQLException ex) { 
				System.out.println("An Exception has occurred! " + e);
			} 		
			return task_details;
		}

	public static boolean editTask(String taskID, String taskName, String startTime, 
			String endTime, String taskStatus, String taskPriority) {
		Connection connection = null;
		PreparedStatement statement = null;
		int result = -1;
		
		// setting status to null in case nothing was selected
		if (taskStatus.equals("Task status")) {
				taskStatus = null;
			}
		// setting priority to null in case nothing was selected
		if (taskPriority.equals("Task priority")) {
					taskPriority = null;
			}
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE tasks "
					+ "SET task_name = ?, start_time = ?, end_time = ?, task_status = ?, task_priority = ? "
					+ "WHERE task_id = ?");
			
			statement.setString(1, taskName);
			statement.setString(2, startTime);
			statement.setString(3, endTime);
			statement.setString(4, taskStatus);
			statement.setString(5, taskPriority);
			statement.setString(6, taskID);
			
			result = statement.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("An Exception has occurred! " + e);
		}
		
		if (result != 1) {
			return false;
		}
		else {
			return true;
		}
	}
	
	
	
	
	// method to edit the selected task

}
