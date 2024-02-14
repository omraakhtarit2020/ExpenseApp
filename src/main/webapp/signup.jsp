<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<div class="p-3 d-flex" style="width:900px;margin-left:17%;transform:trasnlateX(-50%);box-shadow:  5px 5px 17px #8d8d8d,
             -5px -5px 17px #ffffff;margin-top:4%;" >
 <div class="card" style="max-width: 400px;max-height:600px;border:none;">
<p class="card-title text-center"><b>SIGN UP</b><p>
 <div class="card-body">
   <form action="./signup" method="POST" class="row g-1">
     <label for="fname">First Name</label>
     <input type="text" name="fname">
     <label for="lname">Surname</label>
     <input type="text" name="lname">
    <label for="email">Email</label>
    <input type="email" name="email" required>
    <label for="phnno">Phone number</label>
    <input type="number" name="phnno" required>
    <label for="mpin">Enter Your secret Pin</label>
    <input type="password" name="mpin" required>
    <label for="jobtype">Your current job Type</label>
    <input for="text" name="jobtype">
    
    <button class="btn btn-outline-primary mt-3" type="submit" style="max-width:100px;">Submit</button>
   </form>
</div>
</div>
 <div class="hidden">
                <img src="./images/signup.png" alt="hero image">
 </div>
</div>
 

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>