<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, javamodel.Dog"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Walk Request</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #73c7ae;
        margin: 0;
        padding: 20px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    h2 {
        width: 100%;
        text-align: center;
        color: #2d5242;
        margin-bottom: 30px;
    }

    .flip-card {
        background-color: transparent;
        width: 220px;
        height: 280px;
        perspective: 1000px;
        margin: 15px;
    }

    .flip-card-inner {
        position: relative;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: transform 0.6s;
        transform-style: preserve-3d;
    }

    .flip-card:hover .flip-card-inner {
        transform: rotateY(180deg);
    }

    .flip-card-front, .flip-card-back {
        position: absolute;
        width: 100%;
        height: 100%;
        backface-visibility: hidden;
        border: 1px solid #ccc;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .flip-card-front {
        background-color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .flip-card-front img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .flip-card-back {
        background-color: #ffffff;
        color: black;
        transform: rotateY(180deg);
        padding: 15px;
        font-size: 14px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .flip-card-back p {
        margin: 5px 0;
        text-align: left;
    }

    .flip-card-back form {
        margin-top: 10px;
        text-align: center;
    }

    .flip-card-back button {
        padding: 6px 12px;
        background-color: #2d5242;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .flip-card-back button:hover {
        background-color: #3e6c58;
    }

    .back-link {
        position: fixed;
        top: 15px;
        left: 15px;
        text-decoration: none;
        font-size: 16px;
        background-color: #2d5242;
        color: white;
        padding: 8px 14px;
        border-radius: 6px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        z-index: 1000;
    }

.back-link:hover {
  background-color: #3e6c58;
}
.filter {
        width: 100%;
        text-align: center;
        margin-bottom: 30px;
    }
    

</style>
</head>
<body>
<a href="walker.jsp" class="back-link">Back</a>

<h2>Dogs with Open Walk Requests</h2>


<form action="Filter" method="get" class ="filter">
  <label>Size:</label>
  <select name="size">
    <option value="">--Any--</option>
    <option value="Small">Small</option>
    <option value="Medium">Medium</option>
    <option value="Large">Large</option>
  </select>

  <label>Price Range:</label>
  <input type="number" name="minPrice" placeholder="Min Price"/>
  <input type="number" name="maxPrice" placeholder="Max Price"/>

  <label>Zip Code Range:</label>
  <input type="number" name="minZip" placeholder="Min Zip"/>
  <input type="number" name="maxZip" placeholder="Max Zip"/>

  <button type="submit">Filter</button>
</form>

<%
    List<Dog> openDogs = (List<Dog>) request.getAttribute("filterdogs");
    if (openDogs == null) {
        openDogs = (List<Dog>) request.getAttribute("opdogs");
    }
    if (openDogs != null && !openDogs.isEmpty()) {
        for (Dog d : openDogs) {
%>
<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="<%= d.getPhoto() %>" alt="Dog Photo">
    </div>
    <div class="flip-card-back">
      <p><strong>Name:</strong> <%= d.getName() %></p>
      <p><strong>Breed:</strong> <%= d.getBreed() %></p>
      <p><strong>Age:</strong> <%= d.getAge() %></p>
      <p><strong>Size:</strong> <%= d.getSize() %></p>
      <p><strong>Info:</strong> <%= d.getBasic_info() %></p>
      <form action="AcceptRequest.jsp" method="post">
          <input type="hidden" name="dogid" value="<%= d.getDogid() %>">
          <button type="submit">Accept Walk</button>
      </form>
    </div>
  </div>
</div>
<%
        }
    } else {
%>
    <p style="width: 100%; text-align: center;">No open walk requests right now.</p>
<% } %>


</body>
</html>

