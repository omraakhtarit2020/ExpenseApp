package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	public boolean addSplit(Split s) {
		boolean f = false;

		try {

			String sql = "insert into split(grpname,people,amt,names,user_id,date) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getGrpname());
			ps.setInt(2, s.getPeople());
			ps.setDouble(3, s.getAmt());
			String namesString = String.join(",", s.getNames());
			ps.setString(4, namesString);
			ps.setInt(5, s.getUser_id());
			ps.setDate(6, s.getDate());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
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

}
