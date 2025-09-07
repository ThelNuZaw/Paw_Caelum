<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.servlet.http.*,javax.servlet.*,java.sql.*"%>

<%
   
    if (session == null || !"owner".equalsIgnoreCase(String.valueOf(session.getAttribute("role")))) {
        response.sendRedirect("login.jsp");
        return;
    }

    String status = (String) session.getAttribute("status");
    session.removeAttribute("status");

    Integer ownerIdObj = (Integer) session.getAttribute("id");
    if (ownerIdObj == null) { response.sendRedirect("login.jsp"); return; }
    int ownerId = ownerIdObj;

    int walkerId = -1;
    Integer completedWrId = null;
    Integer completedWalkerId = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "root";
        String pass = "feifeisone@2018";

        try (Connection conn = DriverManager.getConnection(url, user, pass)) {

            String sqlAccepted =
                "SELECT w.Walker_ID " +
                "FROM Walk_Request w " +
                "JOIN Make_Request m ON w.Walkrequest_ID = m.Walkrequest_ID " +
                "WHERE m.Owner_Id = ? AND w.Status = 'accepted' " +
                "ORDER BY w.Walkrequest_ID DESC LIMIT 1";
            try (PreparedStatement ps = conn.prepareStatement(sqlAccepted)) {
                ps.setInt(1, ownerId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) walkerId = rs.getInt("Walker_ID");
                }
            }

            String sqlCompleted =
                "SELECT w.Walkrequest_ID, w.Walker_ID " +
                "FROM Walk_Request w " +
                "JOIN Make_Request m ON w.Walkrequest_ID = m.Walkrequest_ID " +
                "WHERE m.Owner_Id = ? AND w.Status = 'completed' " +
                "ORDER BY w.Walkrequest_ID DESC LIMIT 1";
            try (PreparedStatement cps = conn.prepareStatement(sqlCompleted)) {
                cps.setInt(1, ownerId);
                try (ResultSet crs = cps.executeQuery()) {
                    if (crs.next()) {
                        completedWrId = crs.getInt("Walkrequest_ID");
                        completedWalkerId = crs.getInt("Walker_ID");
                    }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    boolean showRating = false;                   // final flag used by JS below
    String displayStatus = "No request yet";      // optional: UI label you can show

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "root";
        String pass = "feifeisone@2018";

        try (Connection conn = DriverManager.getConnection(url, user, pass)) {

            if (completedWalkerId != null) {
                
                int completedCount = 0;
                String qCompletedCount =
                    "SELECT COUNT(*) " +
                    "FROM Walk_Request w " +
                    "JOIN Make_Request m ON w.Walkrequest_ID = m.Walkrequest_ID " +
                    "WHERE m.Owner_Id = ? AND w.Walker_ID = ? AND w.Status = 'completed'";
                try (PreparedStatement ps = conn.prepareStatement(qCompletedCount)) {
                    ps.setInt(1, ownerId);
                    ps.setInt(2, completedWalkerId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) completedCount = rs.getInt(1);
                    }
                }

                
                int ratingCount = 0;
                String qRatingCount =
                    "SELECT COUNT(*) FROM OWNER_WALKER_RATING WHERE Owner_id = ? AND Walker_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(qRatingCount)) {
                    ps.setInt(1, ownerId);
                    ps.setInt(2, completedWalkerId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) ratingCount = rs.getInt(1);
                    }
                }

                
                showRating = (completedCount > ratingCount);
                displayStatus = showRating ? "completed" : "No request yet";
            } else if (walkerId != -1) {
               
                displayStatus = "accepted";
            } else {
               
                displayStatus = "No request yet";
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); 
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner Page</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

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
  
  h1, h2, h3, .modal-title, .form-label, .btn, .form-control, .form-select {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
  }
  h1 {  font-size: 2em; font-weight: bold; color: #2d5242; margin-bottom: 20px; text-align: center; }
  h2 { font-size: 1.2rem; color: #2d5242; margin: 0 0 10px 0; }

  .dashboard {
    background-color: #ffffff;
    margin-top: 40px;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 500px; 
  }

  .action-buttons form { margin: 10px 0; }

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
  .dashboard-btn:hover { background-color: #60b29b; }

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
  .logout-btn:hover { background-color: #c0392b; }

  .message-box {
    margin-top: 30px;
    padding-top: 10px;
    border-top: 1px solid #ccc;
  }
  .message-box p { margin: 5px 0; }
  .message-box .inner { border-bottom: 1px solid #ccc; padding: 8px 0; text-align: left; }

 
  .modal-content { border-radius: 12px; }
  .modal-body label { margin-top: 6px; }
  .btn-primary { background-color: #73c7ae; border-color: #73c7ae; }
  .btn-primary:hover { background-color: #60b29b; border-color: #60b29b; }
</style>
</head>
<body>
  <input type="hidden" id="sta" value="<%= status != null ? status : "" %>">

  <div class="dashboard">
    <h1>Welcome, <%= String.valueOf(session.getAttribute("name")) %>!</h1>

    <div class="action-buttons">
      <form action="DogProfileForm.jsp" method="get">
        <button type="submit" class="dashboard-btn">Set Up Your Dog Profile</button>
      </form>

      <form action="MyDog" method="get">
        <button type="submit" class="dashboard-btn">View Your Dog Profiles</button>
      </form>
    </div>

    <form action="LogOut" method="get">
      <button type="submit" class="logout-btn">Log Out</button>
    </form>

    <div class="message-box">
      <% if (walkerId != -1) { %>
        <div class="inner">
          <h2>Send Message to Your Walker</h2>
          <form action="sendMessage.jsp" method="post">
            <input type="hidden" name="receiverId" value="<%= walkerId %>">
            <textarea name="content" required placeholder="Write your message..." style="width:100%; height:90px; padding:8px; border-radius:8px; border:1px solid #ddd;"></textarea><br>
            <button type="submit" class="dashboard-btn" style="margin-top:8px;">Send Message</button>
          </form>
        </div>
      <% } else { %>
        <p style="text-align:center; margin-top:20px;">No active walker assigned yet.</p>
      <% } %>
    </div>
  </div>

  <script>
    const sta = document.getElementById("sta").value;
    if (sta === "owner") swal("Welcome!", "You have logged in as Owner", "success");
  </script>

  
  <div class="modal fade" id="rateModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <form class="modal-content" method="post" action="<%= request.getContextPath() %>/rate">
        <div class="modal-header">
          <h5 class="modal-title">Rate your Walker</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body">
          <input type="hidden" name="walkerId" value="<%= completedWalkerId %>">

          <label class="form-label">Rating (1–5)</label>
          <select name="ratingScore" class="form-select mb-2" required>
            <option value="">Choose…</option>
            <option>5</option><option>4</option><option>3</option><option>2</option><option>1</option>
          </select>

          <label class="form-label">Comment</label>
          <textarea name="comment" class="form-control" rows="2" placeholder="Optional"></textarea>
        </div>

        <div class="modal-footer">
          <button class="btn btn-primary" type="submit">Submit</button>
        </div>
      </form>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    const shouldOpen = <%= showRating ? "true" : "false" %>;
    if (shouldOpen) {
      window.addEventListener('load', () => {
        new bootstrap.Modal(document.getElementById('rateModal')).show();
      });
    }
  </script>
</body>
</html>
