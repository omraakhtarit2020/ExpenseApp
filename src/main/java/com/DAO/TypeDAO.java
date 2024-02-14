package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Type;

public class TypeDAO {

	private Connection conn;

	public TypeDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addType(Type ty) {
		boolean f = false;

		try {

			String sql = "insert into type(typeDesc) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ty.getTypeDesc());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Type> getAllType() {
		List<Type> list = new ArrayList<>();
		Type ty = null;

		try {

			String sql = "select * from type";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ty = new Type();

				ty.setTypeDesc(rs.getString(1));

				list.add(ty);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
