package com.entity;

import java.sql.Date;

public class User_expense {

	String type;
	long expense;
	int exp_id;
	int user_id;
	Date date;

	// did not set the value so null was the error

	public User_expense(String type, long expense, int user_id, Date date) {
		super();
		this.type = type;
		this.expense = expense;
		this.user_id = user_id;
		this.date = date;
	}

	public User_expense(String type, long expense) {
		super();
		this.type = type;
		this.expense = expense;
	}

	public User_expense() {
		// TODO Auto-generated constructor stub
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getExpense() {
		return expense;
	}

	public void setExpense(long expense) {
		this.expense = expense;
	}

	public void setExp_id(int exp_id) {
		this.exp_id = exp_id;
	}

	public int getExp_id() {
		return exp_id;
	}

	public int getUser_id() {
		return user_id;
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
