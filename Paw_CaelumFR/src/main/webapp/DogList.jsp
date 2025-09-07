<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.List, javamodel.Dog"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dog List</title>
<style>

    body {
        font-family: Arial, sans-serif;
        background-color: #73c7ae;
        padding: 20px;
    }

    .dog-card {
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 15px;
        margin: 15px auto;
        max-width: 600px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .dog-info {
        flex-grow: 1;
    }

    .dog-info p {
        margin: 4px 0;
    }

    .dog-photo {
        margin-left: 20px;
    }
      .like-form button:hover {
        background-color: #3e8e41;
    }

    .dog-photo img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 5px;
    }

    .fav {
        margin-top: 10px;
        text-align: right;
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
   

  
    
</style>
</head>
<body>
<a href = "walker.jsp" class = "back-link">Back</a>

<%
    List<Dog> dogList = (List<Dog>) request.getAttribute("allDogs");
    if(dogList != null && !dogList.isEmpty()){
        for(Dog d: dogList){
%>
    <div class="dog-card">
        <div class="dog-info">
            <p><strong>Name:</strong> <%= d.getName() %></p>
            <p><strong>Breed:</strong> <%= d.getBreed() %></p>
            <p><strong>Size:</strong> <%= d.getSize() %></p>
            <p><strong>Age:</strong> <%= d.getAge() %></p>
            <p><strong>Info:</strong> <%= d.getBasic_info() %></p>

            <div class="fav">
                <form action="Favorite" method="post">
                    <button type="submit" name="dogid" value="<%= d.getDogid() %>">❤️</button>
                </form>
            </div>
        </div>
        <div class="dog-photo">
            <img src="<%= d.getPhoto() %>" alt="Dog Photo"/>
        </div>
    </div>
<%
        }
    } else {
%>
    <p style="text-align: center;">No dogs available to display.</p>
<%
    }
%>

</body>
</html>
