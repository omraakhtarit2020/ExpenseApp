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
			ps.setInt(2, s.getPeople());
			ps.setDouble(3, s.getAmt());
			String namesString = String.join(",", s.getNames());
			ps.setString(4, namesString);
			ps.setInt(5, s.getUser_id());
			ps.setDate(6, s.getDate());
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

			String sql = "select * from split where user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new Split();

				sp.setGrpname(rs.getString(1));
				sp.setPeople(rs.getInt(2));
				sp.setAmt(rs.getDouble(3));
				String namesString = rs.getString("names");
				List<String> namesList = Arrays.asList(namesString.split(","));
				sp.setNames(namesList);
				sp.setDate(rs.getDate(6));
				sp.setGrpId(rs.getInt(7));
				list.add(sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Split getSplitByGroupId(int grp_id) {
		Split sp = null;

		try {

			String sql = "select * from split where grpId = ?";
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
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sp;
	}

}
