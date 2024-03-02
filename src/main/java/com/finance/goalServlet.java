package com.finance;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnection;
import com.entity.User;
import com.DAO.goalDAO;
import com.entity.goal_entity;

/**
 * Servlet implementation class goalServlet
 */
@WebServlet("/goalServlet")
public class goalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public goalServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub 
		try {
			String buttonClicked = request.getParameter("buttonClicked");

			// Check if the button clicked is "Yes"
			if (buttonClicked != null && buttonClicked.equals("Yes")) {

				String principal = request.getParameter("principal");
				String year = request.getParameter("year");
				// Get the current date
				long currentDate = System.currentTimeMillis();
				// Convert it to java.sql.Date
				Date date = new Date(currentDate);

				HttpSession session = request.getSession();
				int userId = ((User) session.getAttribute("userobj")).getId();

				// create a entity object
				goal_entity g_entity = new goal_entity(principal, year, userId, date);

				System.out.println(g_entity.toString());
				// create a DAO object
				goalDAO g = new goalDAO(DBConnection.getConn());
				if (g.insertGoal(g_entity)) {
					System.out.println("submitted");
					
					response.sendRedirect("goal.jsp");
				} else {
					System.out.println("error encountered");
				}
				
			} else {
				// Button click was not "Yes", do nothing or handle as needed
				response.sendRedirect("goal.jsp");
				System.out.println("Reminder not needed.");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
