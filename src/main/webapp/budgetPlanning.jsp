<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BudgetGPT</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
	 margin-top:5em;
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

.res {
	margin-bottom: 10px;
	padding: 10px;
	background-color: #f9f9f9;
	border-radius: 4px;
	border: 1px solid #ccc;
}
</style>
</head>
<body>    
 <%@ include file="components/track/budget_nav.jsp" %> 
	<div class="container">
		<div>
			<h4 class="fst-italic">Queries</h4>
			<ul>
				<%
				ArrayList<String> promptAr = (ArrayList<String>) request.getAttribute("promptAr");
				if (promptAr != null && !promptAr.isEmpty()) {
					for (String pr : promptAr) {
				%>
				<li class="res"><%= pr %></li>
				<%
					} 
				} else {
				%>
				<li class="res">No queries yet</li>
				<%
				}
				%>
			</ul>
		</div>
		<div>
			<h4 class="fst-italic">Responses</h4>
			<ul>
				<%
				ArrayList<String> responses = (ArrayList<String>) request.getAttribute("responses");
				if (responses != null && !responses.isEmpty()) {
					for (String res : responses) {
				%>
				<li class="res"><%=res%></li>
				<%
					}
				} else {
				%>
				<li class="res">No responses yet</li>
				<%
				}
				%>
			</ul>
		</div>
		<br>
		<h3 class="text-center fw-bold">BudgetGPT</h3>
		<form action="chatgpt" method="POST">
			<input type="text" name="query" placeholder="Enter your query">
			<input type="submit" value="Submit">
		</form>
	</div>
	
   
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>	
</body>
</html>
