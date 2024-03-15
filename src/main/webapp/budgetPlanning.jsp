<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<title>BudgetGPT</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	max-height: 500px;
	max-width: 750px;
	padding: 10px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 25px;
	display: flex;
	flex-direction: column;
	height: 100vh;
}

input[type=text] {
	width: 600px;
	height: 38px;
	margin-right: 7px;
	border-radius: 10px;
	border: 1px solid #ccc;
}

input[type=submit] {
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
	text-align: left;
	font-weight: 600;
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

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-left:20px;
	margin-right:20px;
}

.field {
	display: flex;
	justify-content: bottom;
	padding-left: 13.5px;
	margin-top: 20px;
}

.refresh {
	font-size:25px;
	font-weight: 600;
	color: rgb(84, 105, 212);
	right:20px;
}
</style>
</head>
<body>
	<%@ include file="components/track/budget_nav.jsp"%>
	<div class="container">
		<div class="header">
			<h1>BudgetGPT</h1>
			<a href="./clearChat" class="refresh">
				<i class="fas fa-sync-alt"></i>
			</a>
		</div>
		<hr>
		<div class="chat">
			<%
			ArrayList<String> promptAr = (ArrayList<String>) request.getAttribute("promptAr");
			ArrayList<String> responses = (ArrayList<String>) request.getAttribute("responses");
			if (promptAr != null && !promptAr.isEmpty()) {
				for (int i = 0; i < promptAr.size(); i++) {
			%>
			<div class="chat-user">
				<div class="chat-bubble"><%=promptAr.get(i)%></div>
			</div>
			<%
			if (responses != null && i < responses.size()) {
			%>
			<div class="chat-gpt">
				<div class="chat-bubble"><%=responses.get(i)%></div>
			</div>
			<%
			}
			%>
			<%
			}
			} else {
			%>
			<div class="chat-gpt">
				<div class="chat-bubble">How can I assist you today!..</div>
			</div>
			<%
			}
			%>
		</div>
		<hr>
		<div class="field">

			<form action="chatgpt" method="POST">
				<input type="text" name="query" placeholder=" Enter your query">
				<input type="submit" value="Submit">

			</form>
		</div>
	</div>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		charset="utf-8"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
		
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    // Define the clearChat function
	    function clearChat() {
	        // Remove all chat bubbles from the chat container
	        const chatContainer = document.querySelector('.chat');
	        chatContainer.innerHTML = '';
	        
	    }

	    const refreshButton = document.querySelector('.refresh');

	    refreshButton.addEventListener('click', function() {
	        // Make an AJAX request to clear the chat
	        fetch('clearChat', {
	            method: 'GET'
	        })
	        .then(response => {
	            if (response.ok) {
	                // Clear the chat container using the clearChat function
	                clearChat();
	            } else {
	                console.error('Failed to clear chat. Status:', response.status);
	            }
	        })
	        .catch(error => console.error('Error:', error));
	    });
	    
	 // Add a message indicating that the chat has been cleared
        const clearMessage = document.createElement('div');
        clearMessage.classList.add('chat-gpt');
        //clearMessage.innerHTML = '<div class="chat-bubble">How can I help you.</div>';
        chatContainer.appendChild(clearMessage);
	});

	</script>

</body>
</html>
