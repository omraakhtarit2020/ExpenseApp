package com.DAO;

import java.sql.*;

public class goalDAO {
	Connection conn;
	
	public goalDAO(Connection conn){
		this.conn = conn;
	}
	
	public boolean insertGoal(com.entity.goal_entity goal_entity) {
			
		boolean f=false;
		try {
			
			
			String q="insert into goal(principal, year, userId, date ) values(?,?,?,?)";
			PreparedStatement p=this.conn.prepareStatement(q);
			//set values
			p.setString(1, goal_entity.getPrincipal());
			p.setString(2, goal_entity.getYear());
			p.setInt(3, goal_entity.getUserId());
			p.setDate(4,goal_entity.getDate());
			int x=p.executeUpdate();
			if(x==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
}

