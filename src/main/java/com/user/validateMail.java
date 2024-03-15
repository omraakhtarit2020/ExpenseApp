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

import com.db.DBConnection;

@WebServlet("/validateMail")
public class validateMail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public validateMail() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email"); // Get email entered by user from request parameter
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Get database connection
            con = DBConnection.getConn();
            
            // Prepare SQL statement to check if email exists in the database
            String sql = "SELECT * FROM user WHERE email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            
            // Execute query
            rs = ps.executeQuery();
            
            // Check if email exists in the database
            if (rs.next()) {
                // Email exists, set email as a session attribute and redirect user to updateMpin servlet
            	String fname = rs.getString("fname"); // Assuming the column name for first name is "first_name"
                request.setAttribute("fname", fname); // Set first name as a request attribute
            	request.getSession().setAttribute("email", email);
                request.getRequestDispatcher("/forgotPassword").forward(request, response);
               
            } else {
                // Email does not exist, handle accordingly (e.g., display error message)
                System.out.println("User does not exist. Please Sign Up first.");
            }
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
