<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.servlet.http.*,javax.servlet.*,javax.servlet.http.HttpSession"%>

<%
if (session == null || !"walker".equalsIgnoreCase((String) session.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}
String status = (String) session.getAttribute("status");
session.removeAttribute("status");
String accepted = request.getParameter("accepted");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Walker Page</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
    body {
      background: #f0f7f4;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
    }

    .dashboard {
      background-color: #ffffff;
      margin-top: 40px;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 500px;
    }

    h1 {
      text-align: center;
      color: #2d5242;
      margin-bottom: 20px;
    }

    .action-buttons form {
      margin: 10px 0;
    }

    .dashboard-btn {
      width: 100%;
      padding: 12px;
      background-color: #73c7ae;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .dashboard-btn:hover {
      background-color: #60b29b;
    }

    .logout-btn {
      width: 100%;
      padding: 12px;
      background-color: #e74c3c;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s ease;
      margin-top: 20px;
    }

    .logout-btn:hover {
      background-color: #c0392b;
    }

    .message-section {
      margin-top: 30px;
      padding-top: 10px;
      border-top: 1px solid #ccc;
      text-align: center;
    }

    .message-section textarea {
      width: 90%;
      height: 80px;
      margin-top: 10px;
    }

    .message-section button {
      margin-top: 10px;
      padding: 8px 12px;
      background-color: #2d5242;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .message-section a {
      display: inline-block;
      margin-top: 10px;
      color: #2d5242;
      text-decoration: underline;
    }
</style>
</head>
<body>

<input type="hidden" id="sta" value="<%=status%>">
<input type="hidden" id="accepted" value="<%=accepted%>">


<div class="dashboard">
  <h1>Welcome, <%= session.getAttribute("name") %>!</h1>

  <div class="action-buttons">
    <form action="AllDogs" method="get">
      <button type="submit" class="dashboard-btn">View All Dogs</button>
    </form>

    <form action="RequestMade" method="get">
      <button type="submit" class="dashboard-btn">View Open Requests</button>
    </form>

    <form action="Favorite" method="get">
      <button type="submit" class="dashboard-btn">View Favorites</button>
    </form>
    
    <form action="CompleteWalk" method="post">
  <button type="submit" class="dashboard-btn">Mark Walk as Completed</button>
</form>

 <form action = "WalkerviewRating" method = "get">
 	<button type = "submit" class = "dashboard-btn">View My Rating</button>
 </form>
  </div>
  
  

	
  

  <form action="LogOut" method="get">
    <button type="submit" class="logout-btn">Log Out</button>
  </form>

  <div class="message-section">
    <h3>Send a Message to Owner</h3>
    <form action="sendMessage.jsp" method="post">
        <input type="hidden" name="receiverId" value="1">
        <textarea name="content" required placeholder="Write your message..."></textarea><br>
        <button type="submit">Send Message</button>
    </form>
    <a href="inbox.jsp">View Messages</a>
  </div>
</div>

<script>
const status = document.getElementById("sta").value;
const accepted = document.getElementById("accepted").value;

if (status === "walker") {
    swal("Welcome!", "You have logged in as Walker", "success");
}

if (accepted === "true") {
    swal("Success!", "You have accepted the walk request!", "success");
}

const urlParams = new URLSearchParams(window.location.search);
if (urlParams.get('completed') === 'true') {
    swal("Success!", "Walk marked as completed.", "success");
}

</script>





</body>
</html>



