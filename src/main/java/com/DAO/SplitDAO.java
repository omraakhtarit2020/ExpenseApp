package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.entity.Split;

public class SplitDAO {
	private Connection conn;

	public SplitDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public int addSplit(Split s) {
		int generatedGroupId = -1;

		try {
			String sql = "INSERT INTO split(grpname, people, amt, names, user_id, date) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, s.getGrpname());
			ps.setInt(2, s.getGrpId());
			ps.setInt(3, s.getPeople());
			ps.setDouble(4, s.getAmt());
			String namesString = String.join(",", s.getNames());
			ps.setString(5, namesString);
			ps.setInt(6, s.getUser_id());
			ps.setDate(7, s.getDate());
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected == 1) {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					generatedGroupId = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return generatedGroupId;
	}

	public List<Split> getAllSplitById(int user_id) {
		List<Split> list = new ArrayList<>();
		Split sp = null;

		try {
			String sql = "SELECT * FROM split WHERE user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new Split();

				sp.setGrpname(rs.getString("grpname"));
				sp.setPeople(rs.getInt("people"));
				sp.setAmt(rs.getDouble("amt"));
				String namesString = rs.getString("names");
				List<String> namesList = Arrays.asList(namesString.split(","));
				sp.setNames(namesList);
				sp.setDate(rs.getDate("date"));
				sp.setGrpId(rs.getInt("grpId"));
				sp.setStatus(rs.getString("status"));
				list.add(sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Split getSplitByGroupId(int grp_id) {
		System.out.println("get split by group id" + grp_id);
		Split sp = null;

		try {
			String sql = "SELECT * FROM split WHERE grpId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, grp_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new Split();

				sp.setGrpname(rs.getString("grpname"));
				sp.setPeople(rs.getInt("people"));
				sp.setAmt(rs.getDouble("amt"));
				String namesString = rs.getString("names");
				List<String> namesList = Arrays.asList(namesString.split(","));
				sp.setNames(namesList);
				sp.setDate(rs.getDate("date"));
				sp.setStatus(rs.getString("status"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sp;
	}

	public void updateStatus(int grpId, String status) throws SQLException {
		System.out.println(grpId + "checking " + status);
		String sql = "UPDATE split SET status = ? WHERE grpId = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, status);
		ps.setInt(2, grpId);
		ps.executeUpdate();
	}

	public String getStatus(int grpId) throws SQLException {
		String sql = "SELECT status FROM split WHERE grpId = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, grpId);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			System.out.println("Inside get status" + rs.getString("status"));
			return rs.getString("status");
		}
		return null;
	}
}
