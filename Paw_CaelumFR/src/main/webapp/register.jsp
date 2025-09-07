<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up Page</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
body {
      background-color: #73c7ae;
      font-family: 'Poppins', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }
  #ownerside, #walkerside {
    display: none;
    margin-top: 10px;
    
  }
  .main{
	 background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;}
      
    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #73c7ae;
    }

    form input,
    form select {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 1rem;
    }

    #ownerside,
    #walkerside {
      display: none;
    }

    button {
    width: 100%
      padding: 12px;
      background-color: #2d5242;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
    }

    a {
      display: block;
      text-align: center;
      margin-top: 15px;
      color: #2d5242;
      text-decoration: none;
      font-size: 0.95rem;
    }
  
  }
  
 </style>
</head>
<body>
<input type = "hidden" id = "st" value = "<%=request.getAttribute("status") %>">
<div class = "main">
<h2>Sing Up for Paw Caelum</h2>
<form action = "<%= request.getContextPath() %>/Register" method = "post">
	<input type = "text" name = "uname" placeholder = "Name" required/>
	<input type = "date" name ="bd" placeholder = "Birthday" required/>
	<input type = "email" name = "email" placeholder = "Email" required/>
	<input type = "text" name = "address" placeholder = "Address"/>
	<input type = "text" name = "zip" placeholder = "Zip"/>
	<input type = "number" name = "ph" placeholder = "Phone"/>
	<input type = "password" name = "pss" placeholder = "Password"/>
	<select name = "role" id = "role" onchange = "Checkrole()" Required>
		<option value="">-- Select Role --</option>
		<option value = "owner">Owner</option>
		<option value = "walker">Walker</option>
	</select>
	
	
	<div id = ownerside>
		<input type = "number" name = "em" placeholder = "Emergency Contact(optional)"/>
	</div>
	
	<div id = "walkerside" >
		<input type="text" name="bio" placeholder = "Bio"/>
		<select name = "exp">
			<option value ="">Select Experience</option>
			<option value = "beginner">Beginner</option>
			<option value = "intermediate">intermediate</option>
			<option value = "advance">Advance</option>
		</select>
		
	</div>
	
	<button type = "submit">Register</button>
	<a href = "login.jsp">I am already member. Log In</a>
	
	
</form>
</div>

<script>
function Checkrole() {
    var role = document.getElementById("role").value;
    var ownerDiv = document.getElementById("ownerside");
    var walkerDiv = document.getElementById("walkerside");

   
    ownerDiv.style.display = "none";
    walkerDiv.style.display = "none";

    
    if (role === "owner") {
        ownerDiv.style.display = "block";
    } else if (role === "walker") {
        walkerDiv.style.display = "block";
    }
}
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
var status = document.getElementById("st").value;

if (status === "success") {
  swal("Account created successfully!", "", "success");
} else if (status === "fail") {
  swal("Account creation failed.", "Please try again.", "error");
} else if (status === "email_exists") {
  swal("Email already exists.", "Try another email.", "warning");
}
</script>
</body>
</html>