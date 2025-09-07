<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteDog</title>
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
.back-link {
      display: block;
      text-align: center;
      margin-top: 15px;
    }

    .restrict-msg {
      color: red;
      text-align: center;
      font-size: 1.1rem;
    }
    h1 {
      text-align: center;
      color: #2d5242;
      margin-bottom: 25px;
    }
    .container {
        max-width: 500px;
        margin: 100px auto;
        background-color: #fff;
        border: 2px solid #d9e4dd;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    
</style>
</head>
<body>
<div class = "container">
<%
    String m = (String) request.getAttribute("message");
    if (m != null) {
    %>
    	<h1>!Deletion Restricted</h1>
      <p class = "restrict-msg"><%= m %> as a walk request is still pending.</p>
      <a href = "MyDog" class = "back-link">Back</a>
    <%
    } %>
    
</div>
</body>
</html>