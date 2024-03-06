package com.income;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnection;
import com.entity.User;

@WebServlet("/thresholdCheck")
public class thresholdCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection conn;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userobj");
        double income = 0.0;
        double totalExpenses = 0.0;

        try {
            conn = DBConnection.getConn();
            income = getUserIncomeFromDatabase(user.getId());
            totalExpenses = getTotalExpensesForLast30DaysFromDatabase(user.getId());
         // Retrieve email from the database
            String email = getEmailFromDatabase(user.getId());
            String fname = getFnameFromDatabase(user.getId());
            // Set email in session
            session.setAttribute("email", email);
            session.setAttribute("fname", fname); 
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException properly or propagate it
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        double fiftyPercentOfIncome = 0.5 * income;

        try {
            if (totalExpenses > fiftyPercentOfIncome) {
                System.out.println("Total expenses exceed 50% of income");
                //request.getRequestDispatcher("./alertEmail").forward(request, response);
             // Assuming you want to forward the request to ServletB from ServletA

                RequestDispatcher dispatcher = request.getRequestDispatcher("/alertEmail");
                dispatcher.forward(request, response);

                // Inside thresholdCheck servlet doPost() method
             // response.sendRedirect("home.jsp");

            } else {
                System.out.println("Total expenses do not exceed 50% of income");
                response.sendRedirect("home.jsp");

            }
        } catch (IOException e) {
            e.printStackTrace();
            // Handle IOException properly or propagate it
        }
    }

    private double getUserIncomeFromDatabase(int userId) throws SQLException {
        double income = 0.0;
        String sql = "SELECT SUM(income) AS totalIncome FROM inco WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    income = rs.getDouble("totalIncome");
                }
            }
        }
        return income;
    }

    private double getTotalExpensesForLast30DaysFromDatabase(int userId) throws SQLException {
        double totalExpenses = 0.0;
        String sql = "SELECT SUM(expense) AS totalExpenses FROM expe WHERE user_id = ? AND date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalExpenses = rs.getDouble("totalExpenses");
                }
            }
        }
        return totalExpenses;
    }
    
    private String getEmailFromDatabase(int userId) throws SQLException {
        String email = null;
        String sql = "SELECT email FROM user WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    email = rs.getString("email");
                }
            }
        }
        return email;
    }
    
    private String getFnameFromDatabase(int userId) throws SQLException {
        String fname = null;
        String sql = "SELECT fname FROM user WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    fname = rs.getString("fname");
                }
            }
        }
        return fname;
    }

    
}
