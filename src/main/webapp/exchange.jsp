<%@page import="com.DAO.LendDAO"%>
<%@page import="com.DAO.BorrowDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Lend"%>
<%@page import="com.entity.Borrow"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Credit Exchange</title>

<Style>
.grid1 {
	height: 400px;
	width: 280px;
}
.grid2 {
	height: 400px;
	width: 280px;
}
.gridm {
	width: 150px;
	margin: 40px;

}
.card {
	border: none;
	box-shadow: rgba(149, 157, 165, 0.5) 0px 8px 24px;
}

.headerLoanBorrow {
	height: 60px;
	text-align: center;
	font-size: 35px;
	font-weight: 450;
}

.loanbody {
	background-color: rgb(250, 249, 248);
	height: 350px;
	overflow-y: auto;
    max-height: 100%;
}

.borrowbody {
	background-color: rgb(250, 249, 248);
	height: 350px;
	overflow-y: auto;
    max-height: 100%;
}

.btn {
	margin-top: 65px;
	height: 50px;
	text-align: center;
	width: 150px;
	cursor: pointer;
}

.btn-one {
	color: rgb(0, 0, 0);
	transition: all 0.3s;
	position: relative;
}

.btn-one span {
	transition: all 0.5s;
}

.btn-one::before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	opacity: 0;
	transition: all 0.3s;
	border-top-width: 1.5px;
	border-bottom-width: 1.5px;
	border-top-style: solid;
	border-bottom-style: solid;
	border-top-color: #af8536;
	border-bottom-color: #af8536;
	transform: scale(0.1, 1);
}

.btn-one:hover span {
	letter-spacing: 2px;
}

.btn-one:hover::before {
	opacity: 1;
	transform: scale(1, 1);
}

.btn-one::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	transition: all 0.3s;
	background-color: rgba(237, 237, 155, 0);
}

.btn-one:hover::after {
	opacity: 0;
	transform: scale(0.1, 1);
}

.box {
	background-color: rgba(78, 191, 239, 0.286);
	height: 94px;
	padding:5px;
	border-bottom-style: dashed;
	border-width: 2px;
	border-bottom-color: #6c3510;
	border-top-left-radius: 10px; /* Add border radius to top-left corner */
    border-top-right-radius: 10px;
}
.loan{
padding-bottom: 10px;
padding-left: 10px;
margin-top: 10px;
}
.borrow{
padding-bottom:10px;
margin-top:10px;
padding-left:10px;
}
.rowg{
padding-top:50px;
padding-left: 40px;
padding-right:40px;
}
.col-md-2{
padding:50px;
}
.rowm{

padding-left: 10px;
padding-right: 10px;
}

.spanBtn{
line-height:35px;
}

.disabled {
	pointer-events: none;
	opacity: 0.5;
}
</Style>
</head>

