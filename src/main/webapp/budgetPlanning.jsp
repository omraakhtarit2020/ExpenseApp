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
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 50px;
}

h1 {
	text-align: center;
}

form {
	margin-bottom: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

input[type="text"] {
	padding: 10px;
	width: 70%;
	border-radius: 4px;
	border: 1px solid #ccc;
	margin-right: 10px;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

ul {
	list-style-type: none;
	padding: 0;
}

li {
	margin-bottom: 10px;
	padding: 10px;
	background-color: #f9f9f9;
	border-radius: 4px;
	border: 1px solid #ccc;
}
</style>
</head>
<body>

	<div class="container">
		<div>
			<h2>Queries</h2>
			<ul>
				<%
				ArrayList<String> promptAr = (ArrayList<String>) request.getAttribute("promptAr");
				if (promptAr != null && !promptAr.isEmpty()) {
					for (String pr : promptAr) {
				%>
				<li><%= pr %></li>
				<%
					} 
				} else {
				%>
				<li>No queries yet</li>
				<%
				}
				%>
			</ul>
		</div>
		<div>
			<h2>Responses</h2>
			<ul>
				<%
				ArrayList<String> responses = (ArrayList<String>) request.getAttribute("responses");
				if (responses != null && !responses.isEmpty()) {
					for (String res : responses) {
				%>
				<li><%=res%></li>
				<%
					}
				} else {
				%>
				<li>No responses yet</li>
				<%
				}
				%>
			</ul>
		</div>
		<h1>BudgetGPT</h1>
		<form action="chatgpt" method="POST">
			<input type="text" name="query" placeholder="Enter your query">
			<input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>