package controller;
import javaDAO.DogDAO;
import javamodel.Dog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditDog
 */
@WebServlet("/EditDog")
public class EditDog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dogId = Integer.parseInt(request.getParameter("dogid"));
		
        try {
            DogDAO dao = new DogDAO();
            boolean isrequest = dao.restrictededitdel(dogId);
            request.setAttribute("message", isrequest);

            Dog dog = dao.getDogById(dogId); 

            if (dog != null) {
                request.setAttribute("dog", dog);
                
            } else {
                response.getWriter().println("Dog not found.");
            }
            request.getRequestDispatcher("editdog.jsp").forward(request, response);
           
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
	

}
