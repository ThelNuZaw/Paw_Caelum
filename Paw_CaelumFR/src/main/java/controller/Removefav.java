package controller;
import javaDAO.DogDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Removefav
 */
@WebServlet("/Removefav")
public class Removefav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dogid = Integer.parseInt(request.getParameter("dogid"));
		HttpSession session = request.getSession(false);
		int walkerid = (int) session.getAttribute("id"); 
		try {
				DogDAO dogdao = new DogDAO();
				dogdao.deleteFav(dogid, walkerid);
				System.out.println("Successfully delected " + dogid + "for waker " + walkerid);
				response.sendRedirect("Favorite");
				
				
		}catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Delete failed: " + e.getMessage());
        }
    }
	}


