<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="com.entity.*" %>
<%@ page import="com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Track your Expense</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" 
integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.add_button{
    background: rgba(3,7,30,0.60);
    height:50px;
    width: 50px;
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
.neumorphic {
    box-shadow: 5px 5px 15px #c0c0c0, -5px -5px 15px #ffffff; 
    border-radius: 15px; 
    transition: all 0.3s ease;
}

.neumorphic:hover {
    box-shadow: 8px 8px 20px #c0c0c0, -8px -8px 20px #ffffff; 
</style>
<%
User u = (User) session.getAttribute("userobj");
IncomeDAO incdao=new IncomeDAO(DBConnection.getConn());
ExpenseDAO expdao=new ExpenseDAO(DBConnection.getConn());
long exp=expdao.totalExpense(u.getId());
long inc=incdao.totalIncome(u.getId());
long balance=inc-exp;

List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();


Map<Object,Object> incomeMap = new HashMap<Object,Object>();
incomeMap.put("label", "Income");
incomeMap.put("y", inc);
incomeMap.put("color", "#9ef01a"); 
list.add(incomeMap);


Map<Object,Object> expenseMap = new HashMap<Object,Object>();
expenseMap.put("label", "Expense");
expenseMap.put("y", exp);
expenseMap.put("color", "#e71d36"); 
list.add(expenseMap);

Map<Object,Object> balanceMap = new HashMap<Object,Object>();
balanceMap.put("label", "Balance");
balanceMap.put("y", balance);
balanceMap.put("color", "#fcf300"); 
list.add(balanceMap);


Gson gsonObj = new Gson();
String dataPoints = gsonObj.toJson(list);
%>

<script type="text/javascript">
window.onload = function() { 
    var chart = new CanvasJS.Chart("chartContainer", {
        theme: "light2",
        animationEnabled: true,
        exportEnabled: false,
        title:{
            text: "Financial Overview"
        },
        backgroundColor: "transparent", 
        data: [{
            type: "pie",
            showInLegend: true,
            legendText: "{label}",
            toolTipContent: "{label}: <strong>{y}</strong>",
            indexLabel: "{label} {y}",
            dataPoints : <%out.print(dataPoints);%>
        }]
    });
 
    chart.render();
}
</script>


</head>
<body>
<%@ include file="components/track/nav.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h4 class=" p-2 mt-4"><b>TRANSACTIONS HISTORY</b>&nbsp<a href="./download" style="color:black;"><i class="fa-solid fa-download"></i></a></h4>
            <div class="p-2">
                <div class="col-md-6">
                   <span class="lead"><cite>Earning:</cite></span>
                    <% 
                    List<User_income> inclist=incdao.getIncomeById(user.getId());
                    for(User_income in:inclist){
                    %>
                    <p class="p-3 neumorphic" style="background:#cfe1b9;border-left:5px solid #008000;min-width: 20rem;"><b><%=in.getType()%> :</b> <span><%=in.getIncome()%></span>
                        <span><cite style="margin-left:10%;color:#0E8388"><%=in.getDate().toLocalDate() %>&nbsp&nbsp</cite></span>
                        <a href="./deleteIncome?inco_id=<%=in.getInco_id()%>" type="button"><i class="bi bi-trash3-fill " style="color:#7B2869;"></i></a>
                        <span data-bs-toggle="modal" data-bs-target="#exampleModalupdateincome"><i class="bi bi-pencil-fill" type="button"></i></a></span>
                        
                        <div class="modal fade" id="exampleModalupdateincome" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">Update
										INCOME</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="./EditIncome" method="POST">
										<div class="mb-3">
											<label for="type" class="form-label">Income</label>
												  <select class="form-select" name="type">
												    <option selected><%=in.getType()%></option>
												    <%
														TypeDAO opt = new TypeDAO(DBConnection.getConn());
														List<Type> list1=opt.getAllType();
														for(Type ty:list1){
													%>
																	      
												     <option><%=ty.getTypeDesc()%></option>
													 <%} %>
												  </select>
									    </div>
											<input type="hidden" class="form-control"
												value="<%=in.getInco_id()%>" name="inco_id">
										<br>
										 <div class="mb-3">
										    <label for="income" class="form-label">Amount</label>
										    <input type="number" class="form-control" name="income" value="<%=in.getIncome()%>">
										  </div>
										<br>
				
										<button type="submit" class="btn btn-primary"
											style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);">Save</button>
									</form>
								</div>
							</div>
						</div>
					</div>
                    </p>
                    <%} %>
                </div>
                <div class="col-md-6">
                   <span class="lead"><cite>Expenditure:</cite></span>
                 
                    <%
                    List<User_expense> list2=expdao.getExpenseById(user.getId());
                    for(User_expense ex:list2){
                    %>
                    <p class="p-3 neumorphic" style="background:#F8E8EE;border-left:5px solid #d00000;min-width: 20rem;"><b><%=ex.getType()%>:</b> <span><%=ex.getExpense()%></span>	  
                        <span><cite style="margin-left:20%;color:#0E8388"><%=ex.getDate().toLocalDate() %></cite></span>
                        <a href="./deleteExpense?exp_id=<%=ex.getExp_id()%>" type="button"><i class="bi bi-trash3-fill" style="color:#7B2869;"></i></a>
                        <span data-bs-toggle="modal" data-bs-target="#exampleModalupdateexpense"><i class="bi bi-pencil-fill" type="button" ></i></a></span>
                        <div class="modal fade" id="exampleModalupdateexpense" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">Update
										EXPENSE</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="./EditExpense" method="POST">
										<div class="mb-3">
											<label for="type" class="form-label">Expense</label>
												  <select class="form-select" name="type">
												    <option selected><%=ex.getType() %></option>
												    <%
														TypeExpenseDAO opt = new TypeExpenseDAO(DBConnection.getConn());
														List<TypeExpense> expe=opt.getAllType();
														for(TypeExpense ty:expe){
													%>
																	      
												     <option><%=ty.getTypeDesc()%></option>
													 <%} %>
												  </select>
									    </div>
											<input type="hidden" class="form-control"
												value="<%=ex.getExp_id()%>" name="exp_id">
										<br>
										 <div class="mb-3">
										    <label for="expense" class="form-label">Amount</label>
										    <input type="number" class="form-control" name="expense" value="<%=ex.getExpense()%>">
										  </div>
										<br>
				
										<button type="submit" class="btn btn-primary"
											style="margin-top: 15px; margin-left: 50%; transform: translateX(-50%);">Save</button>
									</form>
								</div>
							</div>
						</div>
					</div>
                    </p>
                    <%} %> 
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div id="chartContainer" style="height: 510px;width:590px;"></div>  
           
        </div>
    </div>
</div>

<div class="add_button sticky-bottom" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalAdd"><h1 class="d-flex justify-content-center align-items-center fs-5"><b>+</b></h1></div>

<!-- Modal -->
<div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" 
integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>