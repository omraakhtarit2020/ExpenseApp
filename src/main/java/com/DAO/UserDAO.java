package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(User user) {
		boolean f = false;

		try {

			String sql = "insert into user(fname,lname,email,phnno,mpin,jobtype) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFname());
			ps.setString(2, user.getLname());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPhnno());
			ps.setInt(5, user.getMpin());
			ps.setString(6, user.getJobtype());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<User> getAllUser() {
		List<User> list = new ArrayList<>();
		User user = null;

		try {

			String sql = "select * from user";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();

				user.setFname(rs.getString(1));
				user.setLname(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhnno(rs.getString(4));
				user.setMpin(rs.getInt(5));
				user.setJobtype(rs.getString(6));

				list.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public User getUserById(int pin) {
		User user = null;
		try {
			String sql = "SELECT * FROM user WHERE mpin = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pin); // Set the pin value as a parameter

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getString("fname"), rs.getString("lname"), rs.getString("email"),
						rs.getString("phnno"), rs.getString("jobtype"), rs.getInt("mpin"));
				user.setId(rs.getInt("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public int getUserIdByEmail(String email) {
		int id = -1;
		try {
			if (email != null && !email.isEmpty()) { // Check if email is not null or empty
				String sql = "SELECT id FROM user WHERE email = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					id = rs.getInt(1); // Retrieve the ID value directly using the column index 1
				}
			} else {
				System.err.println("Email parameter is null or empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

}
