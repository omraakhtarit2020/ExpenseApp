package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User_expense;

public class ExpenseDAO {

	private Connection conn;

	public ExpenseDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addexpense(User_expense exp) {
		boolean f = false;

		try {

			String sql = "insert into expe(type,expense,user_id,date) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, exp.getType());
			ps.setLong(2, exp.getExpense());
			ps.setInt(3, exp.getUser_id());
			ps.setDate(4, exp.getDate());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<User_expense> getAllExpense() {
		List<User_expense> list = new ArrayList<>();
		User_expense ex = null;

		try {

			String sql = "select * from expe";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ex = new User_expense();

				ex.setType(rs.getString(1));
				ex.setExpense(rs.getLong(2));

				list.add(ex);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public long totalExpense(int user_id) {
		long sum = 0;

		try {
			String sql = "SELECT SUM(expense) FROM expe where user_id=?";
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

	public List<User_expense> getExpenseById(int user_id) {
		List<User_expense> list = new ArrayList<>();
		User_expense ex = null;

		try {

			String sql = "select * from expe where user_id = ? order by exp_id desc limit 5";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ex = new User_expense();

				ex.setType(rs.getString(1));
				ex.setExpense(rs.getLong(2));
				ex.setExp_id(rs.getInt(3));
				ex.setDate(rs.getDate(5));

				list.add(ex);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<User_expense> getAllExpenseById(int user_id) {
		List<User_expense> list = new ArrayList<>();
		User_expense ex = null;

		try {

			String sql = "select * from expe where user_id = ? order by exp_id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ex = new User_expense();

				ex.setType(rs.getString(1));
				ex.setExpense(rs.getLong(2));
				ex.setDate(rs.getDate(5));

				list.add(ex);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteExpense(int id) {
		boolean f = false;
		try {
			String sql = "delete from expe where exp_id=?";
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

	public boolean updateExpense(User_expense ex) {
		boolean f = false;

		try {
			String sql = "update expe set type=?,expense=? where exp_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ex.getType());
			ps.setLong(2, ex.getExpense());
			ps.setInt(3, ex.getExp_id());
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
