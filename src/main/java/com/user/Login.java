package com.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.db.DBConnection;
import com.entity.User;

@WebServlet("/login")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int mpin = Integer.parseInt(req.getParameter("mpin"));

			UserDAO dao = new UserDAO(DBConnection.getConn());
			User user = dao.getUserById(mpin);
			System.out.println(user.toString());
			HttpSession session = req.getSession();
			if (user != null) {
				session.setAttribute("userobj", user);
				resp.sendRedirect("home.jsp");
			} else {
				session.setAttribute("errorMsg", "Invalid MPIN. Please try again.");
				resp.sendRedirect("login.jsp");
			}

		} catch (NumberFormatException e) {
			e.printStackTrace();
			HttpSession session = req.getSession();
			session.setAttribute("errorMsg", "Invalid input format. Please enter a valid MPIN.");
			resp.sendRedirect("login.jsp");
		} catch (Exception e) {
			e.printStackTrace(); // Log the error
			HttpSession session = req.getSession();
			session.setAttribute("errorMsg", "An error occurred. Please try again later.");
			resp.sendRedirect("login.jsp");
		}
	}
}
