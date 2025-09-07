package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/CompleteWalk")
public class CompleteWalk extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        int walkerId = (Integer) session.getAttribute("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "feifeisone@2018"
            );

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE Walk_Request SET Status = 'completed' WHERE Walker_ID = ? AND Status = 'accepted'"
            );
            ps.setInt(1, walkerId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println(" Walk marked as completed.");
            } else {
                System.out.println("️ No active walk found to complete.");
            }

            conn.close();
            response.sendRedirect("walker.jsp?completed=true");


        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
