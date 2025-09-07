package controller;
import javamodel.Dog;
import javaDAO.DogDAO;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Filter
 */
@WebServlet("/Filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String size = request.getParameter("size");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String minZip = request.getParameter("minZip");
        String maxZip = request.getParameter("maxZip");

        try {
            DogDAO dao = new DogDAO();
            List<Dog> result = dao.filterDogs(size, minPrice, maxPrice, minZip, maxZip);
            System.out.println("Size: " + size);
            request.setAttribute("filterdogs", result);
            request.getRequestDispatcher("availableRequest.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	
}
