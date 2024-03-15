package com.entity;

import java.util.List;

public class Split {

	private String grpname;
	private int grpId;
	private int people;
	private double amt;
	private List<String> names;
	private java.sql.Date date;
	private int user_id;

	public Split(String grpname, int people, double amt, List<String> names, java.sql.Date date, int user_id) {
		super();
		this.grpname = grpname;
		this.people = people;
		this.amt = amt;
		this.names = names;
		this.date = date;
		this.user_id = user_id;
	}

	public Split() {
		// TODO Auto-generated constructor stub
		super();
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getGrpId() {
		return grpId;
	}

	public void setGrpId(int grpId) {
		this.grpId = grpId;
	}

	public String getGrpname() {
		return grpname;
	}

	public int getPeople() {
		return people;
	}

	public double getAmt() {
		return amt;
	}

	public List<String> getNames() {
		return names;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setGrpname(String grpname) {
		this.grpname = grpname;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public void setAmt(double amt) {
		this.amt = amt;
	}

	public void setNames(List<String> names) {
		this.names = names;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Split [grpname=" + grpname + ", grpId=" + grpId + ", people=" + people + ", amt=" + amt + ", names="
				+ names + ", date=" + date + ", user_id=" + user_id + "]";
	}

}
