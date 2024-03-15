package com.split;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.SplitDAO;
import com.db.DBConnection;
import com.entity.Split;
import com.entity.User;

@WebServlet("/addSplit")
public class SplitServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String grpname = req.getParameter("grpname");
			int people = Integer.parseInt(req.getParameter("people"));
			double amt = Double.parseDouble(req.getParameter("amt"));
			String[] namesArray = req.getParameterValues("names");
			List<String> names = Arrays.asList(namesArray);

			long mili = System.currentTimeMillis();
			Date date = new Date(mili);

			HttpSession session = req.getSession();
			int userId = ((User) session.getAttribute("userobj")).getId();

			Split s = new Split(grpname, people, amt, names, date, userId);
			// System.out.println(s.toString());

			SplitDAO dao = new SplitDAO(DBConnection.getConn());
			if (dao.addSplit(s)) {
				session.setAttribute("succMsg", "Added successfully");
				resp.sendRedirect("split.jsp");

			} else {
				session.setAttribute("errorMsg", "An error occurred");
				resp.sendRedirect("split.jsp");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
