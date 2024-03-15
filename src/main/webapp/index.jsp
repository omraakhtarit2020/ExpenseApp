<%@ page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
#fourth {
    background-image: url(components/indexItems/images/img.png);
    background-repeat: no-repeat;
    background-size: cover;
  }
  #fifth{
  background-image: url(components/indexItems/images/split.webp);
    background-repeat: no-repeat;
    background-size: cover;
  }
 <%@include file="components/indexItems/css.jsp" %>
</style>
</head>
<body>

<%@include file="components/indexItems/nav.jsp" %>


<div id="overall_container">
<div id="first" class="element">
  <p><a href="home.jsp">TRACK YOUR EXPENSE</a></p>
</div>
<div id="second" class="element">
  <p><a href="budgetPlanning.jsp">BUDGET PLANNING</a></p>
</div>
<div id="third" class="element">
  <p><a href="goal.jsp">FINANCIAL GOALS</a></p>
</div>
<div id="fourth" class="element">
  <p><a href="exchange.jsp">EXCHANGE</a></p>
</div>
<div id="fifth" class="element">
  <p><a href="split.jsp">SPLITWISER</a></p>
</div>
</div>







<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>