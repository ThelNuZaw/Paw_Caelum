<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javamodel.Dog, java.util.*, javamodel.WalkRequest, javaDAO.WalkRequestDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Dog</title>

<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #73c7ae;
  }

  .pageWrapper {
    padding: 60px 20px;
  }

  .topLeftBack {
    position: fixed;
    top: 10px;
    left: 10px;
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

  h2 {
    text-align: center;
    color: #124e2a;
    padding: 20px;
    margin-top: 30px;
  }

  .dogCardArea {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
  }

  .dogBox {
    width: 250px;
    height: 320px;
    perspective: 1000px;
  }

  .cardFlipInner {
    width: 100%;
    height: 100%;
    transition: transform 0.6s;
    transform-style: preserve-3d;
    position: relative;
  }

  .dogBox:hover .cardFlipInner {
    transform: rotateY(180deg);
  }

  .dogFront, .dogBack {
    width: 100%;
    height: 100%;
    position: absolute;
    backface-visibility: hidden;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
  }

  .dogFront {
    background-color: white;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .dogPic {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .dogBack {
    background-color: #ffffff;
    transform: rotateY(180deg);
    padding: 15px;
  }

  .dogDetails {
    font-size: 14px;
    margin: 6px 0;
  }

  .btnEditDog, .btnDeleteDog, .btnRequestWalk {
    margin: 5px 0;
    padding: 8px 12px;
    background-color: #2d5242;
    color: white;
    border: none;
    border-radius: 5px;
    width: 100%;
    cursor: pointer;
  }
</style>
</head>
<body>

<form action="owner.jsp" method="get" class="topLeftBack">
  <button type="submit">Back</button>
</form>

<h2>Your Dog Profiles</h2>

<div class="pageWrapper">
  <div class="dogCardArea">
    <% 

    List<Dog> dogs = (List<Dog>) request.getAttribute("MyDog");
    if (dogs != null && !dogs.isEmpty()) {
      for (Dog myd : dogs) {
    	  String status = "No Request Yet";
          try {
        	  WalkRequestDAO dao = new WalkRequestDAO();
        	  status = dao.getstatus(myd.getDogid());

          } catch (Exception e) {
              status = "Error loading status";
          }
    %>
   <div class="dogBox">
      <div class="cardFlipInner">
        <div class="dogFront">
          <img src="<%= myd.getPhoto() %>" class="dogPic" />
        </div>
        <div class="dogBack">
          <p class="dogDetails">Name: <%= myd.getName() %></p>
          <p class="dogDetails">Breed: <%= myd.getBreed() %></p>
          <p class="dogDetails">Size: <%= myd.getSize() %></p>
          <p class="dogDetails">Age: <%= myd.getAge() %></p>
          <p class="dogDetails">Info: <%= myd.getBasic_info() %></p>
          <p class="dogDetails">Status: <%= status %></p>
         

          <form action="EditDog" method="get">
            <input type="hidden" name="dogid" value="<%= myd.getDogid() %>">
            <button type="submit" class="btnEditDog">Edit</button>
          </form>

          <form action="DogDelete" method="post">
            <input type="hidden" name="dogid" value="<%= myd.getDogid() %>">
            <button type="submit" class="btnDeleteDog">Delete</button>
          </form>

          <form action="WalkRequest.jsp" method="post">
            <input type="hidden" name="dogid" value="<%= myd.getDogid() %>">
            <input type = "hidden" name = "dogname" value = "<%=myd.getName() %>">
            <button type="submit" class="btnRequestWalk">Request Walk</button>
          </form>
        </div>
      </div>
    </div>
    <%
      } 
    } 
    %>
  </div>
</div>
</body>
</html>
