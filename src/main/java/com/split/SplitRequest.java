package com.split;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.db.DBConnection;
import com.entity.User;

@WebServlet("/Splitrequest")
public class SplitRequest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("userobj");

		UserDAO userDao = new UserDAO(DBConnection.getConn());
		List<User> userList = userDao.getAllUser();
		HashMap<String, String> emailMap = new HashMap<>();
		for (User user : userList) {
			emailMap.put(user.getFname() + ' ' + user.getLname(), user.getEmail());
		}

		// emailMap.forEach((key, value) -> System.out.println(key + " " + value));

		String grpname = request.getParameter("grpname");
		int people = Integer.parseInt(request.getParameter("people"));
		double amt = Double.parseDouble(request.getParameter("amt"));
		String namesString = request.getParameter("names");
		List<String> names = Arrays.asList(namesString.split(","));

		for (String name : names) {

			String email = emailMap.get(name);
			// System.out.println(email);

			if (email != null && !name.equals(currentUser.getFname() + ' ' + currentUser.getLname())) {
				sendEmail(email, grpname, people, amt, currentUser.getFname() + ' ' + currentUser.getLname(), name);
			} else {
				sendEmailTocreator(currentUser.getEmail(), grpname, people, amt, currentUser.getFname());
			}
		}

		request.getRequestDispatcher("split.jsp").forward(request, response);
	}

	private void sendEmail(String recipientEmail, String grpname, int people, double amt, String senderName,
			String recipientName) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("tracking.expense2024@gmail.com", "bnrq lrhg ovyh stci");
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("tracking.expense2024@gmail.com"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
			message.setSubject("Notification: Splitting Money!");
			message.setText("Dear " + recipientName + ",\n\nWe hope this message finds you well.\r\n" + "\r\n"
					+ "We wanted to inform you that you've been added to a new group on our website by " + senderName
					+ ". The group, named " + grpname
					+ " has been created for the purpose of splitting bills among its members.\r\n" + "\r\n"
					+ "Here are the details of the group:\r\n" + "\r\n" + "- Group Name: " + grpname + "\r\n"
					+ "- Number of Members: " + people + "\r\n" + "- Total Amount to Be Split: " + amt + "\r\n" + "\r\n"
					+ "You are one of the members of this group, and your contribution towards the total amount is "
					+ (amt / people)
					+ ". This amount has been calculated based on the expenses to be shared among the group members.\r\n"
					+ "We encourage you to log in to our website to view more details about the group and its members. Feel free to reach out to the group administrator or other members for any clarifications or discussions regarding the shared expenses.\r\n"
					+ "\r\n" + "Thank you for being a part of our community!\r\n" + "\r\n" + "\r\n"
					+ "If you have any questions or require further clarification, please do not hesitate to reach out: tracking.expense2024@gmail.com"
					+ ".\n\nBest regards,\nTeam Tracking Expense");
			Transport.send(message);
			// System.out.println("Email sent successfully to: " + recipientEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private void sendEmailTocreator(String email, String grpname, int people, double amt, String name) {

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("tracking.expense2024@gmail.com", "bnrq lrhg ovyh stci");
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("tracking.expense2024@gmail.com"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("Notification: Created a splitwiser!");
			message.setText("Dear " + name + " ,\n\nWe hope this message finds you well.\r\n" + "\r\n"
					+ "We wanted to inform you that you've  added  a new group on our website ."
					+ "It has been created for the purpose of splitting bills among its members.\r\n" + "\r\n"
					+ "Here are the details of the group:\r\n" + "\r\n" + "- Group Name:" + grpname + "\r\n"
					+ "- Number of Members:" + people + "\r\n" + "- Total Amount to Be Split:" + amt + "\r\n" + "\r\n"
					+ "You are one of the members of this group, and your contribution towards the total amount is "
					+ (amt / people)
					+ ". This amount has been calculated based on the expenses to be shared among the group members.\r\n"
					+ "\r\n" + "\r\n" + "\r\n" + "Thank you for being a part of our community!\r\n" + "\r\n" + "\r\n"
					+ "If you have any questions or require further clarification, please do not hesitate to reach out: tracking.expense2024@gmail.com"
					+ ".\n\nBest regards,\nTeam Tracking Expense");
			Transport.send(message);

			// System.out.println("Reminder of email sent successfully to: " + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}