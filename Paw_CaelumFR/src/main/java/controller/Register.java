package controller;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

//Trigger compile

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		  return DriverManager.getConnection(
			        "jdbc:mysql://localhost:3306/Paw_Caelum?useSSL=false&allowPublicKeyRetrieval=true",
			        "root",
			        "feifeisone@2018"
			    );
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("uname");
		String birthday = request.getParameter("bd");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("ph");
		String password = request.getParameter("pss");
		String role = request.getParameter("role");
		String zip = request.getParameter("zip");
		
		RequestDispatcher rd = null;
		
		try {Connection con = getConnection();
		
			PreparedStatement checkemail = con.prepareStatement("SELECT email FROM Paw_Caelum.User WHERE email = ?");
			checkemail.setString(1,email);
			ResultSet rsemail = checkemail.executeQuery();
			if(rsemail.next()) {
				request.setAttribute("status", "email_exists");
	            rd = request.getRequestDispatcher("register.jsp");
	            rd.forward(request, response);
	           return;
			}
			 
			 PreparedStatement ps = con.prepareStatement("INSERT INTO Paw_Caelum.User(name, birthday, email, address, Phone, password, role, Zip) VALUES (?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			 ps.setString(1, name);
			 ps.setDate(2, Date.valueOf(birthday));
			 ps.setString(3, email);
			 ps.setString(4, address);
			 ps.setString(5, phone);
			 ps.setString(6, password);
			 ps.setString(7,  role);
			 ps.setString(8, zip);
			 int rowCount = ps.executeUpdate();
			 
			
			 if(rowCount > 0) {
				 request.setAttribute("status", "success");
				 ResultSet rs = ps.getGeneratedKeys();
				 if(rs.next()) {
				 int userid = rs.getInt(1);
				 if("owner".equals(role)) {
					 String emergency = request.getParameter("em");
					 PreparedStatement psOwner = con.prepareStatement("INSERT INTO Paw_Caelum.Owner(Owner_id, Emergency_contact) VALUES (?,?)");
					 	psOwner.setInt(1, userid);
	                    psOwner.setString(2, emergency);
	                    psOwner.executeUpdate();
	                    System.out.println("Registered as Owner:");
	                } else if ("walker".equals(role)) {
	                	String bio = request.getParameter("bio");
	                	String exp = request.getParameter("exp");
	             
	                    PreparedStatement psWalker = con.prepareStatement("INSERT INTO Paw_Caelum.Walker (Walker_ID, Bio, Experience) VALUES (?, ?, ?)");
	                    psWalker.setInt(1, userid);
	                    psWalker.setString(2, bio);
	                    psWalker.setString(3, exp);
	                    psWalker.setString(4,zip);
	                 
	                    psWalker.executeUpdate();
	                    System.out.println("Registered as Walker:");
	                }
				 }
			 
				 
			 }
			 else {
				 request.setAttribute("status", "fail");
			 }
			rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request,response);
			 
		}catch(Exception e){
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
	}

}
