package com.planeasy;

public class RegistrationBean {
	private int user_id, verification_attempts;
	private String firstName, lastName, email, password, phone, dob, studentStatus, verification_hash;
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getDob() {
		return dob;
	}
	
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getStudentStatus() {
		return studentStatus;
	}
	
	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getVerification_attempts() {
		return verification_attempts;
	}

	public void setVerification_attempts(int verification_attempts) {
		this.verification_attempts = verification_attempts;
	}

	public String getVerification_hash() {
		return verification_hash;
	}

	public void setVerification_hash(String verification_hash) {
		this.verification_hash = verification_hash;
	}
}
