<%@page import="java.sql.*, javax.servlet.http.*" %>
<%
    int walkerId = (Integer) session.getAttribute("id");
    int dogId = Integer.parseInt(request.getParameter("dogid"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/paw_caelum?useSSL=false&allowPublicKeyRetrieval=true",
            "root",
            "feifeisone@2018"
        );
        
        System.out.println(" JDBC Connection attempted...");


        
        PreparedStatement check = conn.prepareStatement(
            "SELECT COUNT(*) AS active FROM Walk_Request WHERE Walker_ID = ? AND Status = 'accepted'"
        );
        check.setInt(1, walkerId);
        ResultSet rcheck = check.executeQuery();
        rcheck.next();

        if (rcheck.getInt("active") > 0) {
            out.println("<p style='color:red;'>You already have an active walk. Complete it before accepting another.</p>");
            return;
        }

        
        PreparedStatement ps1 = conn.prepareStatement(
            "SELECT Walkrequest_ID FROM Walk_Request WHERE Dog_ID = ? AND Status = 'open' LIMIT 1"
        );
        ps1.setInt(1, dogId);
        ResultSet rs = ps1.executeQuery();

        if (rs.next()) {
            int requestId = rs.getInt("Walkrequest_ID");

            PreparedStatement ps2 = conn.prepareStatement(
                "UPDATE Walk_Request SET Status = 'accepted', Walker_ID = ? WHERE Walkrequest_ID = ?"
            );
            ps2.setInt(1, walkerId);
            ps2.setInt(2, requestId);

            int updated = ps2.executeUpdate();

            if (updated > 0) {
                response.sendRedirect("walker.jsp?accepted=true");
            } else {
                out.println("Failed to accept walk request.");
            }
        } else {
            out.println("No open walk request found for this dog.");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
