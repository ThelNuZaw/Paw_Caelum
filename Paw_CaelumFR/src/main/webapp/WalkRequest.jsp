<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "javamodel.Dog, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Walk Request</title>
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

  .container {
    background-color: #ffffff;
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    max-width: 500px;
    width: 100%;
  }

  h1 {
    text-align: center;
    color: #2d5242;
    margin-bottom: 25px;
  }

  label {
    font-weight: 500;
    display: block;
    margin-top: 15px;
    margin-bottom: 5px;
  }

  input[type="number"],
  textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 1rem;
    box-sizing: border-box;
  }

  textarea {
    resize: vertical;
  }

  button {
    width: 100%;
    margin-top: 25px;
    padding: 12px;
    font-size: 1rem;
    background-color: #2d5242;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s ease;
  }

  button:hover {
    background-color: #244437;
  }
  .topLeftBack {
    position: fixed;
    top: 1px;
    left: 5px;
    z-index: 1000;
  }
  .topLeftBack button {
    padding: 10px 15px;
    border: none;
    background-color: #5a7c6b;
    color: white;
    border-radius: 6px;
    cursor: pointer;
  }
</style>
</head>
<body>
<form action="MyDog" method="get" class="topLeftBack">
  <button type="submit">Back</button>
</form>

  <div class="container">
    <h1>Request a Walk for <%=request.getParameter("dogname") %></h1>
    <form action="RequestMade" method="post">
      <input type="hidden" name="dogid" value="<%= request.getParameter("dogid") %>">

      <label for="price">Enter the price per hour:</label>
      <input type="number" name="price" id="price" required>

      <label for="duration">Enter the duration (hours):</label>
      <input type="number" name="duration" id="duration" required>

      <label for="note">Special Note:</label>
      <textarea rows="3" cols="30" name="note" id="note" placeholder="Add instructions like time, location, etc."></textarea>

      <button type="submit">Send Request</button>
  
    </form>
  </div>

</body>
</html>
