package com.entity;

public class User {

	String fname, lname, email, phnno, jobtype;
	int mpin, id;

	public User() {
		super();
	}

	public User(String fname, String lname, String email, String phnno, String jobtype, int mpin) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phnno = phnno;
		this.jobtype = jobtype;
		this.mpin = mpin;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhnno() {
		return phnno;
	}

	public void setPhnno(String phnno) {
		this.phnno = phnno;
	}

	public String getJobtype() {
		return jobtype;
	}

	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}

	public int getMpin() {
		return mpin;
	}

	public void setMpin(int mpin) {
		this.mpin = mpin;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "User [fname=" + fname + ", lname=" + lname + ", email=" + email + ", phnno=" + phnno + ", jobtype="
				+ jobtype + ", mpin=" + mpin + ", id=" + id + "]";
	}

	public int getId() {
		return id;
	}
}
