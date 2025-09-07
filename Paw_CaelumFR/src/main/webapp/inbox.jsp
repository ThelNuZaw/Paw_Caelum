<%@ page import="java.sql.*" %> 
<% int id = (int) session.getAttribute("id"); 
try { Class.forName("com.mysql.cj.jdbc.Driver"); 
try (Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true",
        "root",
        "feifeisone@2018"); 
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery( "SELECT Sender, Content, sent_at FROM COMMUNICATIONS WHERE Receiver = " + id + " ORDER BY sent_at DESC")) { 
	boolean hasMessages = false; 
	while (rs.next()) { 
		hasMessages = true; 
		//out.println("<p><b>From User #" + rs.getInt("Sender") + ":</b><br>"); 
		out.println(rs.getString("Content") + "<br>"); 
		out.println("<i>" + rs.getTimestamp("sent_at") + "</i></p><hr>"); } 
		if (!hasMessages) { out.println("<p>No messages yet.</p>"); 
		} } } 
		catch (Exception e) { out.println("Error: " + e.getMessage()); e.printStackTrace(); } %>