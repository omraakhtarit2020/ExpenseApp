package com.entity;

import java.sql.Date;

public class Borrow {
	String to, purpose, followup;
	int borrow_id;
	int user_id;
	Date date;
	long amt;

	public Borrow() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Borrow(String to, String purpose, long amt, Date date, int userId, String followup) {
		this.to = to;
		this.purpose = purpose;
		this.followup = followup;
		this.date = date;
		this.amt = amt;
		this.user_id = userId;
	}

	public Borrow(String to, String purpose, long amt, Date date, int userId, String followup, int borrow_id) {
		this.to = to;
		this.purpose = purpose;
		this.followup = followup;
		this.date = date;
		this.amt = amt;
		this.user_id = userId;
		this.borrow_id = borrow_id;
	}

	public String getTo() {
		return to;
	}

	public String getPurpose() {
		return purpose;
	}

	public String getFollowup() {
		return followup;
	}

	public Date getDate() {
		return date;
	}

	public long getAmt() {
		return amt;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public void setFollowup(String followup) {
		this.followup = followup;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setAmt(long amt) {
		this.amt = amt;
	}

	public int getBorrow_id() {
		return borrow_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setBorrow_id(int borrow_id) {
		this.borrow_id = borrow_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Borrow [to=" + to + ", purpose=" + purpose + ", followup=" + followup + ", borrow_id=" + borrow_id
				+ ", user_id=" + user_id + ", date=" + date + ", amt=" + amt + "]";
	}

}
