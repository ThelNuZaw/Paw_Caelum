<%@ page import="java.sql.*" %>
<%
    int senderId = (int) session.getAttribute("id");
    int receiverId = Integer.parseInt(request.getParameter("receiverId"));
    String content = request.getParameter("content");

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true",
	        "root",
	        "feifeisone@2018")) {
        String sql = "INSERT INTO Paw_Caelum.COMMUNICATIONS (Content, Type, Text_Status, Sender, Receiver) VALUES (?, 'TEXT', 'sent', ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, content);
            ps.setInt(2, senderId);
            ps.setInt(3, receiverId);
            ps.executeUpdate();
        }
        response.sendRedirect("inbox.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
