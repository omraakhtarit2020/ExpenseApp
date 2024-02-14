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

@WebServlet("/deleteIncome")
public class DeleteIncome extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int inco_id = Integer.parseInt(req.getParameter("inco_id"));
		System.out.println(inco_id);
		IncomeDAO dao = new IncomeDAO(DBConnection.getConn());
		HttpSession session = req.getSession();
		if (dao.deleteIncome(inco_id)) {
			session.setAttribute("succMsg", "Deleted succesfully");
			resp.sendRedirect("home.jsp");
		} else {
			session.setAttribute("errorMsg", "An error occured");
			resp.sendRedirect("home.jsp");
		}

	}

}
