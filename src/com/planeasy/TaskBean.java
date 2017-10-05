package com.planeasy;

public class TaskBean implements Comparable<TaskBean> {
	private String user_id, task_id, task_name, task_date, start_time, end_time, task_status, task_priority;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getTask_date() {
		return task_date;
	}

	public void setTask_date(String task_date) {
		this.task_date = task_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getTask_status() {
		return task_status;
	}

	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}

	public String getTask_priority() {
		return task_priority;
	}

	public void setTask_priority(String task_priority) {
		this.task_priority = task_priority;
	}

	@Override
	public int compareTo(TaskBean bean) {
		if (this.getStart_time().equals(bean.getStart_time()) && this.getEnd_time().equals(bean.getEnd_time())) {
			return this.getTask_name().compareTo(bean.getTask_name());
		}
		else if (this.getStart_time().equals(bean.getStart_time())) {
			return this.getEnd_time().compareTo(bean.getEnd_time());
		}			
		else {
			return this.getStart_time().compareTo(bean.getStart_time());
		}
	}
}
