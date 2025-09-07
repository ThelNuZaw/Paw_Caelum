package controller;
import javaDAO.DogDAO;
import javamodel.Dog;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@WebServlet("/MyDog")
public class MyDog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) { 
            response.sendRedirect("login.jsp"); 
            return;
        }

        int ownerId = (int) session.getAttribute("id");
        System.out.println("Session ownerId = " + session.getAttribute("id"));


        try {
            DogDAO dao = new DogDAO();
            List<Dog> dogList = dao.getDogForOwner(ownerId);
            
            System.out.println("Number of dogs found: " + dogList.size());


            request.setAttribute("MyDog", dogList);
            request.getRequestDispatcher("MyDog.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch your dogs.");
            request.getRequestDispatcher("MyDog.jsp").forward(request, response);
      
        }
    }
	
	}

	

