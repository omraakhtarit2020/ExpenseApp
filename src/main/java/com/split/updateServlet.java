package com.split;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SplitDAO;
import com.db.DBConnection;

@WebServlet("/UpdateStatusServlet")
public class updateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int grpId = Integer.parseInt(request.getParameter("grpId"));
		System.out.println(grpId + "updte servlet");
		// int ownerId = Integer.parseInt(request.getParameter("OwnerId"));

		SplitDAO dao = new SplitDAO(DBConnection.getConn());

		try {
			String currentStatus = dao.getStatus(grpId);
			System.out.println(currentStatus + " " + grpId);
			if ("Pending".equalsIgnoreCase(currentStatus)) {
				dao.updateStatus(grpId, "Paid");
				request.getSession().setAttribute("succMsg", "Status updated to Paid successfully");
			} else {
				request.getSession().setAttribute("errorMsg", "Invalid status update attempt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.getSession().setAttribute("errorMsg", "An error occurred while updating status");
		}

		response.sendRedirect("split.jsp");
	}
}