<body>
<%@ include file="components/track/exchange_nav.jsp"%>
	<div class="container-fluid">
		<div class="row rowg">
			<div class="col grid1">
				<div class="card">
					<div class="card-header headerLoanBorrow" style="background-color: rgb(254, 211, 97);">Loan</div>
					<div class="card-body loanbody">
						<%
							LendDAO dao = new LendDAO(DBConnection.getConn());
							List<Lend> list = dao.getLendById(user.getId());
							for (Lend lend : list) {

							if (list.isEmpty())
							{%>
								<div class="box loan">
									<h6 style="text-align:center; font-size:18px; color:black; padding-top:30px">- No Entry Found -</h6>
								</div>
						<%		
							} else {
								String[] color = {"#9ef01a", "#ff4800", "#ff0a54", "#ffb600", "#9448bc", "#99ffff"};
								int colorindex = 0;
								for (Lend lend1 : list) {

						%>
						<div class="box loan">
						
							<h6><b> To: </b><%=lend1.getTo()%></h6>
							<h6><b>Date: </b> <%=lend1.getDate().toLocalDate()%></h6>
						<span class="fs-6 text-black"><b>Amount: </b><i class="bi bi-currency-rupee"></i><%=lend1.getAmt()%> </span> 
						<span style="margin-left: 25%;"> <%
 							if (lend1.getFollowup().equalsIgnoreCase("Yes")) {
 							%> <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i
								class="bi bi-envelope-at-fill fs-4 text-black"
								data-bs-toggle="tooltip" data-bs-title="want to send reminder?"></i></a>
							<%
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
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="./remind" method="get">
											<div class="mb-3">
												<input type="email" class="form-control" id="senderemail"
													aria-describedby="emailHelp" name="senderemail">
												<div id="emailHelp" class="form-text">We'll never
													share the email with anyone else.</div>
												<input name="to" type="hidden" value=<%=lend.getTo()%>>
												<input name="amt" type="hidden" value=<%=lend.getAmt()%>>
												<input name="date" type="hidden"
													value=<%=lend1.getDate().toLocalDate()%>>
											</div>
											<button type="submit" class="btn btn-primary">Submit</button>
										</form>
									</div>
								</div>
							</div>
						</div>

						<span style="transform: translateX(-50%);"><a
							href="./deleteLend?lend_id=<%=lend1.getLend_id()%>"><i
								class="bi bi-trash3-fill fs-4 text-black" type="button"></i></a> 
								<a  onclick="showLendDetails('<%=lend1.getLend_id()%>','<%= lend1.getTo()%>', '<%= lend1.getAmt() %>', '<%= lend1.getDate().toLocalDate() %>', '<%= lend1.getPurpose() %>')" data-bs-toggle="modal" data-bs-target="#exampleModalupdatelend"><i class="bi bi-pencil-fill fs-4 text-black" type="button"></i></a> 
								<a data-bs-toggle="modal" data-bs-target="#exampleModalupdatelend" onclick="setLendId(<%=lend1.getLend_id()%>)"><i></i></a> </span>

						<div class="modal fade" id="exampleModalupdatelend" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Update
											LOANS</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form >
											<div class="form-group row">
												<label for="to" class="col-sm-2 col-form-label">To</label>
												<div class="col-sm-10">
													<input type="text" class="form-control"
														 name="to" id="lendto">
												</div>
											</div>
											<br>
											<div class="form-group row">
												<input type="hidden" class="form-control" name="lend_id" id="lendid" value="<%=lend1.getLend_id()%>" name="lend_id" id="lendIdInput">
											</div>
											<br>
											<div class="form-group row">
												<label for="amount" class="col-sm-2 col-form-label">Amount</label>
												<div class="col-sm-10">
													<input type="number" class="form-control"
														 name="amt" id="lendamt">
												</div>
											</div>
											<br>
											<div class="form-group row">
												<label for="date" class="col-sm-2 col-form-label">Date</label>
												<div class="col-sm-10">
													<input type="date" class="form-control"
														 name="date" id="lenddate">
												</div>
											</div>
											<br>
											<div class="form-group row">
												<label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
												<div class="col-sm-10">
													<input type="text" class="form-control"
													 name="purpose" id="lendpurpose">
												</div>
											</div>
											<br>

											<button type="submit" class="btn btn-primary"
												style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);" onclick="updateLend()">Save</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<%} %>
					<%
					colorindex++;
					}
					}
					%>
				</div>

			</div>
			
		</div>

	<div class="col-md-2 gridm">
		<div class="row rowm">
			<div class="col justify-content-center box-1">
				<div class="btn btn-one" style="border-width: 1.5px;border-left-color: #af8536;border-right-color: #af8536;" data-bs-toggle="modal"
					data-bs-target="#exampleModalLend">
					<span class="spanBtn">Loan</span>
				</div>
			</div>
		</div>
		<div class="row rowm">
			<div class="col justify-content-center box-1">
				<div class="btn btn-one" style="border-width: 1.5px;border-left-color: #af8536;border-right-color: #af8536;" data-bs-toggle="modal"
					data-bs-target="#exampleModalborrow">
					<span class="spanBtn">Borrow</span>
				</div>
			</div>
		</div>
	</div>
	<div class="col grid2">
		<div class="card">
			<div class="card-header headerLoanBorrow" style="background-color: rgb(254, 211, 97);">Borrow</div>
			<div class="card-body borrowbody">
			<%
						BorrowDAO dao2 = new BorrowDAO(DBConnection.getConn());
						List<Borrow> list2 = dao2.getBorrowById(user.getId());
						for (Borrow borrow : list2) {
						%>
				<div class="box borrow">
						<%if (list2.isEmpty()) {
							%>
								<div class="box borrow">
									<h6 style="text-align:center; font-size:18px; color:#4f5051; padding-top:30px">- No Entry Found -</h6>
								</div>
							<%
								} else {
									String[] colors = {"#d00000", "#ffba08", "#8ac926", "#1982c4", "#6a4c93", "#99ffff"};
									int colorIndex = 0;
									for (Borrow borrow1 : list2) {
							%>
					<div class="box borrow">
					<b>From: </b><%=borrow1.getTo()%>
					<h6><b>Date: </b><%=borrow1.getDate().toLocalDate()%></h6>
							<span class="fs-6 text-black"><b>Amount: </b><i class="bi bi-currency-rupee"></i><%=borrow1.getAmt()%></span> <span style="margin-left: 25%;"> <%
                              if (borrow1.getFollowup().equalsIgnoreCase("Yes")) {
                                %> <a data-bs-toggle="modal" data-bs-target="#staticBackdropborrow"><i
									data-bs-toggle="tooltip"
									data-bs-title="Want to send a notification?"
									class="bi bi-envelope-at-fill fs-4 text-black"></i></a> <%
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
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="./notification" method="get">
												<div class="mb-3">
													<input type="email" class="form-control"
														aria-describedby="emailHelp" name="lenderemail">
													<div id="emailHelp" class="form-text">We'll never
														share the email with anyone else.</div>
													<input name="to" type="hidden" value=<%=borrow1.getTo()%>>
													<input name="amt" type="hidden" value=<%=borrow1.getAmt()%>>
													<input name="date" type="hidden"
														value=<%=borrow1.getDate().toLocalDate()%>>
												</div>
												<button type="submit" class="btn btn-primary">Submit</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<span style="transform: translateX(-50%);"><a
								href="./deleteBorrow?borrow_id=<%=borrow1.getBorrow_id()%>"><i
									class="bi bi-trash3-fill fs-4 text-black" type="button"></i></a> <a onclick="showBorrowDetails('<%=borrow1.getBorrow_id()%>','<%= borrow1.getTo()%>', '<%= borrow1.getAmt()%>', '<%= borrow1.getDate().toLocalDate() %>', '<%= borrow1.getPurpose() %>')"
								data-bs-toggle="modal"
								data-bs-target="#exampleModalupdateborrow"><i
									class="bi bi-pencil-fill fs-4 text-black" type="button"></i></a> </span>


							<div class="modal fade" id="exampleModalupdateborrow"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">Update
												BORROW</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form>
												<div class="form-group row">
													<label for="to" class="col-sm-2 col-form-label">To</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															 name="to" id="borrowto">
													</div>
												</div>
												<br>
												<div class="form-group row">
													<input type="hidden" class="form-control"
														 name="borrow_id" id="borrowid">
												</div>
												<br>
												<div class="form-group row">
													<label for="amount" class="col-sm-2 col-form-label">Amount</label>
													<div class="col-sm-10">
														<input type="number" class="form-control"
															 name="amt" id="borrowamt">
													</div>
												</div>
												<br>
												<div class="form-group row">
													<label for="date" class="col-sm-2 col-form-label">Date</label>
													<div class="col-sm-10">
														<input type="date" class="form-control"
															 name="date" id="borrowdate">
													</div>
												</div>
												<br>
												<div class="form-group row">
													<label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															 name="purpose" id="borrowpurpose">
													</div>
												</div>
												<br>

												<button type="submit" class="btn btn-primary"
													style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);" onclick="updateBorrow()">Save</button>
											</form>
										</div>
									</div>
								</div>
							</div>

						</div>
             
						<%
									}
						colorIndex++;
						}
						}
						%>
					</div>
				</div>
			</div>
		</div>
		</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalLend" tabindex="-1"
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
									placeholder="Enter the amount Borrowed" name="amt"
									id="borrowamt">
							</div>
						</div>
						<br>
						<div class="form-group row">
							<label for="date" class="col-sm-2 col-form-label">Date</label>
							<div class="col-sm-10">
								<input type="date" class="form-control"
									placeholder="Enter the Date Borrowed on" name="date"
									id="borrowdate">
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
							style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);"
							onClick="sendNotification()">Save</button>
					</form>
				</div>
			</div>
		</div>
		</div>
		</div></div>
		

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
    
    function setLendId(id) {
        document.getElementById('lendIdInput').value = id;
    }
    
    </script>
    <script>
    function showLendDetails(lend_id,to, amt, date, purpose) {
        $('#exampleModalupdatelend input[name="to"]').val(to);
        $('#exampleModalupdatelend input[name="amt"]').val(amt);
        $('#exampleModalupdatelend input[name="date"]').val(date);
        $('#exampleModalupdatelend input[name="purpose"]').val(purpose);
        $('#exampleModalupdatelend input[name="lend_id"]').val(lend_id);
    }
    function updateLend() {
        var to = document.querySelector("#lendto").value;
        var amt = document.querySelector("#lendamt").value;
        var date = document.querySelector("#lenddate").value;
        var purpose = document.querySelector("#lendpurpose").value;
        var id = document.querySelector("#lendid").value;

        var xhr = new XMLHttpRequest();
        xhr.open('POST', './updateLend?purpose=' + purpose + '&date=' + date + '&to=' + to + '&amt=' + amt + '&lend_id=' + id, true);
        xhr.send();
    }
    
    
    function showBorrowDetails(borrow_id,to, amt, date, purpose) {
        $('#exampleModalupdateborrow input[name="to"]').val(to);
        $('#exampleModalupdateborrow input[name="amt"]').val(amt);
        $('#exampleModalupdateborrow input[name="date"]').val(date);
        $('#exampleModalupdateborrow input[name="purpose"]').val(purpose);
        $('#exampleModalupdateborrow input[name="borrow_id"]').val(borrow_id);
    }
    function updateBorrow() {
        var to = document.querySelector("#borrowto").value;
        var amt = document.querySelector("#borrowamt").value;
        var date = document.querySelector("#borrowdate").value;
        var purpose = document.querySelector("#borrowpurpose").value;
        var id = document.querySelector("#borrowid").value;

        var xhr = new XMLHttpRequest();
        xhr.open('POST', './updateBorrow?purpose=' + purpose + '&date=' + date + '&to=' + to + '&amt=' + amt + '&borrow_id=' + id, true);
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
