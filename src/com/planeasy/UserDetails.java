package com.planeasy;

public class UserDetails {
	private int user_id;
	private int verification_attempts;
	private String email, password, firstName, lastName, phone, dob, studentStatus, verification_hash, status, created_time; 

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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getVerification_hash() {
		return verification_hash;
	}

	public void setVerification_hash(String verification_hash) {
		this.verification_hash = verification_hash;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCreated_time() {
		return created_time;
	}

	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}
	
	@Override
    public String toString()
    {
        return "UserDetails [USER_ID = " + user_id + ", EMAIL = " + email + ", FIRST_NAME = "
     + firstName + ", LAST_NAME = " + lastName + ", EMAIL_VERIFICATION_HASH = " + 
     verification_hash + ", EMAIL_VERIFICATION_ATTEMPTS = " + verification_attempts 
        		+ ", PASSWORD = " + password + ", CREATED_TIME = " + created_time +"]";
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

}
