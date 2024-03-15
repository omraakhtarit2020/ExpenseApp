package com.entity;

import java.sql.Date;

public class Lend {
	String to, purpose, followup;
	int lend_id;
	int user_id;
	Date date;
	long amt;

	public Lend() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Lend(String to, String purpose, long amt, Date date, int userId, String followup, int lend_id) {
		this.to = to;
		this.purpose = purpose;
		this.followup = followup;
		this.date = date;
		this.amt = amt;
		this.user_id = userId;
		this.lend_id = lend_id;
	}

	public Lend(String to, String purpose, long amt, Date date, int userId, int lend_id) {
		this.to = to;
		this.purpose = purpose;
		this.date = date;
		this.amt = amt;
		this.user_id = userId;
		this.lend_id = lend_id;
	}

	public Lend(String to2, String purpose2, long amt2, Date date2, int userId, String followup2) {
		// TODO Auto-generated constructor stub
		this.to = to2;
		this.purpose = purpose2;
		this.date = date2;
		this.amt = amt2;
		this.user_id = userId;
		this.followup = followup2;
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

	public int getLend_id() {
		return lend_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setLend_id(int lend_id) {
		this.lend_id = lend_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Lend [to=" + to + ", purpose=" + purpose + ", followup=" + followup + ", lend_id=" + lend_id
				+ ", user_id=" + user_id + ", date=" + date + ", amt=" + amt + "]";
	}

}
