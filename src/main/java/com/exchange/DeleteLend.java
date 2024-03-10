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

@WebServlet("/deleteLend")
public class DeleteLend extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int lend_id = Integer.parseInt(req.getParameter("lend_id"));
		System.out.println(lend_id);
		LendDAO dao = new LendDAO(DBConnection.getConn());
		HttpSession session = req.getSession();
		if (dao.deleteLend(lend_id)) {
			session.setAttribute("succMsg", "Deleted succesfully");
			resp.sendRedirect("exchange.jsp");
		} else {
			session.setAttribute("errorMsg", "An error occured");
			resp.sendRedirect("exchange.jsp");
		}

	}

}
