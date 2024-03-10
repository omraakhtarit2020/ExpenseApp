<%@page import="com.DAO.LendDAO"%>
<%@page import="com.DAO.BorrowDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Lend"%>
<%@page import="com.entity.Borrow"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
.borrow {
	background-image: linear-gradient(to right, #abc4ff, #b6ccfe, #c1d3fe, #ccdbfd, #d7e3fc,
		#e2eafc, #edf2fb);
	border-radius: 15px;
	box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset,
		rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;
}

.lend {
	background-image: linear-gradient(to right, #abc4ff, #b6ccfe, #c1d3fe, #ccdbfd, #d7e3fc,
		#e2eafc, #edf2fb);
	border-radius: 15px;
	box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset,
		rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;
}

.disabled {
	pointer-events: none;
	opacity: 0.5;
}
</style>
</head>
<body>
	<%@ include file="components/track/exchange_nav.jsp"%>
	<div class="d-flex justify-content-evenly "
		style="margin-top: 5em; height: 100%; margin-left: 2em;">
		<div style="height: auto; width: 40%;" class="lend">
			<p class="text-center fs-4 ">
				<b>Lend List</b>
			</p>
			<!-- Button trigger modal -->

			<button type="button" class="btn btn-dark" data-bs-toggle="modal"
				data-bs-target="#exampleModal"
				style="border-radius: 50%; margin-left: 50%; transform: translateX(-50%);">
				+</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">LEND</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="./addLend" method="POST">
								<div class="form-group row">
									<label for="to" class="col-sm-2 col-form-label">To</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Lended money to whom?" name="to">
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label for="amount" class="col-sm-2 col-form-label">Amount</label>
									<div class="col-sm-10">
										<input type="number" class="form-control"
											placeholder="Enter the amount lended" name="amt">
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label for="date" class="col-sm-2 col-form-label">Date</label>
									<div class="col-sm-10">
										<input type="date" class="form-control"
											placeholder="Enter the Date lended on" name="date">
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" placeholder=""
											name="purpose">
									</div>
								</div>
								<br>
								<fieldset class="form-group">
									<div class="row">
										<legend class="col-form-label col-sm-12 pt-0">Want to
											remind the recipient?</legend>
										<div class="col-sm-10">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="followup"
													id="gridRadios1" value="Yes" checked> <label
													class="form-check-label" for="gridRadios1"> Yes </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="followup"
													id="gridRadios2" value="No"> <label
													class="form-check-label" for="gridRadios2"> No </label>
											</div>
										</div>
									</div>
								</fieldset>
								<button type="submit" class="btn btn-primary"
									style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);"
									onClick="sendRequest()">Save</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="p-4">
				<%
				User user = (User) session.getAttribute("userobj");
				LendDAO dao = new LendDAO(DBConnection.getConn());
				List<Lend> list = dao.getLendById(user.getId());
				String[] color = {"#9ef01a", "#ff4800", "#ff0a54", "#ffb600", "#9448bc", "#99ffff"};
				int colorindex = 0;
				for (Lend lend : list) {
				%>
				<div class="p-1"
					style="background: black; max-width: 25rem; margin-left: 13%; margin-top: 5%;">
					<div class="d-flex justify-content-evenly text-white">
						<div class="p-1 text-center fs-3" data-bs-toggle="tooltip"
							data-bs-title=<%=lend.getTo()%>
							style="background:<%=color[colorindex % color.length]%>;border-radius:50%;width:60px;height:60px;margin-left:-5em;"><%=lend.getTo().charAt(0)%>
						</div>
						<h4><%=lend.getDate().toLocalDate()%></h4>
					</div>
					<span class="fs-5 text-white"><i
						class="bi bi-currency-rupee"></i><b><%=lend.getAmt()%></b>
						</span> 
						
						<span
						style="margin-left: 25%;"> <%
 if (lend.getFollowup().equalsIgnoreCase("Yes")) {
 %>
						<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i
							class="bi bi-envelope-at-fill fs-4 text-white" data-bs-toggle="tooltip"
							data-bs-title="want to send reminder?"></i></a> <%
 }
 %>
					</span>

					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Enter
										the email of recipient</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="./remind" method="get">
										<div class="mb-3">
											 <input type="email" class="form-control"
												id="senderemail" aria-describedby="emailHelp" name="senderemail">
											<div id="emailHelp" class="form-text">We'll never share
												the email with anyone else.</div>
												<input name="to" type="hidden" value=<%=lend.getTo() %>>
												<input name="amt" type="hidden" value=<%=lend.getAmt() %>>
												<input name="date" type="hidden" value=<%=lend.getDate().toLocalDate() %>>
										</div>
										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<span style="transform: translateX(-50%);"><a
						href="./deleteLend?lend_id=<%=lend.getLend_id()%>"><i
							class="bi bi-trash3-fill fs-4 text-white" type="button"></i></a> <a
						data-bs-toggle="modal" data-bs-target="#exampleModalupdatelend"><i
							class="bi bi-pencil-fill fs-4 text-white" type="button"></i></a> </span>

					<div class="modal fade" id="exampleModalupdatelend" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">Update
										LEND</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="./updateLend" method="POST">
										<div class="form-group row">
											<label for="to" class="col-sm-2 col-form-label">To</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													value="<%=lend.getTo()%>" name="to">
											</div>
										</div>
										<br>
										<div class="form-group row">
											<input type="hidden" class="form-control"
												value="<%=lend.getLend_id()%>" name="lend_id">
										</div>
										<br>
										<div class="form-group row">
											<label for="amount" class="col-sm-2 col-form-label">Amount</label>
											<div class="col-sm-10">
												<input type="number" class="form-control"
													value="<%=lend.getAmt()%>" name="amt">
											</div>
										</div>
										<br>
										<div class="form-group row">
											<label for="date" class="col-sm-2 col-form-label">Date</label>
											<div class="col-sm-10">
												<input type="date" class="form-control"
													value="<%=lend.getDate().toLocalDate()%>" name="date">
											</div>
										</div>
										<br>
										<div class="form-group row">
											<label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													value="<%=lend.getPurpose()%>" name="purpose">
											</div>
										</div>
										<br>

										<button type="submit" class="btn btn-primary"
											style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);">Save</button>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>

				<%
				colorindex++;
				}
				%>
			</div>

		</div>

		<!-- Borrow start -->

		<div style="height: auto; width: 40%;" class="borrow">
			<p class="text-center fs-4 ">
				<b>Borrow List</b>
			</p>
			<!-- Button trigger modal -->

			<button type="button" class="btn btn-dark" data-bs-toggle="modal"
				data-bs-target="#exampleModalborrow"
				style="border-radius: 50%; margin-left: 50%; transform: translateX(-50%);">
				+</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModalborrow" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">BORROW</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="./addBorrow" method="POST">
								<div class="form-group row">
									<label for="to" class="col-sm-2 col-form-label">To</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Borrowed money from whom?" name="to" id="borrowto">
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label for="amount" class="col-sm-2 col-form-label">Amount</label>
									<div class="col-sm-10">
										<input type="number" class="form-control"
											placeholder="Enter the amount Borrowed" name="amt" id="borrowamt">
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label for="date" class="col-sm-2 col-form-label">Date</label>
									<div class="col-sm-10">
										<input type="date" class="form-control"
											placeholder="Enter the Date Borrowed on" name="date" id="borrowdate">
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" placeholder=""
											name="purpose" id="borrowpurpose">
									</div>
								</div>
								<br>
								<fieldset class="form-group">
									<div class="row">
										<legend class="col-form-label col-sm-12 pt-0">Want to
											send notification to the lender?</legend>
										<div class="col-sm-10">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="followup"
													id="gridRadios1" value="Yes" checked> <label
													class="form-check-label" for="gridRadios1"> Yes </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="followup"
													id="gridRadios2" value="No"> <label
													class="form-check-label" for="gridRadios2"> No </label>
											</div>
										</div>
									</div>
								</fieldset>
								<button type="submit" class="btn btn-primary"
									style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);" onClick="sendNotification()">Save</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="p-4">
				<%
				BorrowDAO dao2 = new BorrowDAO(DBConnection.getConn());
				List<Borrow> list2 = dao2.getBorrowById(user.getId());
				String[] colors = {"#d00000", "#ffba08", "#8ac926", "#1982c4", "#6a4c93", "#99ffff"};
				int colorIndex = 0;
				for (Borrow borrow : list2) {
				%>

				<div class="p-1 "
					style="background: black; max-width: 25rem; margin-left: 13%; margin-top: 5%;">
					<div class="d-flex justify-content-evenly text-white">
						<div class="p-1 text-center fs-3" data-bs-toggle="tooltip"
							data-bs-title=<%=borrow.getTo()%>
							style="background:<%=colors[colorIndex % colors.length]%>;border-radius:50%;width:60px;height:60px;margin-left:-5em;color:white;"><%=borrow.getTo().charAt(0)%>
						</div>
						<h4><%=borrow.getDate().toLocalDate()%></h4>
					</div>
					<span class="fs-5 text-white"><i
						class="bi bi-currency-rupee"></i><b><%=borrow.getAmt()%></b></span>
					<span
						style="margin-left: 25%;"> <%
 if (borrow.getFollowup().equalsIgnoreCase("Yes")) {
 %>
						<a data-bs-toggle="modal" data-bs-target="#staticBackdropborrow"><i data-bs-toggle="tooltip"
							data-bs-title="Want to send a notification?"
							class="bi bi-envelope-at-fill fs-4 text-white"></i></a> <%
 }
 %>
					</span>

					<div class="modal fade" id="staticBackdropborrow"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Enter
										the email of Lender</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="./notification" method="get">
										<div class="mb-3">
											 <input type="email" class="form-control"
												 aria-describedby="emailHelp" name="lenderemail">
											<div id="emailHelp" class="form-text">We'll never share
												the email with anyone else.</div>
												<input name="to" type="hidden" value=<%=borrow.getTo() %>>
												<input name="amt" type="hidden" value=<%=borrow.getAmt() %>>
												<input name="date" type="hidden" value=<%=borrow.getDate().toLocalDate() %>>
										</div>
										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<span style="transform: translateX(-50%);"><a
						href="./deleteBorrow?borrow_id=<%=borrow.getBorrow_id()%>"><i
							class="bi bi-trash3-fill fs-4 text-white" type="button"></i></a> <a
						data-bs-toggle="modal" data-bs-target="#exampleModalupdateborrow"><i
							class="bi bi-pencil-fill fs-4 text-white" type="button"></i></a> </span>


					<div class="modal fade" id="exampleModalupdateborrow" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">Update
										BORROW</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="./updateBorrow" method="POST">
										<div class="form-group row">
											<label for="to" class="col-sm-2 col-form-label">To</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													value="<%=borrow.getTo()%>" name="to">
											</div>
										</div>
										<br>
										<div class="form-group row">
											<input type="hidden" class="form-control"
												value="<%=borrow.getBorrow_id()%>" name="borrow_id">
										</div>
										<br>
										<div class="form-group row">
											<label for="amount" class="col-sm-2 col-form-label">Amount</label>
											<div class="col-sm-10">
												<input type="number" class="form-control"
													value="<%=borrow.getAmt()%>" name="amt">
											</div>
										</div>
										<br>
										<div class="form-group row">
											<label for="date" class="col-sm-2 col-form-label">Date</label>
											<div class="col-sm-10">
												<input type="date" class="form-control"
													value="<%=borrow.getDate().toLocalDate()%>" name="date">
											</div>
										</div>
										<br>
										<div class="form-group row">
											<label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													value="<%=borrow.getPurpose()%>" name="purpose">
											</div>
										</div>
										<br>
				
										<button type="submit" class="btn btn-primary"
											style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);">Save</button>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>

				<%
				colorIndex++;
				}
				%>
			</div>

		</div>

	</div>

	<!-- Button trigger modal -->
	<!-- checking -->
	<script>
function sendRequest() {
    var to = document.querySelector('input[name="to"]').value;
    var amt = document.querySelector('input[name="amt"]').value;
    var date = document.querySelector('input[name="date"]').value;
    var purpose = document.querySelector('input[name="purpose"]').value;
    
    // Send request to the servlet
    var xhr = new XMLHttpRequest();
    xhr.open('GET', './lendRequest?purpose=' + purpose + '&date=' + date + '&to=' + to + '&amt=' + amt, true);
    xhr.send();
}

function sendNotification() {
    var to = document.querySelector("#borrowto").value;
    var amt = document.querySelector("#borrowamt").value;
    var date = document.querySelector("#borrowdate").value;
    var purpose = document.querySelector("#borrowpurpose").value;
    
    // Send request to the servlet
    var xhr = new XMLHttpRequest();
    xhr.open('GET', './borrowRequest?purpose=' + purpose + '&date=' + date + '&to=' + to + '&amt=' + amt, true);
    xhr.send();
}

</script>
	<script>
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

</body>
</html>