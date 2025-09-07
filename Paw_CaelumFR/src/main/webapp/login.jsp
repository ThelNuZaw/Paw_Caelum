<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In Page</title>
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
    .form{
	 background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;}
      
      form input{
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 1rem;
      }
       h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #73c7ae;
    }
    
    button {
      padding: 12px 24px;
      background-color: #2d5242;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      
      
    }
    .rbutton{
    	display: flex;
      	justify-content: flex-end;
    }
    
    
 </style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<input type = "hidden" id = "sta" value = "<%= request.getAttribute("status") %>">
<div class = "form">
<h2>Sing In For Paw Caelum</h2>
<form action="Login" method="post">
  <input type="email" name="email" placeholder="Email" required />
  <input type="password" name="pss" placeholder="Password" required />
  <div class = "rbutton">
  <button type = "submit">Log In</button>
  </div>
  
</form>
</div>
<script>
const status = document.getElementById("sta").value;
if (status === "error") {
  swal("Login failed!", "Invalid email or password.", "error");
}
</script>

</body>
</html>