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
<title>Insert title here</title>
</head>
<body>
<%@include file="components/track/nav.jsp"  %>
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
			    <input type="number" class="form-control" name="income">
			  </div>
			  <button type="submit" class="btn btn-success">ADD</button>
		</form>
      </div>
    </div>
  </div>
</div>
</div>


</body>
</html>