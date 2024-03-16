package com.budget;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.budget.chatGpt;
/**
 * Servlet implementation class clearChat
 */
@WebServlet("/clearChat")
public class clearChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public clearChat() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Clear the chat history here
        chatGpt chatServlet = new chatGpt();
        chatServlet.clearChat(); // Call the clearChat method from chatGpt servlet

        // Optionally, you can send a response to indicate that the chat has been cleared
        //response.setContentType("text/plain");
        System.out.println("Chat history cleared successfully");
        response.sendRedirect("budgetPlanning.jsp");
    }

}
