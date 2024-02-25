<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<title>Financial-Goal</title>

<style>

.icon {
	padding-top: 60px;
	height: 60%;
}

.button {
	height: 40%;
}

.icon2 {
	padding-top: 60px;
	height: 60%;
}

.button2 {
	height: 40%;
}

.icon3 {
	padding-top: 50px;
	height: 60%;
}

.button3 {
	height: 40%;
}

.goal {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	width: 37vh;
	height: 40vh;
	position: absolute;
	top: 50%;
	left: 25%;
	transform: translate(-50%, -50%);
	background-color: rgb(129, 104, 74);
	padding: 20px;
	border-radius: 30px;
	transition: background-color 0.3s ease, width 0.3s ease, height 0.3s
		ease, border-radius 0.3s ease, font-size 0.5s ease;
	box-shadow: 5px 5px 7px rgba(64, 49, 39, 0.3);
}

.goal:hover {
	background-color: rgb(185, 148, 103);
	/* Change the background color on hover */
	width: 40vh; /* Increase the width on hover */
	height: 43vh; /* Increase the height on hover */
	border-radius: 27px;
	box-shadow: 7px 7px 10px rgba(64, 49, 39, 0.5);
	font-size: 66px;
}

.emi {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	position: relative; /* Change to relative */
	z-index: 1050; /* Ensure it appears above the modal */
	width: 37vh;
	height: 40vh;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgb(185, 148, 103);
	padding: 20px;
	border-radius: 30px;
	transition: background-color 0.3s ease, width 0.3s ease, height 0.3s
		ease, border-radius 0.3s ease, font-size 0.5s ease;
	box-shadow: 5px 5px 7px rgba(100, 74, 57, 0.3);
}

.emi:hover {
	background-color: rgb(129, 104, 74);
	/* Change the background color on hover */
	width: 40vh; /* Increase the width on hover */
	height: 43vh; /* Increase the height on hover */
	border-radius: 27px;
	box-shadow: 7px 7px 10px rgba(100, 74, 57, 0.5);
	font-size: 66px;
}

.loan {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	width: 37vh;
	height: 40vh;
	position: absolute;
	top: 50%;
	left: 75%;
	transform: translate(-50%, -50%);
	background-color: rgb(129, 104, 74);
	padding: 30px;
	border-radius: 30px;
	transition: background-color 0.3s ease, width 0.3s ease, height 0.3s
		ease, border-radius 0.3s ease, font-size 0.5s ease;
	box-shadow: 5px 5px 7px rgba(64, 49, 39, 0.3);
}

.loan:hover {
	background-color: rgb(185, 148, 103);
	/* Change the background color on hover */
	width: 40vh; /* Increase the width on hover */
	height: 43vh; /* Increase the height on hover */
	border-radius: 27px;
	box-shadow: 7px 7px 10px rgba(64, 49, 39, 0.5);
	font-size: 66px;
}

.calc {
	color: white;
	font-size: 60px;
}

.mont {
	color: black;
	font-size: 60px;
}

.landmrk {
	color: white;
	font-size: 60px;
}

/* Media query for smaller screens */
@media ( max-width : 1000px) {
	.goal, .emi, .loan {
		position: relative; /* Remove absolute positioning */
		width: auto; /* Reset width */
		height: auto; /* Reset height */
		margin-bottom: 20px; /* Add margin to separate divs */
		top: initial; /* Reset top position */
		left: initial; /* Reset left position */
		transform: initial; /* Reset transform */
	}
}
</style>
<!-- loan calc -->
<style>
.loanCalculator {
	font-family: "roboto", sans-serif;
	width: 600px;
	margin: auto;
	background: #fff;
	box-shadow: 0 12px 50px -11px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	color: #4a4885;
	overflow: hidden;
}

.loanCalculator, .loanCalculator * {
	box-sizing: border-box;
}

.loanCalculator .top {
	background: #97754d;
	color: #fff;
	padding: 32px;
}

