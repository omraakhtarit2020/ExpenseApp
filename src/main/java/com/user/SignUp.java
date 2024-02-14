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
}
