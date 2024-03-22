package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroupMembershipDAO {
	private Connection conn;

	public GroupMembershipDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public void addMemberToGroup(int userId, int groupId, String role) {
		try {
			String sql = "INSERT INTO group_membership (user_id, group_id, role) VALUES (?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, groupId);
			ps.setString(3, role);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			// Handle exceptions
		}
	}

	public List<Integer> getGroupIdsByUserAndRole(int user_id, String role) {
		List<Integer> list = new ArrayList<>();

		try {

			String sql = "select group_id from group_membership where user_id = ? AND role = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ps.setString(2, role);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int groupId = rs.getInt("group_id");
				list.add(groupId);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
