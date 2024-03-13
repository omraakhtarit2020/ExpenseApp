package com.income;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class alertEmail
 */
@WebServlet("/alertEmail")
public class alertEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    HttpSession mySession = request.getSession();
	    String fname = (String) mySession.getAttribute("fname");
	    String email = (String) mySession.getAttribute("email");

	    if (email != null && !email.isEmpty()) {
	        try {
	            // Set up email properties and authentication details
	            Properties props = new Properties();
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.socketFactory.port", "465");
	            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	            props.put("mail.smtp.auth", "true");
	            props.put("mail.smtp.port", "465");

	            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication("tracking.expense2024@gmail.com", "bnrq lrhg ovyh stci");
	                    // Replace with your email id and password
	                }
	            });

	            // Compose the email message
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(email));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	            message.setSubject("Alert: Expense budget exceeded for this month");
	            StringBuilder sb = new StringBuilder();
	            sb.append("Hello ").append(fname).append("!").append(System.lineSeparator());
	            sb.append(System.lineSeparator());
	            sb.append("This is an Alert email!").append(System.lineSeparator());
	            sb.append(System.lineSeparator());
	            sb.append("You have exceeded your expense").append(System.lineSeparator());
	            sb.append(System.lineSeparator());
	            sb.append(System.lineSeparator());
	            sb.append("Regards,").append(System.lineSeparator());
	            sb.append("Team Tracking Expense").append(System.lineSeparator());

	            message.setText(sb.toString());

	            // Send the email message
	            Transport.send(message);
	            System.out.println("Message sent successfully");
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            // Handle the exception gracefully
	            response.getWriter().println("Failed to send email. Please try again later.");
	            return; // Stop further execution
	        }

	        // Forward the request to home.jsp
	        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        // Handle case where email is null or empty
	        response.getWriter().println("Email address not found in session.");
	    }
	}
}