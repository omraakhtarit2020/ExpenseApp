<%@page import="com.DAO.LendDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Lend" %>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<%@ include file="components/track/exchange_nav.jsp" %>
<div class="d-flex" style="margin-top:10em;height:500px;">
<div style="height:300px;width:50%;">
<p class="text-center">Your Lend List </p>
<!-- Button trigger modal -->

<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-radius:50%;margin-left:50%;transform:translateX(-50%);">
  +
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">LEND</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./addLend" method="POST">
					  <div class="form-group row">
					    <label for="to" class="col-sm-2 col-form-label">To</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control"  placeholder="Lended money to whom?" name="to">
					    </div>
					  </div>
					  <br>
					  <div class="form-group row">
					    <label for="amount" class="col-sm-2 col-form-label">Amount</label>
					    <div class="col-sm-10">
					      <input type="number" class="form-control"  placeholder="Enter the amount lended" name="amt">
					    </div>
					  </div>
					  <br>
					  <div class="form-group row">
					    <label for="date" class="col-sm-2 col-form-label">Date</label>
					    <div class="col-sm-10">
					      <input type="date" class="form-control"  placeholder="Enter the Date lended on" name="date">
					    </div>
					  </div>
					  <br>
					  <div class="form-group row">
					    <label for="purpose" class="col-sm-2 col-form-label">Purpose</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control"  placeholder="" name="purpose">
					    </div>
					  </div>
					  <br>
					  <fieldset class="form-group">
					    <div class="row">
					      <legend class="col-form-label col-sm-12 pt-0">Want to remind you for follow-up?</legend>
					      <div class="col-sm-10">
					        <div class="form-check">
					          <input class="form-check-input" type="radio" name="followup" id="gridRadios1" value="Yes" checked>
					          <label class="form-check-label" for="gridRadios1">
					            Yes
					          </label>
					        </div>
					        <div class="form-check">
					          <input class="form-check-input" type="radio" name="followup" id="gridRadios2" value="No">
					          <label class="form-check-label" for="gridRadios2">
					           No
					          </label>
					        </div>
					      </div>
					    </div>
					  </fieldset>
					  <button type="submit" class="btn btn-primary" style="margin-top:15px;margin-left:50%;transform:translateX(-50%);">Save</button>
      </form>
      </div>
    </div>
  </div>
</div>

<div class="px-3">
    <%
          User user=(User) session.getAttribute("userobj");
         LendDAO dao=new LendDAO(DBConnection.getConn());
         List<Lend> list=dao.getLendById(user.getId());
	     for(Lend lend:list){
	%>
	  <p class=" p-3" style="background:#f7ffe0;border-left:5px solid #008000;min-width: 20rem;"><b><%=lend.getTo()%> :</b> <span><%=lend.getAmt()%></span>
	    <!-- <button class="btn btn-outline-secondary" style="margin-left:100px;">Delete</button> -->
	     <span><cite style="margin-left:15%;color:#48cae4"><%=lend.getDate().toLocalDate() %>&nbsp&nbsp</cite></span>
	  </p>
	 
	<%} %>
	</div>

</div>
</div>

<!-- Button trigger modal -->
<!-- checking -->


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
  
</body>
</html>