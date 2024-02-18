package com.entity;

public class goal_entity {
	String principal, year;
	int userId;
	
	
	
	public goal_entity(String principal, String year, int userId) {
		super();
		this.principal = principal;
		this.year = year;
		this.userId= userId;
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
	
	public int getUserId() {
		return userId;
	}
	public int setUserId() {
		return userId;
	}
	@Override
	public String toString() {
		return "goal_entity [principal=" + principal + ", year=" + year + ", userId=" + userId + "]";
	}
	
	
}
