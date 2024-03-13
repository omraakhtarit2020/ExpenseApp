package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date; // Import Date class
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        long otpTime = (long) session.getAttribute("otpTime"); // Get the timestamp when OTP was generated

        RequestDispatcher dispatcher = null;
        
        long currentTime = System.currentTimeMillis();
        long otpValidityDuration = 5 * 60 * 1000; // 5 minutes in milliseconds
        
        if (value == otp && (currentTime - otpTime) <= otpValidityDuration) { // Check if OTP matches and is within validity duration
            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("forgotPsd.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Invalid OTP");

            // Check if session has expired
            if ((currentTime - otpTime) > otpValidityDuration) {
                request.setAttribute("message", "Session expired. Generate OTP again.");
                dispatcher = request.getRequestDispatcher("mailForgot.jsp");
                dispatcher.forward(request, response);
            }

            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }
}
