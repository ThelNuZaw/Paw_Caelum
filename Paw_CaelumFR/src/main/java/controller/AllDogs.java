package controller;
import javaDAO.DogDAO;
import javamodel.Dog;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@WebServlet("/AllDogs")
public class AllDogs extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	
    	System.out.println("AllDogs servlet reached");

        try {
            DogDAO dao = new DogDAO();
            List<Dog> allDogs = dao.getAllDogs();
            request.setAttribute("allDogs", allDogs);
            request.getRequestDispatcher("DogList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch all dogs.");
        }
    }
}
