package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String password = request.getParameter("pss");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
            	    "jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true",
            	    "root",
            	    "feifeisone@2018"
            	);

            PreparedStatement pst = con.prepareStatement(
                "SELECT User_id, role, name FROM Paw_Caelum.User WHERE email = ? AND password = ?");
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                System.out.println("Logged in as role: " + role);
                
                HttpSession session = request.getSession();
                session.setAttribute("id", rs.getInt("User_id"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("role", role);

                if ("owner".equalsIgnoreCase(role)) {
                    session.setAttribute("status", "owner");
                    System.out.println("Redirecting to owner.jsp");
                    response.sendRedirect(request.getContextPath() + "/owner.jsp");
                } else {
                    session.setAttribute("status", "walker");
                    System.out.println("Redirecting to walker.jsp");
                    response.sendRedirect(request.getContextPath() + "/walker.jsp");
                }
            } else {
                request.setAttribute("status", "error");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        System.out.println("Login servlet loaded");
	}
}

