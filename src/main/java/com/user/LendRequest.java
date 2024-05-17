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

@WebServlet("/lendRequest")
public class LendRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private static final Map<String, String> emailDateMap = new HashMap<>();
	// private static final Timer timer = new Timer();

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

		// System.out.println(email + date + to);
		// Store email and date in the map
//
//		emailDateMap.put(email, dateString);

		// Schedule the task to send emails every month
		sendEmail(email, purpose, to, date, amt, name);

		// Forward the request to the desired page
		request.getRequestDispatcher("exchange.jsp").forward(request, response);
	}

//	private void scheduleMonthlyEmails(String email, String purpose, Date date, String to, Long amt, String name) {
//		TimerTask task = new TimerTask() {
//			@Override
//			public void run() {
//				String dateStr = emailDateMap.get(email);
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				try {
//					// Parse the date string into a Date object
//					Date date = sdf.parse(dateStr);
//
//					// Calculate the next minute's date
//					// Add 1 minute to the current date
//					long nextMinuteInMillis = date.getTime() + (60 * 1000);
//
//					// Create a Date object for the next minute
//					Date nextMinuteDate = new Date(nextMinuteInMillis);
//
//					// Get the current date
//					Date currentDate = new Date();
//
//					// Check if it's time to send the email for the next minute
//					if (currentDate.after(nextMinuteDate)) {
//						sendEmail(email, purpose, to, date, amt, name);
//						// Reschedule the task for the next minute
//						scheduleMonthlyEmails(email, purpose, date, to, amt, name);
//					}
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
//			}
//		};
//
//		// Schedule the task to run every minute
//		timer.schedule(task, 60 * 1000); // 1 minute delay
//	}

	private void sendEmail(String email, String purpose, String to, Date date, Long amt, String name) {
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("Reminder: Outstanding Loan");
			message.setText("Dear " + name + " ,\n\nI hope this message finds you well.\r\n" + "\r\n"
					+ "I am writing to remind you of a financial transaction that took place recently. It appears that you have extended a loan to "
					+ to + ", as per our records.\r\n" + "\r\n" + "The purpose of this loan was noted as " + purpose
					+ ", and the amount extended was Rs." + amt + ".\r\n" + "\r\n"
					+ "Thank you for your attention to this matter. Should you have any questions or require further clarification, please do not hesitate to reach out: tracking.expense2024@gmail.com"
					+ ".\n\nBest regards,\nTeam Tracking Expense");
			Transport.send(message);
			System.out.println("Reminder email sent successfully to: " + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