.loanCalculator form {
	display: flex;
	gap: 8px;
	justify-content: space-between;
}

.loanCalculator .title {
	margin-bottom: 16px;
}

.loanCalculator form input {
	font-size: 20px;
	padding: 8px 24px;
	width: 100%;
}

.loanCalculator .result {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.loanCalculator .result .left {
	width: 100%;
	padding: 8px 32px;
}

.loanCalculator .left h3 {
	font-size: 16px;
	font-weight: 400;
	margin-bottom: 8px;
}

.loanCalculator .result .value {
	font-size: 30px;
	font-weight: 700;
	padding-bottom: 10px;
	border-bottom: 1px solid rgba(33, 56, 105, 0.477);
}

.loanCalculator .result .value::before {
	content: "Rs";
	font-size: 18px;
	font-weight: 400;
	margin-right: 6px;
	opacity: 0.4;
}

.loanCalculator .calculateBtn {
	background-color: #512b0dc8;
	color: #fff;
	border: none;
	padding: 8px 32px;
	border-radius: 8px;
	font-size: 18px;
	font-weight: 900;
	cursor: pointer;
	margin: 24px 0;
}

#refreshBtn {
	background-color: #97754d;
}

#loanModal {
	max-width: 650px;
}

@media ( max-width :650px) {
	.loanCalculator {
		width: 90%;
		max-width: 500px;
	}
	.loanCalculator form {
		flex-direction: column;
		gap: 20px;
	}
	.loanCalculator .result {
		flex-direction: column;
		text-align: center;
	}
}
</style>
<!-- goal calc -->
<style>
.goalCalculator {
	font-family: "roboto", sans-serif;
	width: 600px;
	margin: auto;
	background: #fff;
	box-shadow: 0 12px 50px -11px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	color: #4a4885;
	overflow: hidden;
}

.goalCalculator, .goalCalculator * {
	box-sizing: border-box;
}

.goalCalculator .top {
	background: #97754d;
	color: #fff;
	padding: 32px;
}

.goalCalculator form {
	display: flex;
	gap: 8px;
	justify-content: space-between;
}

.goalCalculator .title {
	margin-bottom: 16px;
}

.goalCalculator form input {
	font-size: 20px;
	padding: 8px 24px;
	width: 100%;
}

.goalCalculator .result {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.goalCalculator .result .left {
	width: 100%;
	padding: 8px 32px;
}

.goalCalculator .left h3 {
	font-size: 16px;
	font-weight: 400;
	margin-bottom: 8px;
}

.goalCalculator .result .value {
	font-size: 30px;
	font-weight: 700;
	padding-bottom: 10px;
	border-bottom: 1px solid rgba(33, 56, 105, 0.477);
}

.goalCalculator .result .value::before {
	content: "Rs";
	font-size: 18px;
	font-weight: 400;
	margin-right: 6px;
	opacity: 0.4;
}

.goalCalculator .calculateGBtn {
	background-color: #512b0dc8;
	color: #fff;
	border: none;
	padding: 8px 32px;
	border-radius: 8px;
	font-size: 18px;
	font-weight: 900;
	cursor: pointer;
	margin: 24px 0;
}

#refreshGBtn {
	background-color: #97754d;
}

#goalModal {
	max-width: 650px;
}

@media ( max-width :650px) {
	.goalCalculator {
		width: 90%;
		max-width: 500px;
	}
	.goalCalculator form {
		flex-direction: column;
		gap: 20px;
	}
	.goalCalculator .result {
		flex-direction: column;
		text-align: center;
	}
}
</style>
<!-- emi calc -->
<style>
.emiCalculator {
	font-family: "roboto", sans-serif;
	width: 600px;
	margin: auto;
	background: #fff;
	box-shadow: 0 12px 50px -11px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	color: #4a4885;
	overflow: hidden;
}

.emiCalculator, .emiCalculator * {
	box-sizing: border-box;
}

.emiCalculator .top {
	background: #97754d;
	color: #fff;
	padding: 32px;
}

