package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Borrow;

public class BorrowDAO {

	private Connection conn;

	public BorrowDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBorrow(Borrow borrow) {
		boolean f = false;
		System.out.println(borrow.toString());

		try {

			String sql = "insert into borrow(`to`,purpose,amt,borrowdate,user_id,followup) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, borrow.getTo());
			ps.setString(2, borrow.getPurpose());
			ps.setLong(3, borrow.getAmt());
			ps.setDate(4, borrow.getDate());
			ps.setInt(5, borrow.getUser_id());
			ps.setString(6, borrow.getFollowup());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Borrow> getBorrowById(int user_id) {
		List<Borrow> list = new ArrayList<>();
		Borrow borrow = null;

		try {

			String sql = "select * from borrow where user_id = ? order by borrow_id desc limit 5";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				borrow = new Borrow();

				borrow.setTo(rs.getString(1));
				borrow.setPurpose(rs.getString(2));
				borrow.setAmt(rs.getLong(3));
				borrow.setDate(rs.getDate(4));
				borrow.setBorrow_id(rs.getInt(5));
				borrow.setFollowup(rs.getString(7));
				list.add(borrow);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteBorrow(int id) {
		boolean f = false;
		try {
			String sql = "delete from borrow where borrow_id=?";
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

	public boolean updateBorrow(Borrow b) {
		boolean f = false;

		try {
			String sql = "update borrow set `to`=?,purpose=?,amt=?,borrowdate=? where borrow_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getTo());
			ps.setString(2, b.getPurpose());
			ps.setLong(3, b.getAmt());
			ps.setDate(4, b.getDate());
			ps.setInt(5, b.getBorrow_id());
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
