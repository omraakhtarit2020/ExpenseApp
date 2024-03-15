package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnection;

@WebServlet("/updateMpin")
public class updateMpin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateMpin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newMpin = request.getParameter("mpin");
        String confMpin = request.getParameter("confMpin");
        //RequestDispatcher dispatcher = null;

        if (newMpin != null && confMpin != null && newMpin.equals(confMpin)) {
            Connection con = null;
            try {
                con = DBConnection.getConn();
                String email = (String) session.getAttribute("email"); // Assuming you stored the email in session
                int userId = getUserIdByEmail(con, email); // Get user ID based on email
                if (userId != -1) { // User found
                    PreparedStatement ps = con.prepareStatement("update user set mpin = ? where id = ?");
                    ps.setString(1, newMpin);
                    ps.setInt(2, userId);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        // MPIN updated successfully
                    	response.sendRedirect("login.jsp");
                    } else {
                        // MPIN update failed
                    }
                    ps.close();
                } else {
                    // User not found
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    // Method to get user ID based on email
    private int getUserIdByEmail(Connection con, String email) throws SQLException {
        int userId = -1; // Default value if user not found
        PreparedStatement ps = con.prepareStatement("select id from user where email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("id");
        }
        rs.close();
        ps.close();
        return userId;
    }
}
