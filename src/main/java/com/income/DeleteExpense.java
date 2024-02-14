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

@WebServlet("/deleteExpense")
public class DeleteExpense extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int exp_id = Integer.parseInt(req.getParameter("exp_id"));
		System.out.println(exp_id);
		ExpenseDAO dao = new ExpenseDAO(DBConnection.getConn());
		HttpSession session = req.getSession();
		if (dao.deleteExpense(exp_id)) {
			session.setAttribute("succMsg", "Deleted succesfully");
			resp.sendRedirect("home.jsp");
		} else {
			session.setAttribute("errorMsg", "An error occured");
			resp.sendRedirect("home.jsp");
		}

	}

}
