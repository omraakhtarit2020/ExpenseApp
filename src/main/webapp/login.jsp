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
<style>.group {
  display: flex;
  line-height: 30px;
  align-items: center;
  position: relative;
  max-width: 200px;
}

.input {
  width: 100%;
  height: 45px;
  line-height: 30px;
  padding: 0 5rem;
  padding-left: 3rem;
  border: 2px solid transparent;
  border-radius: 10px;
  outline: none;
  background-color: #f8fafc;
  color: #0d0c22;
  transition: .5s ease;
}

.input::placeholder {
  color: #94a3b8;
}

.input:focus, input:hover {
  outline: none;
  border-color: rgba(129, 140, 248);
  background-color: #fff;
  box-shadow: 0 0 0 5px rgb(129 140 248 / 30%);
}

.icon {
  position: absolute;
  left: 1rem;
  fill: none;
  width: 1rem;
  height: 1rem;
}
.anchor_tag{
  color:black;
}
.anchor_tag:hover{
  color:red;
}
</style>
</head>
<body>

<c:if test="${ not empty userobj }">
		<c:redirect url="index.jsp"></c:redirect>
</c:if>

<c:if test="${not empty errorMsg}">
<div class="d-flex justify-content-center align-items-center">
	<div class="alert alert-warning alert-dismissible fade show w-50 text-center mt-5" role="alert">
	  <strong>${errorMsg}</strong>
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
     </div>
</div>
</c:if>

<div class="card text-center" style="max-width:300px;margin-top:10%;margin-left:50%;transform:translateX(-50%);height:220px;border-radius: 0px;
background: linear-gradient(145deg, #cacaca, #f0f0f0);
box-shadow:  5px 5px 17px #8d8d8d,
             -5px -5px 17px #ffffff;">
  <div class="card-header">
    LOGIN
  </div>
  <div class="card-body p-5">
  <form action="./login" method="POST">
   <div class="group">
  <svg stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="icon">
  <path d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" stroke-linejoin="round" stroke-linecap="round"></path>
</svg>
<input class="input" type="password" placeholder="MPIN" name="mpin">
</div>
    <button class="btn btn-warning mt-4" type="submit">Submit</button>
 </form>
  </div>
  <a href="signup.jsp" style="text-decoration:none;" class="anchor_tag">Dont have an account ?<span>Sign Up</span></a>
 </div>

          





<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>