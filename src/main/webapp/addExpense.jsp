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
</head>
<body>
<%@include file="components/track/nav.jsp"  %>

<div class="container" style="margin-top:100px !important;">
   <form action="./addExpense" method="POST">
 <div class="input-group mb-3 w-50 " >
	  <label class="input-group-text" for="type">Expense type</label>
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
  <div class="input-group mb-3 w-50">
    <label for="income" class="input-group-text">Expense in rupee</label>
    <input type="number" class="form-control" name="expense">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

</body>
</html>