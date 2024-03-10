package com.exchange;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.LendDAO;
import com.db.DBConnection;
import com.entity.Lend;
import com.entity.User;

@WebServlet("/addLend")
public class AddLend extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String to = (String) req.getParameter("to");
			String purpose = (String) req.getParameter("purpose");
			String followup = (String) req.getParameter("followup");

			long amt = Long.parseLong(req.getParameter("amt"));

			String d = req.getParameter("date");
			java.sql.Date date = java.sql.Date.valueOf(d);

			HttpSession session = req.getSession();
			int userId = ((User) session.getAttribute("userobj")).getId();
			Lend lend = new Lend(to, purpose, amt, date, userId, followup);

			LendDAO dao = new LendDAO(DBConnection.getConn());
			if (dao.addlend(lend)) {
				session.setAttribute("succMsg", "Added successfully");
				resp.sendRedirect("exchange.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occurred");
				resp.sendRedirect("exchange.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
