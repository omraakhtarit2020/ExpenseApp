package com.user;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

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

import com.entity.User;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/resendOtp")
public class resendOtp extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getAttribute("fname").toString(); // Retrieve first name from request attribute
		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();
		
		
		if(email!=null || !email.equals("")) {
			// sending otp...
			Random rand = new Random();
			otpvalue = rand.nextInt(1255650);
			
			// Set OTP and its timestamp in session
			mySession.setAttribute("otp", otpvalue); 
			mySession.setAttribute("otpTime", System.currentTimeMillis()); // Set timestamp
			mySession.setAttribute("email", email);

			

			String to = email;// change accordingly
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("tracking.expense2024@gmail.com", "bnrq lrhg ovyh stci");// Put your email
																									// id and
																									// password here
				}
			});
			// compose message
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Reset Mpin request");
				StringBuilder sb = new StringBuilder();
				sb.append("Hello "+ fname + "!").append(System.lineSeparator());
				sb.append(System.lineSeparator());
				sb.append("your OTP for Tracking Expense is: " + otpvalue).append(System.lineSeparator());
				sb.append(System.lineSeparator());
				sb.append("This OTP is valid for the next 5 minutes.").append(System.lineSeparator());
				sb.append(System.lineSeparator());
				sb.append(System.lineSeparator());
				sb.append("Regards,").append(System.lineSeparator());
				sb.append("Team Tracking Expense").append(System.lineSeparator());
				
				message.setText(sb.toString());
		
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			request.setAttribute("message","OTP is sent to your email id");
			//request.setAttribute("connection", con);
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);
			//request.setAttribute("status", "success");
		}
		
	}

}
