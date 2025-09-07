package controller;
import javaDAO.RatingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/rate")
public class Rating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		Integer ownerId = (Integer)session.getAttribute("id");
		String role = (String) session.getAttribute("role");
		if (ownerId == null || role == null || !"owner".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
		
		try {
			RatingDAO ratdao = new RatingDAO();
			int walkerid = Integer.parseInt(request.getParameter("walkerId"));
			int rating = Integer.parseInt(request.getParameter("ratingScore"));
			String comment = request.getParameter("comment");
			
			ratdao.insertRating(ownerId, walkerid, comment == null ? null : comment.trim(), rating);
			
			response.sendRedirect("owner.jsp?rated=1");
			
		}catch(Exception e) {
            e.printStackTrace();
            response.sendError(500, "Error saving rating");
        }
	
	}

}
