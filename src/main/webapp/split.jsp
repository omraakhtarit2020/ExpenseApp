<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.User" %>
<%@page import="com.DAO.*"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.Split" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>D.O.S.T</title>
<link rel="icon" type="images/icon" href="images/logo.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
.hide{
 display:none;
}
</style>
</head>
<body>
<%@ include file="components/track/splitNav.jsp"%>
<!-- Button trigger modal -->
<div id="alertContainer" style="max-width:550px;margin-left:30%;"></div>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalsplit" style="margin-top:50px !important;margin-left:50%;transform:translateX(-50%);">
  CREATE GROUP
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalsplit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
   <div class="accordion accordion-flush" id="accordionFlushExample">
      <div class="accordion-item">
         <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
            <em>GROUP</em>
            </button>
         </h2>
         <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">
               <div class="row row-cols-1 row-cols-md-3 g-4">
               <% 
                  SplitDAO dao2 = new SplitDAO(DBConnection.getConn());
                  User user = (User) session.getAttribute("userobj");
                  GroupMembershipDAO gdao = new GroupMembershipDAO(DBConnection.getConn());
                  List<Integer> ownedGroupIds = gdao.getGroupIdsByUserAndRole(user.getId(), "Owner");
                  
                  for (Integer groupId : ownedGroupIds) {
                      Split sp = dao2.getSplitByGroupId(groupId);
                      System.out.println(sp.toString()+" "+groupId);
               %>
                  <div class="col">
                    <div class="card text-bg-dark mb-3" style="max-width: 18rem;">
                        <div class="card-header text-center fs-4" style="background:#DFCCFB";>
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
                        <div class="card-footer text-center">
                           <small class="text-white">Created on: <%= sp.getDate() %></small>
                           <% 
                               String status=dao2.getStatus(groupId);
                                System.out.println(status);
                              if (status.equalsIgnoreCase("Paid")){ %>
                              <button type="button" class="btn btn-success" style="width:100%;color:white;" onclick="statusReview()">PAID</button>
                         <%}else{ %>
                         <button type="button" class="btn btn-warning" style="width:100%;"data-bs-toggle="modal" data-bs-target="#exampleModalstatus">PENDING <i class="bi bi-hourglass-split"></i></button>
                           <div class="modal fade" id="exampleModalstatus" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel" style="color:black;">Hey, <%=user.getFname().toUpperCase()%> </h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							       <form action="./UpdateStatusServlet" method="post">
                                      <input type="text" name="grpId" value="<%= groupId %>" >
                                      <input type="text" name="OwnerId" value="<%= user.getId() %>">
                                       <label style="color:black;">Has the purpose of the group been fulfilled and the payment completed?</label>
		                               <div class="mt-3">
		                               <button type="submit" class="btn btn-primary">Yes</button>
		                               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
		                           </div>
                                    </form>
							      </div>
							    </div>
							  </div>
							  </div>
							  <%} %>

                        </div>
                     </div>
                  </div>
               <% } %>
               </div>
            </div>
         </div>
      </div>
      <div class="accordion-item">
         <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
            <em>MEMBER</em>
            </button>
         </h2>
         <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">
               <div class="row row-cols-1 row-cols-md-3 g-4">
               <% 
                  List<Integer> memberGroupIds = gdao.getGroupIdsByUserAndRole(user.getId(), "Member");
                  for (Integer groupId : memberGroupIds) {
                      Split sp = dao2.getSplitByGroupId(groupId);
               %>
                  <div class="col">
                    <div class="card text-bg-dark mb-3" style="max-width: 18rem;">
                        <div class="card-header text-center fs-4" style="background:#DFCCFB";>
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
                           <small class="text-white">Created on: <%= sp.getDate() %></small>
                           <% 
                               String status=dao2.getStatus(groupId);
                                System.out.println(status);
                              if (status.equalsIgnoreCase("Paid")){ %>
                              <button type="button" class=" btn btn-success" style="width:100%;color:white;" onclick="statusReview()">PAID</button>
                         <%}else{ %>
                         <button type="button" class=" btn btn-warning" style="width:100%;" onclick="statusReviewPending()">PENDING</button>
                         <%} %>
                        </div>
                     </div>
                  </div>
               <% } %>
               </div>
            </div>
         </div>
      </div>
   </div>
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
<script type="text/javascript">
function statusReview(){
	var alertContainer = document.getElementById("alertContainer");
	  var alertDiv = document.createElement("div");
	  alertDiv.classList.add("alert", "alert-success", "alert-dismissible", "fade", "show");
	  alertDiv.setAttribute("role", "alert");
	  alertDiv.innerHTML = `
	    <strong>Congrats ! </strong>The purpose of the group has already been fulfilled.
	    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	  `;
	  alertContainer.appendChild(alertDiv);
}
</script>
<script type="text/javascript">
 function statusReviewPending(){
	 var alertContainer = document.getElementById("alertContainer");
	  var alertDiv = document.createElement("div");
	  alertDiv.classList.add("alert", "alert-warning", "alert-dismissible", "fade", "show");
	  alertDiv.setAttribute("role", "alert");
	  alertDiv.innerHTML = `
	    <strong>Warning ! </strong>The purpose of the group is yet to be fulfilled.Have you paid your part?
	    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	  `;
	  alertContainer.appendChild(alertDiv);
 }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>