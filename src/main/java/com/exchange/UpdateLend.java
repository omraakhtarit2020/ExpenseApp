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

@WebServlet("/updateLend")
public class UpdateLend extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hi i am in update servlet");
		try {
			String to = (String) req.getParameter("to");

			String purpose = (String) req.getParameter("purpose");
			// String followup = (String) req.getParameter("followup");

			long amt = Long.parseLong(req.getParameter("amt"));

			String d = req.getParameter("date");
			java.sql.Date date = java.sql.Date.valueOf(d);

			HttpSession session = req.getSession();
			String lendIdParam = req.getParameter("lend_id");
			int lend_id = 0; // Default value or handle as needed
			if (lendIdParam != null && !lendIdParam.isEmpty()) {
				lend_id = Integer.parseInt(lendIdParam);
			}
			int userId = ((User) session.getAttribute("userobj")).getId();
			Lend lend = new Lend(to, purpose, amt, date, userId, lend_id);

			System.out.print(lend.toString());

			LendDAO dao = new LendDAO(DBConnection.getConn());
			if (dao.updateLend(lend)) {
				session.setAttribute("succMsg", "Updated succesfully");
				resp.sendRedirect("exchange.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occured");
				resp.sendRedirect("exchange.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
