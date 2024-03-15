package com.income;

import java.io.IOException;

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

@WebServlet("/EditIncome")
public class UpdateIncome extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String type = req.getParameter("type");
			long income = Long.parseLong(req.getParameter("income"));

			HttpSession session = req.getSession();
			int inco_id = Integer.parseInt(req.getParameter("inco_id"));
			int userId = ((User) session.getAttribute("userobj")).getId();
			User_income inco = new User_income(type, income, inco_id, userId);

			System.out.print(inco.toString());

			IncomeDAO dao = new IncomeDAO(DBConnection.getConn());
			if (dao.updateIncome(inco)) {
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
