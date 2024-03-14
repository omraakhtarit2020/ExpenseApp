package com.income;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ExpenseDAO;
import com.db.DBConnection;
import com.entity.User;
import com.entity.User_expense;

@WebServlet("/EditExpense")
public class UpdateExpense extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String type = req.getParameter("type");
			long expense = Long.parseLong(req.getParameter("expense"));

			HttpSession session = req.getSession();
			int exp_id = Integer.parseInt(req.getParameter("exp_id"));
			int userId = ((User) session.getAttribute("userobj")).getId();
			User_expense expo = new User_expense(type, expense, exp_id, userId);

			System.out.print(expo.toString());

			ExpenseDAO dao = new ExpenseDAO(DBConnection.getConn());
			if (dao.updateExpense(expo)) {
				session.setAttribute("succMsg", "Updated succesfully");
				resp.sendRedirect("home.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occured");
				resp.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
