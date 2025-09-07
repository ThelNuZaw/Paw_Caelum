package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import javaDAO.RatingDAO;
import javamodel.WalkerViewRating;


@WebServlet("/WalkerviewRating")
public class WalkerviewRating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		Integer walkerId = (Integer)session.getAttribute("id");
		String role = (String) session.getAttribute("role");
		if (walkerId == null || role == null || !"walker".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
	
	try {
		RatingDAO ratdao = new RatingDAO();
		double[] avgC = ratdao.getWalkerAverageAndCount(walkerId);
		List<WalkerViewRating> ratings = ratdao.getWalkerRatings(walkerId, 10);
		request.setAttribute("avg", avgC[0]);
        request.setAttribute("count", (int) avgC[1]);
        request.setAttribute("ratings", ratings);

        request.getRequestDispatcher("walkerRating.jsp").forward(request, response);
    } catch (Exception e) {
        throw new ServletException(e);
    }

	

	}
}
