
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javamodel.Dog" %>
<%
  Dog dog = (Dog) request.getAttribute("dog");
  boolean restrict = (Boolean) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Dog Profile</title>
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

    .dog-form-container {
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
      margin-top: 12px;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="number"],
    select,
    textarea,
    input[type="file"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 8px;
      box-sizing: border-box;
      font-size: 1rem;
    }

    textarea {
      resize: vertical;
    }

    .form-buttons {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    input[type="submit"],
    input[type="reset"],
    button {
      padding: 10px 20px;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
    }

    input[type="submit"] {
      background-color: #2d5242;
      color: white;
    }

    input[type="submit"]:hover {
      background-color: #244437;
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
  </style>
</head>
<body>
  <div class="dog-form-container">
    <% if (restrict) { %>
      <h1>!Editing Restricted</h1>
      <p class="restrict-msg">This dog is not allowed to be edited because a walk request is still pending.</p>
      <a href="MyDog" class="back-link">Back</a>
    <% } else { %>
      <h1>Edit Dog Profile</h1>
      <form action="DogUpdate" method="post" enctype="multipart/form-data">
        <input type="hidden" name="DogId" value="<%= dog.getDogid() %>" />

        <label >Name:</label>
        <input type="text" name="name" id="name" value="<%= dog.getName() %>">

        <label>Breed:</label>
        <input type="text" name="breed" id="breed" value="<%= dog.getBreed() %>">

        <label>Size:</label>
        <select name="size" id="size">
          <option value="SMALL" <%= "SMALL".equals(dog.getSize()) ? "selected" : "" %>>Small</option>
          <option value="MEDIUM" <%= "MEDIUM".equals(dog.getSize()) ? "selected" : "" %>>Medium</option>
          <option value="LARGE" <%= "LARGE".equals(dog.getSize()) ? "selected" : "" %>>Large</option>
        </select>

        <label>Age:</label>
        <input type="number" name="age" id="age" value="<%= dog.getAge() %>">

        <label>Info:</label>
        <textarea name="basic_info" id="basic_info"><%= dog.getBasic_info() %></textarea>

        <img src="<%= request.getContextPath() + "/" + dog.getPhoto() %>" width="100"><br>

        <label>Upload New Photo (optional):</label>
        <input type="file" name="photo" id="photo" accept="image/*">

        <div class="form-buttons">
          <input type="submit" value="Update">
          <a href="MyDog"><button type="button">Cancel</button></a>
        </div>
      </form>
    <% } %>
  </div>
</body>
</html>
