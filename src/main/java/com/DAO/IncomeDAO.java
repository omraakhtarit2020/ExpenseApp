package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User_income;

public class IncomeDAO {

	private Connection conn;

	public IncomeDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addincome(User_income inc) {
		boolean f = false;

		try {

			String sql = "insert into inco(type,income,user_id,date) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, inc.getType());
			ps.setLong(2, inc.getIncome());
			ps.setInt(3, inc.getUser_id());
			ps.setDate(4, inc.getDate());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<User_income> getAllIncome() {
		List<User_income> list = new ArrayList<>();
		User_income inc = null;

		try {

			String sql = "select * from inco";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				inc = new User_income();

				inc.setType(rs.getString(1));
				inc.setIncome(rs.getLong(2));

				list.add(inc);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public long totalIncome(int user_id) {
		long sum = 0;

		try {
			String sql = "SELECT SUM(income) FROM inco where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				sum = rs.getLong(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sum;

	}

	public List<User_income> getIncomeById(int user_id) {
		List<User_income> list = new ArrayList<>();
		User_income ex = null;

		try {

			String sql = "select * from inco where user_id = ? order by inco_id desc limit 5";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ex = new User_income();

				ex.setType(rs.getString(1));
				ex.setIncome(rs.getLong(2));
				ex.setInco_id(rs.getInt(3));
				ex.setDate(rs.getDate(5));

				list.add(ex);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<User_income> getAllIncomeById(int user_id) {
		List<User_income> list = new ArrayList<>();
		User_income ex = null;

		try {

			String sql = "select * from inco where user_id = ? order by inco_id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ex = new User_income();

				ex.setType(rs.getString(1));
				ex.setIncome(rs.getLong(2));
				ex.setDate(rs.getDate(5));

				list.add(ex);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteIncome(int id) {
		boolean f = false;
		try {
			String sql = "delete from inco where inco_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateIncome(User_income inc) {
		boolean f = false;

		try {
			String sql = "update inco set type=?,income=? where inco_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, inc.getType());
			ps.setLong(2, inc.getIncome());
			ps.setInt(3, inc.getInco_id());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
