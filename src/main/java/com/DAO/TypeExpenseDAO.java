package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Type;
import com.entity.TypeExpense;

public class TypeExpenseDAO {

	private Connection conn;

	public TypeExpenseDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addType(Type ty) {
		boolean f = false;

		try {

			String sql = "insert into typeexpense(typeDesc) values(?)";
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

	public List<TypeExpense> getAllType() {
		List<TypeExpense> list = new ArrayList<>();
		TypeExpense ty = null;

		try {

			String sql = "select * from typeexpense";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ty = new TypeExpense();

				ty.setTypeDesc(rs.getString(1));

				list.add(ty);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
