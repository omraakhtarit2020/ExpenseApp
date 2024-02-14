package com.income;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.IncomeDAO;
import com.db.DBConnection;
import com.entity.User;
import com.entity.User_income;

@WebServlet("/addIncome")
public class AddIncome extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String type = req.getParameter("type");
			long income = Long.parseLong(req.getParameter("income"));
			long mili = System.currentTimeMillis();
			Date date = new Date(mili);

			HttpSession session = req.getSession();
			int userId = ((User) session.getAttribute("userobj")).getId();
			System.out.println(userId);
			System.out.println(income);

			User_income inc = new User_income(type, income, userId, date);

			IncomeDAO dao = new IncomeDAO(DBConnection.getConn());
			if (dao.addincome(inc)) {
				session.setAttribute("succMsg", "Added succesfully");
				resp.sendRedirect("home.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occured");
				resp.sendRedirect("addIncome.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}