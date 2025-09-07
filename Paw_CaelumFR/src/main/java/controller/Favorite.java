package controller;
import javaDAO.DogDAO;
import javamodel.Dog;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Favorite
 */
@WebServlet("/Favorite")
public class Favorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Integer walkerid = (Integer)session.getAttribute("id");
		
		try {
			DogDAO dao = new DogDAO();
			List<Dog> favdog = dao.getfavorite(walkerid);
			request.setAttribute("favd", favdog);
			request.getRequestDispatcher("favorite.jsp").forward(request,response);
			
		}catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Failed to load favorites: " + e.getMessage());
        }
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dogid = Integer.parseInt(request.getParameter("dogid"));
		HttpSession session = request.getSession(false);
		Integer walkerid = (Integer) session.getAttribute("id");
		if (walkerid == null) {
            response.sendRedirect("login.jsp");
            return;
        }
		try {
		DogDAO dao = new DogDAO();
		dao.datatofavorite(dogid, walkerid);
		

		response.sendRedirect("Favorite");
		
	}catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("Error: " + e.getMessage());
    }

	}
}

