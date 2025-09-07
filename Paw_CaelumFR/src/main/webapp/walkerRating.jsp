<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, javamodel.WalkerViewRating" %>
<%
    // Optional: keep the same guard as walker.jsp (your servlet should already protect this)
    if (session == null || !"walker".equalsIgnoreCase(String.valueOf(session.getAttribute("role")))) {
        response.sendRedirect("login.jsp");
        return;
    }
    String ctx = request.getContextPath();

    // Safe fallbacks to avoid NPE/ClassCast if attributes are missing
    Double avgObj = (Double) request.getAttribute("avg");
    Integer cntObj = (Integer) request.getAttribute("count");
    double avg = (avgObj == null ? 0.0 : avgObj);
    int count = (cntObj == null ? 0 : cntObj);
    int fullStars = (int) Math.round(avg);

    List<WalkerViewRating> ratings = (List<WalkerViewRating>) request.getAttribute("ratings");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Ratings</title>
<style>
    /* --- Match walker.jsp styles --- */
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
      margin: 0 0 20px 0;
      font-size: 1.6rem;
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
      text-align: center;
      text-decoration: none;
      display: block;
      margin-top: 10px;
    }
    .dashboard-btn:hover { background-color: #60b29b; }

    .section-card {
      border: 1px solid #eee;
      border-radius: 10px;
      padding: 16px;
      margin-bottom: 16px;
    }
    .star { font-size: 18px; line-height: 1; color: #2d5242; }
    .meta { color: #6c757d; font-size: .95rem; }
    .review-item {
      padding: 10px 0;
      border-top: 1px dashed #e6e6e6;
    }
    .header-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
    }
</style>
</head>
<body>
  <div class="dashboard">
    <h1>My Ratings</h1>

    <!-- Average + count -->
    <div class="section-card">
      <div class="header-row" style="margin-bottom:8px;">
        <div class="star">
          <% for (int i = 1; i <= 5; i++) { %>
            <%= (i <= fullStars) ? "★" : "☆" %>
          <% } %>
        </div>
        <div><strong><%= String.format("%.1f", avg) %></strong> / 5.0</div>
        <div class="meta">(<%= count %> ratings)</div>
      </div>
      <div class="meta">This reflects your average rating from owners.</div>
    </div>

    <!-- Recent reviews -->
    <div class="section-card">
      <h3 style="margin:0 0 8px 0; color:#2d5242; font-size:1.1rem;">Recent Reviews</h3>
      <%
        if (ratings == null || ratings.isEmpty()) {
      %>
        <div class="meta">No reviews yet.</div>
      <%
        } else {
          for (WalkerViewRating r : ratings) {
      %>
        <div class="review-item">
          <div class="header-row">
            <div><strong><%= r.getOwnerName() %></strong></div>
            <div class="star">
              <% for (int i = 1; i <= 5; i++) { %>
                <%= (i <= r.getScore()) ? "★" : "☆" %>
              <% } %>
            </div>
          </div>
          <% if (r.getComment() != null && !r.getComment().trim().isEmpty()) { %>
            <div class="meta" style="margin-top:4px;"><%= r.getComment() %></div>
          <% } %>
        </div>
      <%
          }
        }
      %>
    </div>

    <!-- Back button styled like other buttons -->
    <a href="<%= ctx %>/walker.jsp" class="dashboard-btn">Back to Dashboard</a>
  </div>
</body>
</html>