.emiCalculator form {
	display: flex;
	gap: 8px;
	justify-content: space-between;
}

.emiCalculator .title {
	margin-bottom: 16px;
}

.emiCalculator form input {
	font-size: 20px;
	padding: 8px 24px;
	width: 100%;
}

.emiCalculator .result {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.emiCalculator .result .left {
	width: 100%;
	padding: 8px 32px;
}

.emiCalculator .left h3 {
	font-size: 16px;
	font-weight: 400;
	margin-bottom: 8px;
}

.emiCalculator .result .value {
	font-size: 30px;
	font-weight: 700;
	padding-bottom: 10px;
	border-bottom: 1px solid rgba(33, 56, 105, 0.477);
}

.emiCalculator .result .value::before {
	content: "Rs";
	font-size: 18px;
	font-weight: 400;
	margin-right: 6px;
	opacity: 0.4;
}

.emiCalculator .calculateEBtn {
	background-color: #97754d;
	color: #fff;
	border: none;
	padding: 8px 32px;
	border-radius: 8px;
	font-size: 18px;
	font-weight: 900;
	cursor: pointer;
	margin: 24px 0;
}

#refreshEBtn {
	background-color: #512b0dc8;
}

#emiModal {
	max-width: 650px
}

@media ( max-width :650px) {
	.emiCalculator {
		width: 90%;
		max-width: 500px;
	}
	.emiCalculator form {
		flex-direction: column;
		gap: 20px;
	}
	.emiCalculator .result {
		flex-direction: column;
		text-align: center;
	}
}

.popup {
	width: 400px;
	background: #f7f0ea;
	border-radius: 6px;
	position: absolute;
	top: 0%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0.1);
	text-align: center;
	padding: 0 30px 30px;
	color: #303030;
	transition: transform 0.4s, top 0.4s;
	visibility: hidden;
}

.open-popup {
	visibility: visible;
	top: 50%;
	transform: translate(-50%, -50%) scale(1);
}

.popup h2 {
	font-size: 30px;
	font-weight: 500;
	margin: 30px 0;
}

.popup .bell {
	background-color: #d42367;
	align-items: center;
	font-size: 45px;
	height: 90px;
	width: 100px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	padding: 10px 10px;
	border-radius: 50%;
	color: #fff;
	border: none;
	margin-top: -50px;
}

.popup .popup-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.popup .popup-buttons button {
	width: 48%; /* Adjust as needed */
	padding: 10px 0;
	background-color: #d72c68;
	color: #fff;
	border: 0;
	outline: none;
	font-size: 18px;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease;
	/* Add transition for smooth effect */
}

