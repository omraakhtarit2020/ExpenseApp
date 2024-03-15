package com.user;

import java.io.IOException;
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

import com.entity.User;

@WebServlet("/remind")
public class Remind extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// private static final Map<String, String> emailDateMap = new HashMap<>();
	// private static final Timer timer = new Timer();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String senderEmail = request.getParameter("senderemail");
		String to = request.getParameter("to");
		Long amt = Long.parseLong(request.getParameter("amt"));
		String date = request.getParameter("date");
		String email = ((User) session.getAttribute("userobj")).getEmail();
		String name = ((User) session.getAttribute("userobj")).getFname();

		// System.out.println(email + date + to);
		// Store email and date in the map
//
//		emailDateMap.put(email, dateString);

		// Schedule the task to send emails every month
		sendEmail(senderEmail, email, name, to, amt, date);

		// Forward the request to the desired page
		request.getRequestDispatcher("exchange.jsp").forward(request, response);
	}

	private void sendEmail(String senderemail, String email, String name, String to, Long amt, String date) {
		// Your email sending logic here
		// Use the provided email address to send the email

		// Example email sending code (you need to replace it with your own logic)
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(senderemail));
			message.setSubject("Reminder!");
			message.setText("Dear " + to + " ,\n\nWe hope this message finds you well.\r\n" + "\r\n"
					+ "We are writing to remind you of a financial transaction that took place recently. It appears that you have taken a loan from "
					+ name.toUpperCase() + ", as per our records.\r\n" + "The amount taken is " + amt + " on " + date
					+ "\r\n"
					+ "Thank you for your attention to this matter. Should you have any questions or require further clarification, please do not hesitate to reach out: "
					+ email + ".\n\nBest regards,\nTeam Tracking Expense");
			Transport.send(message);
			// System.out.println("Reminder email sent successfully to: " + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
