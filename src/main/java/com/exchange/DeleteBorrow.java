package com.exchange;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BorrowDAO;
import com.db.DBConnection;

@WebServlet("/deleteBorrow")
public class DeleteBorrow extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int borrow_id = Integer.parseInt(req.getParameter("borrow_id"));
		System.out.println(borrow_id);
		BorrowDAO dao = new BorrowDAO(DBConnection.getConn());
		HttpSession session = req.getSession();
		if (dao.deleteBorrow(borrow_id)) {
			session.setAttribute("succMsg", "Deleted succesfully");
			resp.sendRedirect("exchange.jsp");
		} else {
			session.setAttribute("errorMsg", "An error occured");
			resp.sendRedirect("exchange.jsp");
		}

	}

}
