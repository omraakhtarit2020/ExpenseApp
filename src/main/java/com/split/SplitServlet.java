package com.split;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.GroupMembershipDAO;
import com.DAO.SplitDAO;
import com.DAO.UserDAO;
import com.db.DBConnection;
import com.entity.Split;
import com.entity.User;

@WebServlet("/addSplit")
public class SplitServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			UserDAO userDao = new UserDAO(DBConnection.getConn());

			String grpname = req.getParameter("grpname");
			int people = Integer.parseInt(req.getParameter("people"));
			double amt = Double.parseDouble(req.getParameter("amt"));
			String[] namesArray = req.getParameterValues("names");
			List<String> names = Arrays.asList(namesArray);

			List<User> userList = userDao.getAllUser();
			HashMap<String, String> emailMap = new HashMap<>();
			for (User user : userList) {
				emailMap.put(user.getFname() + ' ' + user.getLname(), user.getEmail());
			}

			List<Integer> userIds = new ArrayList<>();
			for (String name : names) {
				String email = emailMap.get(name);
				int userId = userDao.getUserIdByEmail(email);
				userIds.add(userId);
			}

			long mili = System.currentTimeMillis();
			Date date = new Date(mili);

			HttpSession session = req.getSession();
			int ownerId = ((User) session.getAttribute("userobj")).getId();

			Split s = new Split(grpname, people, amt, names, date, ownerId);
			SplitDAO dao = new SplitDAO(DBConnection.getConn());
			int groupId = dao.addSplit(s);
			if (groupId != -1) {

				for (int userId : userIds) {
					GroupMembershipDAO gdao = new GroupMembershipDAO(DBConnection.getConn());
					if (userId != ownerId) {
						gdao.addMemberToGroup(userId, groupId, "Member");
					} else {
						gdao.addMemberToGroup(userId, groupId, "Owner");
					}
				}

				session.setAttribute("succMsg", "Group created successfully");
				resp.sendRedirect("split.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occurred");
				resp.sendRedirect("split.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
