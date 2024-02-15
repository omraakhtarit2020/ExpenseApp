package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Lend;

public class LendDAO {

	private Connection conn;

	public LendDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addlend(Lend lend) {
		boolean f = false;
		System.out.println(lend.toString());

		try {

			String sql = "insert into lend(`to`,purpose,amt,lenddate,user_id,followup) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, lend.getTo());
			ps.setString(2, lend.getPurpose());
			ps.setLong(3, lend.getAmt());
			ps.setDate(4, lend.getDate());
			ps.setInt(5, lend.getUser_id());
			ps.setString(6, lend.getFollowup());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Lend> getLendById(int user_id) {
		List<Lend> list = new ArrayList<>();
		Lend lend = null;

		try {

			String sql = "select * from lend where user_id = ? order by lend_id desc limit 5";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lend = new Lend();

				lend.setTo(rs.getString(1));
				lend.setPurpose(rs.getString(2));
				lend.setAmt(rs.getLong(3));
				lend.setDate(rs.getDate(4));
				lend.setFollowup(rs.getString(7));
				list.add(lend);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
