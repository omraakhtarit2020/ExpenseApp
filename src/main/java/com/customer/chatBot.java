package com.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class chatBot
 */
@WebServlet("/chatBot")
public class chatBot extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	//private List<String> chatMessages = new ArrayList<>();
    
	public chatBot() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choice = request.getParameter("userStmt");

        System.out.println("Choice: " + choice); // Debugging statement
        
        String botResponse= "";
        
        if (choice.equalsIgnoreCase("clear")) {
            botResponse = "Chat cleared."; // Provide feedback that chat has been cleared
            // Clear chat attributes
            request.removeAttribute("choice");
            request.removeAttribute("botResponse");
        } else {
            botResponse = botAns(choice); // Get bot response for other queries
        }
        
        System.out.println("Bot Response: " + botResponse); // Debugging statement
        
        //response.setContentType("text/plain");
        //response.setCharacterEncoding("UTF-8");
        //response.getWriter().write(botResponse);
        request.setAttribute("choice", choice);
        request.setAttribute("botResponse", botResponse);
        //request.setAttribute("chatMessages", chatMessages);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
	private String botAns(String choice) {
		String ans="";
		switch(choice) {
		case "1":
			ans = "We provide a handful of features, which include:\n" +
		           "1. Tracking day to day expense\n" +
		           "2. Calculator for your financial investment, EMIs', Loan\n" +
		           "3. a platform to keep tabs on who owes you money  and to whom you owe money\n" +
		           "4. AI to help you with all your budget queries and planning\n"+
		           "5. Our system that reminds you about your loan, and offers an option to remind your recipients\n"+
		           "6. SplitWiser feature\n"+
		           "7. Also send Alert emails so you are in check with your spendings\n"+
		           "We also provide a user friendly interface.";
			break;
		case "2":
			ans = "The dashboard features expense tracking, displays up to 5 recent expenses, "
					+ "and provides options to add both income and expenses. "
					+ "The navbar offers access to 3 more additional features, "
					+ "and AI assistance ('BudgetGPT'). Users can also reset their MPIN through the 'Forgot Your PIN' option, which prompts them to enter an OTP sent to their preferred email. Hope this overview serves your needs!";
			break;
			
		default:
			ans="For any other query, please contact us at :tracking.expense2024@gmail.com \n"+
					"Thank you for you patience!";
			break;
	}
	
	return ans;
}

}
