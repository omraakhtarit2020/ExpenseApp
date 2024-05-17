package com.authFilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

public class MyFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpSession ses = req.getSession();
		HttpServletResponse resp = (HttpServletResponse) arg1;

		User user = (User) ses.getAttribute("userobj");

		if (user != null) {
			arg2.doFilter(arg0, arg1);
		} else {
//			arg1.setContentType("text/html");
//			arg1.getWriter().println("Please login to visit");
			resp.sendRedirect("./welcome.jsp");

		}

	}

}
