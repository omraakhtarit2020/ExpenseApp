<%@ page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <nav class="navbar navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Expense Tracker</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Expense Tracker</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp"><button class="btn btn-warning col-12">Home</button></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"><button class="btn btn-danger col-12" data-bs-toggle="modal" data-bs-target="#exampleModal">Profile</button></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./logout"><button class="btn btn-success col-12">Logout</button></a>
          </li>
        </ul>
      </div>
    </div>
  </div> 
</nav>
   
   
   <!-- Modal -->
       <%
          User user=(User) session.getAttribute("userobj");
        %>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title fs-5" id="exampleModalLabel">
          <div class="dot">
            <h1><%=user.getFname().charAt(0) %><%=user.getLname().charAt(0) %></h1>
          </div>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
           <p>Name        : <%=user.getFname() %> <%=user.getLname() %></p>
           <p>Email       : <%=user.getEmail() %></p>
           <p>Phone Number: <%=user.getPhnno() %></p>
           <p>JobType     : <%=user.getJobtype() %></p>
           <p>Id          : <%=user.getId() %>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
</body>
</html>