/* Hover effect */
.popup .popup-buttons button:hover {
	background-color: #b71752; /* Change background color on hover */
}
</style>
</head>
<body>
	<%@include file="components/indexItems/nav.jsp"%>


	<!-- Button trigger modal -->
	<div class="goal">
		<div class="icon">
			<span class="fa-solid fa-calculator calc"></span>
		</div>
		<button type="button" class="btn btn-primary button"
			data-bs-toggle="modal" data-bs-target="#exampleModalgoal"
			style="background-color: transparent; border: none; color: white;">
			<b>Goals Calculator</b>
		</button>
	</div>

	<!-- Modal1 -->
	<div class="modal fade" id="exampleModalgoal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="goalModal">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Goal
						Calculator</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="goalCalculator">
						<div class="top">

							<!--h2>Goal Calculator</h2-->
							<form action="goalServlet" method="POST">
								<div class="group">
									<div class="title">Initial Amount</div>
									<input name="principal" type="text" value=""
										class="initialAmount">
								</div>
								<div class="group">
									<div class="title">Interest Rate</div>
									<input name="intRate" type="text" value=""
										class="interestGRate">
								</div>
								<div class="group">
									<div class="title">Inflation Rate</div>
									<input name="infRate" type="text" value=""
										class="inflationRate">
								</div>
								<div class="group">
									<div class="title">Tenure</div>
									<input name="year" type="text" value="" class="year">
								</div>
								<div class="popup" id="popup">
									<span class="fa-solid fa-bell bell"></span>
									<h2>Do you want a reminder?</h2>
									<div class="popup-buttons">
										<button type="submit" onclick="closePopup()" class="yes">Yes</button>
										<button onclick="closePopup()" class="no">No</button>
									</div>
								</div>
							</form>
						</div>
						<div class="result">
							<div class="left">
								<div class="finalAmount">
									<h3>Final Amount</h3>
									<div name="finalAmnt" class="value">123</div>
								</div>
								<div class="monthlyInvestment">
									<h3>Monthly Investment</h3>
									<div name="monthly" class="value">12345</div>
								</div>

								<button class="calculateGBtn">Calculate</button>
								<button class="calculateGBtn" id="refreshGBtn">Refresh</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- emi -->
	<div class="emi">
		<div class="icon2">
			<span class="fa-solid fa-money-bill-transfer mont"></span>
		</div>
		<button type="button" class="btn btn-primary button2"
			data-bs-toggle="modal" data-bs-target="#emi"
			style="background-color: transparent; border: none; color: black;">
			<b>EMI Calculator</b>
		</button>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="emi" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="emiModal">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">EMI
						Calculator</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="emiCalculator">
						<div class="top">
							<!--h2>EMI Calculator</h2-->
							<form action="#">
								<div class="group">
									<div class="title">Principal Amount</div>
									<input type="text" value="" class="pAmount">
								</div>
								<div class="group">
									<div class="title">Rate of Interest</div>
									<input type="text" value="" class="rate">
								</div>
								<div class="group">
									<div class="title">Months</div>
									<input type="text" value="" class="months">
								</div>
							</form>
						</div>
						<div class="result">
							<div class="left">
								<div class="emiMon">
									<h3>Monthly EMI</h3>
									<div class="value">12345</div>
								</div>
								<div class="totalInterestEmi">
									<h3>Total Interest Amount</h3>
									<div class="value">12345</div>
								</div>
								<div class="totalPayable">
									<h3>Total Amount</h3>
									<div class="value">12345</div>
								</div>

								<button class="calculateEBtn">Calculate</button>
								<button class="calculateEBtn" id="refreshEBtn">Refresh</button>
								<button class="fa-solid fa-bell bell"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Loan -->
	<!-- Button trigger modal -->
	<div class="loan">
		<div class="icon3">
			<span class="fa-solid fa-landmark  landmrk"></span>
		</div>
		<button type="button" class="btn btn-primary  button3"
			data-bs-toggle="modal" data-bs-target="#exampleModalloan"
			style="background-color: transparent; border: none; color: white;">
			<b>Loan calculator</b>
		</button>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModalloan" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="loanModal">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Loan
						Calculator</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="loanCalculator">
						<div class="top">
							<!--h2>Loan Calculator</h2-->
							<form action="#">
								<div class="group">
									<div class="title">Amount</div>
									<input type="text" value="" class="loanAmount">
								</div>
								<div class="group">
									<div class="title">Interest Rate</div>
									<input type="text" value="" class="interestRate">
								</div>
								<div class="group">
									<div class="title">Tenure</div>
									<input type="text" value="" class="loanTenure">
								</div>
							</form>
						</div>
						<div class="result">
							<div class="left">
								<div class="loanEmi">
									<h3>Annual Payment</h3>
									<div class="value">12345</div>
								</div>
								<div class="totalInterest">
									<h3>Total Interest</h3>
									<div class="value">12345</div>
								</div>
								<div class="totalAmount">
									<h3>Total Amount</h3>
									<div class="value">12345</div>
								</div>

								<button class="calculateBtn">Calculate</button>
								<button class="calculateBtn" id="refreshBtn">Refresh</button>
								<button class="fa-solid fa-bell bell"></button>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
		
	</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<!-- Include script.js -->
	<script src="financialGoal.js"></script>

</body>
</html>