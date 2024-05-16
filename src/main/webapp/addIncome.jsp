<%@page import="com.DAO.TypeDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Type" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>D.O.S.T</title>
<link rel="icon" type="images/icon" href="images/logo.png">
</head>
<body>
<%@include file="components/track/nav.jsp"  %>
<div id="alertContainer" style="max-width:550px;margin-left:30%;"></div>
<div class="container d-flex justify-content-center align-items-center" style="margin-top:100px !important;">
<div class="card mb-3" style="min-width: 540px;min-height:240px;" >
  <div class="row g-0">
    <div class="col-md-5">
      <img src="./images/earned.gif" class="img-fluid " style="height:100%;" alt="...">
    </div>
    <div class="col-md-7">
      <div class="card-body">
        <h5 class="card-title fs-3">Add to Your <cite>Income</cite></h5>
        <br>
         <form action="./addIncome" method="POST">
			 <div class="mb-3" >
				  <label for="type">Enter your Income Type</label>
				  <select class="form-select" name="type">
				    <option selected>Choose...</option>
				    <%
				    TypeDAO opt = new TypeDAO(DBConnection.getConn());
					List<Type> list=opt.getAllType();
					for(Type ty:list){
					%>
									      
				     <option><%=ty.getTypeDesc()%></option>
					 <%} %>
				  </select>
			 </div>
			  <div class="mb-3">
			    <label for="income">Enter the amount earned</label>
			    <input type="number" class="form-control" name="income" id="income" oninput="checkIncome()" required>
			  </div>
			  <button type="submit" class="btn btn-success">ADD</button>
		</form>
      </div>
    </div>
  </div>
</div>
</div>

<script>
function checkIncome() {
  var income = document.getElementById("income").value;
  if (income < 0) {
    displayAlert();
    document.getElementById("income").value = ""; 
  }
}
function displayAlert() {
	  var alertContainer = document.getElementById("alertContainer");
	  var alertDiv = document.createElement("div");
	  alertDiv.classList.add("alert", "alert-danger", "alert-dismissible", "fade", "show");
	  alertDiv.setAttribute("role", "alert");
	  alertDiv.innerHTML = `
	    <strong>Income cannot be negative!</strong> please enter positive value.
	    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	  `;
	  alertContainer.appendChild(alertDiv);
	}
</script>
</body>
</html>