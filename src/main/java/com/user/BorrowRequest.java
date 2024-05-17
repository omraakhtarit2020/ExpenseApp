package com.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet("/borrowRequest")
public class BorrowRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String purpose = request.getParameter("purpose");
		String dateString = request.getParameter("date");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String to = request.getParameter("to");
		Long amt = Long.parseLong(request.getParameter("amt"));
		String email = ((User) session.getAttribute("userobj")).getEmail();
		String name = ((User) session.getAttribute("userobj")).getFname();

		sendEmail(email, purpose, to, date, amt, name);

		// Forward the request to the desired page
		request.getRequestDispatcher("exchange.jsp").forward(request, response);
	}

	private void sendEmail(String email, String purpose, String to, Date date, Long amt, String name) {

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
			message.setSubject("Reminder: Money borrowed");
			message.setText("Dear " + name + " ,\n\nI hope this message finds you well.\r\n" + "\r\n"
					+ "I am writing to remind you of a financial transaction that took place recently. It appears that you have taken a loan from "
					+ to + ", as per our records.\r\n" + "\r\n" + "The purpose of this loan was noted as " + purpose
					+ ", and the amount borrowed was Rs." + amt + ".\r\n" + "\r\n"
					+ "Thank you for your attention to this matter. Should you have any questions or require further clarification, please do not hesitate to reach out: tracking.expense2024@gmail.com"
					+ ".\n\nBest regards,\nTeam Tracking Expense");
			Transport.send(message);

			System.out.println("Reminder of borrow email sent successfully to: " + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
