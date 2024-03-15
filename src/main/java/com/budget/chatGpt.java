package com.budget;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatgpt")
public class chatGpt extends HttpServlet {

	private ArrayList<String> responses = new ArrayList<>();
	private ArrayList<String> promptAr = new ArrayList<>();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prompt = req.getParameter("query");
		String ans = chatGPT(prompt);
		
		// Clear the ArrayLists before adding new entries
	    responses.clear();
	    promptAr.clear();
	 // Adds prompts to ArrayList, Add response to ArrayList
		promptAr.add(prompt);
		responses.add(ans); 
		// Check if the prompt is the initial query or a follow-up
        if (prompt.equalsIgnoreCase("How can I help you?")) {
            // Provide options to the user
            ans = "Please choose one of the following options:\n" +
                  "1. Plan a trip within a budget\n" +
                  "2. Reduce monthly expenses\n" +
                  "3. Investment\n" +
                  "4. Others";
        } else {
            // Process user's choice and provide relevant follow-up questions
            String userChoice = prompt.toLowerCase();
            switch (userChoice) {
                case "1":
                    // Ask relevant questions for planning a trip within a budget
                    ans = "Sure, I can help you plan a trip within a budget. " +
                          "Could you please provide me with some details about your trip?";
                    break;
                case "2":
                    // Ask relevant questions for reducing monthly expenses
                    ans = "To help you reduce your monthly expenses, " +
                          "could you please provide more information about your expenses?";
                    break;
                case "3":
                    // Ask relevant questions for investment
                    ans = "For investment advice, could you please specify your investment goals and risk tolerance?";
                    break;
                case "4":
                    // Handle other options
                    ans = "Please specify your query so I can assist you accordingly.";
                    break;
                default:
                    ans = "Sorry, I didn't understand your choice. Please choose a valid option.";
                    break;
            }
        }
        
		req.setAttribute("promptAr", promptAr);
		req.setAttribute("responses", responses); // Set ArrayList as request attribute
		req.getRequestDispatcher("budgetPlanning.jsp").forward(req, resp); // Forward to JSP page
		
		System.out.println("Prompt:" + prompt);
		System.out.println("chatgpt:" + ans);
		
	}
	
	// Method to clear the chat history
    public void clearChat() {
        responses.clear(); // Clear responses ArrayList
        promptAr.clear(); // Clear promptAr ArrayList
    }

	public static String chatGPT(String prompt) {
		// Define keywords related to budgets and expenses
		String[] budgetKeywords = { "budget", "expenses", "spending", "savings", "financial", "planning", "finances",
				"trip", "Track", "flight", "train", "cost", "price" };
		boolean isBudgetRelated = false;

		// Check if the prompt contains any of the budget-related keywords
		for (String keyword : budgetKeywords) {
			if (prompt.toLowerCase().contains(keyword)) {
				isBudgetRelated = true;
				break;
			}
		}

		// If the prompt is not budget-related, return a message indicating so
		if (!isBudgetRelated) {
			return "Sorry, I can only answer questions related to budgets and expenses.";
		}
		

		String url = "https://api.openai.com/v1/chat/completions";
		String apiKey = " "; //"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";

		String model = "gpt-3.5-turbo";

		try {
			URL obj = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) obj.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "Bearer " + apiKey);
			connection.setRequestProperty("Content-Type", "application/json");

			// The request body
			String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"user\", \"content\": \"" + prompt
					+ "\"}]}";
			connection.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
			writer.write(body);
			writer.flush();
			writer.close();

			// Response from ChatGPT
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;

			StringBuffer response = new StringBuffer();

			while ((line = br.readLine()) != null) {
				response.append(line);
			}
			br.close();

			// calls the method to extract the message.
			return extractMessageFromJSONResponse(response.toString());

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static String extractMessageFromJSONResponse(String response) {
		int start = response.indexOf("content") + 11;
		int end = response.indexOf("\"", start);
		String message = response.substring(start, end);
		// Replace newline characters with HTML line breaks
		message = message.replace("\\n", "<br>");
		return message;
	}

	/*
	 * public static void main(String[] args) {
	 * 
	 * System.out.println(chatGPT(""));
	 * 
	 * }
	 */
}