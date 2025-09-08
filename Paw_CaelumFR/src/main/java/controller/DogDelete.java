package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import javaDAO.DogDAO;
import javamodel.Dog;


@WebServlet("/DogDelete")
public class DogDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dogid = Integer.parseInt(request.getParameter("dogid"));
		try {
			 
				DogDAO dogdao = new DogDAO();
				boolean isrequest = dogdao.restrictededitdel(dogid);
				if(isrequest) {
				
				request.setAttribute("message", "This is not allowed to be deleted.");
				request.getRequestDispatcher("deletedog.jsp").forward(request, response);		
				return;
				}else {
				dogdao.deleteDog(dogid);
				System.out.println("Successfully deleted" + dogid);
				HttpSession session = request.getSession(false);
	            int ownerId = (int) session.getAttribute("id");
	            List<Dog> updatedDogs = dogdao.getDogForOwner(ownerId);
	            request.setAttribute("MyDog", updatedDogs);
				request.getRequestDispatcher("MyDog.jsp").forward(request, response);
				}
				
		}catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Delete failed: " + e.getMessage());
        }
    }

}