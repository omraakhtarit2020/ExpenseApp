<%@page import="com.DAO.TypeExpenseDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.TypeExpense" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%@include file="components/track/nav.jsp"%>
<div class="container d-flex justify-content-center align-items-center" style="margin-top:150px !important;">
<div class="card mb-3" style="min-width: 540px;min-height:240px;" >
  <div class="row g-0">
    <div class="col-md-5">
      <img src="./images/spent.gif" class="img-fluid " style="height:100%;" alt="...">
    </div>
    <div class="col-md-7">
      <div class="card-body">
        <h5 class="card-title fs-3">Add to Your <cite>Expense</cite></h5>
        <br>
        <form action="./addExpense" method="POST">
			 <div class="mb-3" >
				  <label for="type">Enter your Expense Type</label>
				  <select class="form-select" name="type">
				    <option selected>Choose...</option>
				    <%
						TypeExpenseDAO opt = new TypeExpenseDAO(DBConnection.getConn());
						List<TypeExpense> list=opt.getAllType();
						for(TypeExpense ty:list){
					%>
									      
				     <option><%=ty.getTypeDesc()%></option>
					 <%} %>
				  </select>
			 </div>
			  <div class="mb-3">
			    <label for="expense">Enter the amount spent</label>
			    <input type="number" class="form-control" name="expense">
			  </div>
			  <button type="submit" class="btn btn-warning">ADD</button>
		</form>
      </div>
    </div>
  </div>
</div>
</div>


</body>
</html>