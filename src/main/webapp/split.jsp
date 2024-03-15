<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.User" %>
<%@page import="com.DAO.SplitDAO"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Split" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<%@include file="components/track/nav.jsp" %>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-top:100px !important;margin-left:50%;transform:translateX(-50%);">
  CREATE GROUP
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Enter Details for splitting bills</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./addSplit" method="post">
          <div class="mb-3">
            <label for="grpname" class="form-label">Enter Your group name</label>
            <input type="text" name="grpname" class="form-control" id="grp_name">
          </div>
          <div>
            <label for="people" class="form-label">Enter the number of people</label>
            <input type="number" name="people" class="form-control" id="noofpeople">
          </div>
          <div>
			    <label class="form-label">Select names of people</label>
			    <% 
			        UserDAO dao = new UserDAO(DBConnection.getConn());
			        List<User> userlist = dao.getAllUser(); 	
			        for(User user : userlist) {
			    %>
			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" name="names" value="<%= user.getFname() + ' ' + user.getLname() %>" id="name_people">
			        <label class="form-check-label" for="<%= user.getId() %>"><%= user.getFname() + ' ' + user.getLname() %></label>
			    </div>
			    <% } %>
          </div>
          <div>
            <label class="form-label">Enter the total amount</label>
            <input type="number" name="amt" class="form-control" id="amount">
          </div>
          <br>
          <button type="submit" class="btn btn-primary" onClick="sendEmail()">Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="container mt-5">
  <% 
    SplitDAO dao2 = new SplitDAO(DBConnection.getConn());
    User user = (User) session.getAttribute("userobj");
    List<Split> list = dao2.getAllSplitById(user.getId());
    int count = 0;
    for (Split sp : list) { 
      if (count % 3 == 0) {
  %>
  <div class="row row-cols-1 row-cols-md-3 g-4">
  <% } %>
    <div class="col">
      <div class="card">
        <div class="card-header border-secondary text-center fs-4" style="background:#DFCCFB";>
          <%= sp.getGrpname() %> 
        </div>
        <div class="card-body">
          <p>Total Amount to be split on : <b><%=sp.getAmt()%></b></p>
          <%
            double amountPerPerson = sp.getAmt() / sp.getPeople();
            for (String name : sp.getNames()) {
          %>
          <p class="card-text"><b><%= name %></b>: <%= amountPerPerson %></p>
          <%
            }
          %>
        </div>
        <div class="card-footer">
          <small class="text-body-secondary">Created on: <%= sp.getDate() %></small>
        </div>
      </div>
    </div>
  <% 
    if (count % 3 == 2 || count == list.size() - 1) {
  %>
  </div>
  <% 
    }
    count++;
  } %>
</div>

<script>
function sendEmail() {
    var grpname = document.querySelector("#grp_name").value;
    var people = document.querySelector("#noofpeople").value;
    var checkedNames = document.querySelectorAll("input[name=names]:checked");
    var names = [];
    for (var i = 0; i < checkedNames.length; i++) {
        names.push(checkedNames[i].value);
    }
    var amt = document.querySelector("#amount").value;
    var namesString = names.join(',');

    var xhr = new XMLHttpRequest();
    xhr.open('GET', './Splitrequest?grpname=' + grpname + '&people=' + people + '&names=' + namesString + '&amt=' + amt, true);
    xhr.send();
}
</script>

</body>
</html>