package com.entity;

import java.sql.Date;

public class goal_entity {
	String principal, year;
	int goalId,userId;
	Date date;
	
	
	
	public goal_entity(String principal, String year, int userId , Date date) {
		super();
		this.principal = principal;
		this.year = year;
		this.userId= userId;
		this.date= date;
		}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public void setGoalId(int goalId) {
		this.goalId = goalId;
	}
	
	public int getUserId() {
		return userId;
	}
	public int setUserId() {
		return userId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "goal_entity [principal=" + principal + ", year=" + year + ", goalId=" + goalId + " , userId=" + userId + ", date=" + date + "]";
	}
	
	
}
