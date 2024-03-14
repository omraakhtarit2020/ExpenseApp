package com.entity;

import java.sql.Date;

public class User_income {

	String type;
	long income;
	int inco_id;
	int user_id;
	Date date;

	public User_income() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User_income(String type, long income) {
		super();
		this.type = type;
		this.income = income;
	}

	public User_income(String type, long income, int user_id, Date date) {
		super();
		this.type = type;
		this.income = income;
		this.user_id = user_id;
		this.date = date;
	}

	public User_income(String type2, long income2, int inco_id2, int userId) {
		// TODO Auto-generated constructor stub
		this.type = type2;
		this.income = income2;
		this.inco_id = inco_id2;
		this.user_id = user_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getIncome() {
		return income;
	}

	public void setIncome(long income) {
		this.income = income;
	}

	public int getInco_id() {
		return inco_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setInco_id(int inco_id) {
		this.inco_id = inco_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
