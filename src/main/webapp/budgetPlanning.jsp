<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BudgetGPT</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .container {
    max-height:500px;
      max-width: 750px;
      margin: 0 auto;
      padding: 10px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-top: 40px;
      display: flex;
      flex-direction: column;
      height: 100vh;
    }

    input[type=text]{
      width: 600px;
      height: 38px;
      margin-right: 7px;
      border-radius: 10px;
      border: 1px solid #ccc;
    }

    input[type=submit]{
      color: rgb(252, 252, 252);
      width: 100px;
      height: 42px;
      background-color: rgb(84, 105, 212);
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type=submit]:hover {
      background-color: rgb(77, 83, 191);
    }

    h1 {
      text-align: center;
      color: rgb(84, 105, 212);
    }

    .chat {
      margin-bottom: 20px;
      overflow-y: auto;
      flex-grow: 1; /* Allow chat to grow and take remaining space */
    }

    .chat-user {
      
      text-align: right;
      margin-bottom: 10px;
      
    }

    .chat-gpt {
      
      text-align: left;
      margin-bottom: 10px;
    }

    .chat-bubble {
      display: inline-block;
      padding: 10px;
      border-radius: 10px;
      border: 1px solid #ccc;
      background-color: #f9f9f9;
      max-width: 70%;
    }

    .field {
      display: flex;
      justify-content: bottom;
      padding-left:13.5px;
      margin-top: 20px;
    }
  </style>
</head>
<body>

<div class="container">
<h1>BudgetGPT</h1>
  <div class="chat">
    <%
    ArrayList<String> promptAr = (ArrayList<String>) request.getAttribute("promptAr");
    ArrayList<String> responses = (ArrayList<String>) request.getAttribute("responses");
    if (promptAr != null && !promptAr.isEmpty()) {
      for (int i = 0; i < promptAr.size(); i++) {
        %>
        <div class="chat-user">
          <div class="chat-bubble"><%= promptAr.get(i) %></div>
        </div>
        <% if (responses != null && i < responses.size()) { %>
          <div class="chat-gpt">
            <div class="chat-bubble"><%= responses.get(i) %></div>
          </div>
        <% } %>
        <%
      }
    } else {
      %>
      <div class="chat-gpt">
        <div class="chat-bubble">No queries yet</div>
      </div>
      <%
    }
    %>
  </div>

  <div class="field">
    
    <form action="chatgpt" method="POST">
      <input type="text" name="query" placeholder="Enter your query">
      <input type="submit" value="Submit">
    </form>
  </div>
</div>

</body>
</html>
