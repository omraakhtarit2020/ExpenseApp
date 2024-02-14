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
<div class="container" style="margin-top:100px !important;">
   <form action="./addIncome" method="POST">
 <div class="input-group mb-3 w-50 " >
	  <label class="input-group-text" for="type">Income type</label>
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
  <div class="input-group mb-3 w-50">
    <label for="income" class="input-group-text">Income in rupee</label>
    <input type="number" class="form-control" name="income">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

</body>
</html>