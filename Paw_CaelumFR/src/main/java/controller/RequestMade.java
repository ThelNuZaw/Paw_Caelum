package controller;

import javamodel.WalkRequest;
import javamodel.Dog;
import javaDAO.WalkRequestDAO;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
/**
 * Servlet implementation class RequestMade
 */
@WebServlet("/RequestMade")
public class RequestMade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
		WalkRequestDAO dao = new WalkRequestDAO();
		List<Dog>reqDogs = dao.getallrequestDog();
		request.setAttribute("opdogs", reqDogs);
		request.getRequestDispatcher("availableRequest.jsp").forward(request, response);
		}catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch open requests.");
		}
		
	}

       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
		int dogid = Integer.parseInt(request.getParameter("dogid"));
		double price = Double.parseDouble(request.getParameter("price"));
		int duration = Integer.parseInt(request.getParameter("duration"));
		String note = request.getParameter("note");
		
		
		int ownerid = (int) session.getAttribute("id");
		
		WalkRequest wr = new WalkRequest();
		
		wr.setDogid(dogid);
		//wr.setWalkerid(0); // null for temp
	   // wr.setStatus("in progress");
		wr.setPrice(price);
		wr.setDuration(duration);
		wr.setNote(note);
		
		
			WalkRequestDAO wrdao = new WalkRequestDAO();
			int walkid = wrdao.insertdataTo_walkrequest(wr);
			
			if(walkid > 0 ) {
			
			
			wrdao.insertdataTo_makerequest(walkid, ownerid);
			response.sendRedirect("MyDog");
			
			}
			else {
				 response.getWriter().println("Failed to create walk request.");
			}
		}catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch your dogs.");
      
        }
		
	}
}
				
			
		
	
