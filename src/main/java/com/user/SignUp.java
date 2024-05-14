package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.db.DBConnection;
import com.entity.User;

@WebServlet("/signup")
public class SignUp extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String email = req.getParameter("email");
			String phnno = req.getParameter("phnno");
			int mpin = Integer.parseInt(req.getParameter("mpin"));
			String jobtype = req.getParameter("jobtype");

			// Check if MPIN already exists in the database
            if (Checkmpin(mpin)) {
                HttpSession session = req.getSession();
                req.setAttribute("errorMsg", "MPIN already exists. Please choose a different one.");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);
                return;
            }
			
			User user = new User(fname, lname, email, phnno, jobtype, mpin);

			UserDAO dao = new UserDAO(DBConnection.getConn());
			HttpSession session = req.getSession();
			if (dao.addUser(user)) {
				session.setAttribute("succMsg", "Added succesfully");
				resp.sendRedirect("login.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occured");
				resp.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		// Method to check if MPIN already exists in the database
	    public boolean Checkmpin(int mpin) throws SQLException {
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            conn = DBConnection.getConn();
	            String query = "SELECT COUNT(*) FROM user WHERE mpin = ?";
	            ps = conn.prepareStatement(query);
	            ps.setInt(1, mpin);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                int count = rs.getInt(1);
	                return count > 0; // Returns true if MPIN exists, false otherwise
	            }
	            return false;
	        } finally {
	            // Close resources
	            if (rs != null) {
	                rs.close();
	            }
	            if (ps != null) {
	                ps.close();
	            }
	            if (conn != null) {
	                conn.close();
	            }
	        }
	    }
	}
