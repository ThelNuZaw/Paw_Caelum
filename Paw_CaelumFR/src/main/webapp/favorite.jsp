<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, javamodel.Dog"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Favorite Dogs</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #73c7ae;
        margin: 20px;
    }

    h1 {
        text-align: center;
        color: #2d5242;
        margin-bottom: 25px;
    }

    .dog-list {
        display: flex;
        flex-wrap: wrap;
        gap: 35px;
        justify-content: flex-start;
        padding: 0 20px;
    }

    .dog-item {
        text-align: center;
        flex: 0 0 auto;
        width: 250px;
    }

    .dog-item img {
        width: 200px;
        height: 250px;
        object-fit: cover;
        border-radius: 50%;
        margin-bottom: 12px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
    }

    .remove-btn {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.9rem;
    }

    .remove-btn:hover {
        background-color: #c0392b;
    }

    .no-fav {
        text-align: center;
        color: #555;
        margin-top: 40px;
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
    .wrapper {
    background-color:  #1b2f24;     
    padding: 6px;                 
    border-radius: 50%;           
    display: inline-block;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.08); 
}
</style>
</head>
<body><a href = "walker.jsp" class = "back-link">Back</a>

<h1>You❤️️Dogs</h1>

<%
    List<Dog> favoriteDog = (List<Dog>) request.getAttribute("favd");
    if (favoriteDog != null && !favoriteDog.isEmpty()) {
%>
    <div class="dog-list">
<%
        for (Dog d : favoriteDog) {
%>
        <div class="dog-item">
        
        <div class = "wrapper">
            <img src="<%= d.getPhoto() %>" alt="Dog Photo">
         </div>
            <p><strong><%= d.getName() %></strong></p>
            <form action="Removefav" method="post">
                <input type="hidden" name="dogid" value="<%= d.getDogid() %>">
                <button type="submit" class="remove-btn">Remove</button>
            </form>
        </div>
<%
        }
%>
    </div>
<%
    } else {
%>
    <p class="no-fav">You don't have any favorite dogs yet.</p>
<%
    }
%>

</body>
</html>
