<%@page import="com.DAO.IncomeDAO"%>
<%@page import="com.DAO.ExpenseDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.User_income" %>
<%@page import="com.entity.User_expense" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track your Expense</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
.add_button{
    background: rgba(3,7,30,0.60);
    width: max-content;
    display: block;
    padding: 0.7rem 1.7rem;
    z-index: 2;
    position: fixed;
    left: 50%;
    transform: translateX(-50%);
    bottom: 2rem;
    gap: 0.8rem;
    border-radius: 3rem;
}
</style>
</head>
<body>
<%@ include file="components/track/nav.jsp" %>
<div class="container p-5" style="margin-top:60px !important;">
  <div class="text-center">
  </div>
   <%
          User user=(User) session.getAttribute("userobj");
         ExpenseDAO d=new ExpenseDAO(DBConnection.getConn());
         long totalexp=d.totalExpense(user.getId());
         
         IncomeDAO d1=new IncomeDAO(DBConnection.getConn());
         long totalinc=d1.totalIncome(user.getId());
	%>
  <div class="d-flex justify-content-evenly"> 
		  <div class="card text-bg-warning mb-3" style="min-width: 18rem;">
		  <div class="card-header text-center"><b>BALANCE</b></div>
		  <div class="card-body">
		    <h5 class="card-title"><%=totalinc-totalexp%></h5>
		  </div>
		 </div>
		 
		 <div class="card text-bg-success mb-3" style="min-width: 18rem;">
		  <div class="card-header text-center"><b>INCOME</b></div>
		  <div class="card-body">
		    <h5 class="card-title"><%=totalinc %></h5>
		  </div>
		 </div>
		 
		 <div class="card text-bg-danger mb-3" style="min-width: 18rem;">
		  <div class="card-header text-center"><b>EXPENSE</b></div>
		  <div class="card-body">
		    <h5 class="card-title"><%=totalexp %></h5>
		  </div>
		 </div>
  </div>
</div>


     <h4 class="text-center p-2"><b>TRANSACTIONS</b></h4>
<div class=" container d-flex justify-content-between w-50 p-2" style="margin-top:5px !important;" >
     <div class="px-3">
    <%
         IncomeDAO dao=new IncomeDAO(DBConnection.getConn());
         List<User_income> list=dao.getIncomeById(user.getId());
	     for(User_income inc:list){
	%>
	  <p class=" p-3" style="background:#f7ffe0;border-left:5px solid #008000;min-width: 20rem;"><b><%=inc.getType()%> :</b> <span><%=inc.getIncome()%></span>
	    <!-- <button class="btn btn-outline-secondary" style="margin-left:100px;">Delete</button> -->
	     <span><cite style="margin-left:15%;color:#48cae4"><%=inc.getDate().toLocalDate() %>&nbsp&nbsp</cite></span>
	     <a href="./deleteIncome?inco_id=<%=inc.getInco_id()%>" type="button"><i class="bi bi-trash3-fill"></i></a>
	     <a href="./EditIncome?inco_id=<%=inc.getInco_id()%>" type="button"><i class="bi bi-pencil-fill"></i></a>
	  </p>
	 
	<%} %>
	</div>
	
	
     <div class="px-3">
    <%
         ExpenseDAO dao2=new ExpenseDAO(DBConnection.getConn());
          
         List<User_expense> list2=dao2.getExpenseById(user.getId());
	     for(User_expense exp:list2){
	%>
	  <p class="p-3" style="background:#f7ffe0;border-left:5px solid #d00000;min-width: 20rem;"><b><%=exp.getType()%>:</b> <span><%=exp.getExpense()%></span>	  
	     	    <span><cite style="margin-left:30%;color:#48cae4"><%=exp.getDate().toLocalDate() %></cite></span>
	     	    <a href="./deleteExpense?exp_id=<%=exp.getExp_id()%>"><button class="btn btn-outline-warning py-0" style="margin-left:6em; margin-top:5px;">DELETE</button></a>
	  </p>

	
	<%} %> 
	</div>
</div>
<div class="add_button" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"><h2>+</h2></div>

<a href="./download" class="d-flex justify-content-center align-items-center text-decoration-none" >Download All Transactions</a>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex justify-content-evenly align-items-center">
        <a  href="addIncome.jsp"><button class="btn btn-outline-success ">Add Income</button></a>
        <a  href="addExpense.jsp"><button class="btn btn-outline-danger ">Add Expense</button></a>
      </div>
    </div>
  </div>
</div>



</body>
</html>