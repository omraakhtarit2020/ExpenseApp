<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<title>nav</title>
<style media="screen">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

.dot {
	height: 100px;
	width: 100px;
	background-color: rgb(29, 3, 77);
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	margin-top: -3em;
	margin-left: 9em;
}

.dot-h1 {
	color: white;
	font-size: 30px;
	font-weight: 500;
}

body {
	min-height: 100vh;
	background: #f6fff8;
	color: black;
	background-size: cover;
	background-position: center;
}

.side-bar {
	background: rgba(173, 219, 186, 0.2);
	backdrop-filter: blur(15px);
	width: 350px;
	height: 100vh;
	position: fixed;
	top: 0;
	right: -350px;
	overflow-x: auto;
	transition: 0.5s ease;
	transition-property: right;
	z-index: 1000;
}

.side-bar::-webkit-scrollbar {
	width: 0px;
}

.side-bar.active {
	right: 0;
}

.exp {
	padding-top: 33px;
	text-align: center;
	font-weight: 550;
	font-size: 32px;
	font-family: sans-serif;
	letter-spacing: 2px;
}

.side-bar .menu {
	width: 100%;
}

.side-bar .menu .item {
	position: relative;
	cursor: pointer;
}

.side-bar .menu .item a {
	color: rgb(3, 5, 94);
	font-size: 16px;
	text-decoration: none;
	display: block;
	padding: 5px 30px;
	line-height: 60px;
}

.side-bar .menu .item a:hover {
	background: rgba(146, 202, 164, 0.8);
	color: white;
	transition: 0.2s ease;
}

.side-bar .menu .item i {
	margin-right: 10px;
}

.side-bar .menu .item a .dropdown {
	position: absolute;
	right: 0;
	margin: 20px;
	transition: 0.3s ease;
}

.side-bar .menu .item .sub-menu {
	background: rgba(164, 223, 177, 0.2);
	display: none;
}

.side-bar .menu .item .sub-menu a {
	padding-left: 80px;
}

.rotate {
	transform: rotate(90deg);
}

.close-btn {
	position: absolute;
	color: #09056c;
	font-size: 30px;
	right: 13px;
	margin: 5px;
	cursor: pointer;
}

.menu-btn {
	position: absolute;
	top: 10px;
	right: 30px;
	/* Adjust this value as needed */
	color: rgb(37, 7, 107);
	font-size: 30px;
	cursor: pointer;
	transition: all 0.8s ease;
}

.menu-btn:hover {
	transform: rotate(90deg);
}

header {
	background: rgba(173, 219, 186, 0.2);
	height: 60px;
}

.navbar {
	background-color: rgba(255,255,255,0.4);
	color: #09056c;
	width: auto;
	height: 60px;
	font-size: 30px;
}

span .itemExe {
	font-weight: 550;
	margin-bottom: 25px;
	padding: 15px;
}

.modal-body {
	color: #09056c;
}
.h-6 {
  height: 3rem;
}
.mr-3 {
  margin-right: 0.75rem;
}
.self-center {
  align-self: center;
}
.whitespace-nowrap {
  white-space: nowrap;
}
.text-xl {
  font-size: 1.25rem;
  line-height: 1.75rem;
  font-weight: 600;
}
.dark .dark\:text-white {
  --tw-text-opacity: 1;
  color: rgb(255 255 255 / var(--tw-text-opacity));
}
.navbar .container-fluid {
    display: flex;
    align-items: center;
}

.logo-container {
    display: flex;
    align-items: center;
}

</style>
</head>

<body>

	<nav class="navbar">
		<div class="container-fluid">
        <div class="logo-container">
            <img src="images/favicon-16x16.png" class="h-6 mr-3 sm:h-9" alt="logo" />
            <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Expense-Tastic</span>
        </div>
    </div>
	</nav>

	<div class="menu-btn">
		<i class="fas fa-bars"></i>
	</div>


	<div class="side-bar">

		<header>

			<div class="close-btn">

				<i class="fas fa-times"></i>
			</div>
			<!--h1 class="exp">Expense-Tastic</h1-->
		</header>
		<div class="menu">
			
			<div class="item">
				<a class="sub-btn"><i class="fas fa-th-large"></i> Features <i
					class="fas fa-angle-right dropdown"></i></a>
				<div class="sub-menu">
					<a href="split.jsp" class="sub-item"><i class="far fa-handshake"></i>
						Split-Wiser</a> <a href="goal.jsp" class="sub-item"><i
						class="fas fa-calculator"></i> Calculators</a> <a href="exchange.jsp"
						class="sub-item"><i class="fas fa-university"></i> Credit Exchange</a>
				</div>
			</div>
			<div class="item">
				<a href="budgetPlanning.jsp"><i class="fas fa-robot"></i>
					BudgetGPT</a>
			</div>
			<div class="item">
				<a class="sub-btn" href="#" data-bs-toggle="modal"
					data-bs-target="#exampleModal"><i class="fas fa-user"></i>
					 Profile</a>
			</div>
			<div class="item">
				<a href="./logout"><i class="fas fa-sign-out-alt"></i> Log-Out</a>
			</div>
		</div>
	</div>
	
	<!-- Modal-->
	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title fs-5" id="exampleModalLabel">
						<div class="dot">
							<h1 class="dot-h1"><%=user.getFname().charAt(0)%><%=user.getLname().charAt(0)%></h1>
						</div>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						Name :
						<%=user.getFname()%>
						<%=user.getLname()%></p>
					<p>
						Email :
						<%=user.getEmail()%></p>
					<p>
						Phone Number:
						<%=user.getPhnno()%></p>
					<p>
						JobType :
						<%=user.getJobtype()%></p>
					<p>
						Id :
						<%=user.getId()%>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		charset="utf-8"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			//jquery for toggle sub menus
			$('.sub-btn').click(function() {
				$(this).next('.sub-menu').slideToggle();
				$(this).find('.dropdown').toggleClass('rotate');
			});

			//jquery for expand and collapse the sidebar
			$('.menu-btn').click(function() {
				$('.side-bar').addClass('active');
				$('.menu-btn').css("visibility", "hidden");
			});

			$('.close-btn').click(function() {
				$('.side-bar').removeClass('active');
				$('.menu-btn').css("visibility", "visible");
			});
		});
	</script>

</body>

</html>