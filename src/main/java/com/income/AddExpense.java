package com.income;

import java.io.IOException;
import java.sql.Date;

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

@WebServlet("/addExpense")
public class AddExpense extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String type = req.getParameter("type");
			System.out.println(type);
			long expense = Long.parseLong(req.getParameter("expense"));

			long mili = System.currentTimeMillis();
			Date date = new Date(mili);

			HttpSession session = req.getSession();
			int userId = ((User) session.getAttribute("userobj")).getId();
			System.out.println(userId);
			System.out.println(expense);

			User_expense exp = new User_expense(type, expense, userId, date);

			ExpenseDAO dao = new ExpenseDAO(DBConnection.getConn());
			if (dao.addexpense(exp)) {
				session.setAttribute("succMsg", "Added successfully");
				req.getRequestDispatcher("/thresholdCheck").forward(req, resp);
				
			} else {
				session.setAttribute("errorMsg", "An error occurred");
				resp.sendRedirect("addExpense.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
