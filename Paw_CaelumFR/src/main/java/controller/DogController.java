package controller;
import javaDAO.DogDAO;
import javamodel.Dog;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import javax.servlet.annotation.MultipartConfig;
import java.util.*;
import javax.servlet.http.*;



@WebServlet("/DogController")
@MultipartConfig
public class DogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DogDAO dogdao = new DogDAO();

    
    public DogController() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		try {
		List<Dog> dogList = dogdao.displayDog(status);
		request.setAttribute("LDog", dogList);
		request.getRequestDispatcher("DogList.jsp").forward(request, response);
		
		}catch(Exception e) {
	        request.setAttribute("message", "Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		String breed = request.getParameter("breed");
		String size = request.getParameter("size");
		int age = Integer.parseInt(request.getParameter("age"));
		String basic_info = request.getParameter("basic_info");
		Part photo = request.getPart("photo");
		
		String fileName = Paths.get(photo.getSubmittedFileName()).getFileName().toString();

	    
		String appPath = request.getServletContext().getRealPath("");
		String uploadPath = appPath + File.separator + "uploads";

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs(); // create if not exists
		}

		File savedFile = new File(uploadPath, fileName);
		photo.write(savedFile.getAbsolutePath());

		// ✅ Only store relative path in DB
		String photoPath = "uploads/" + fileName;
		
	    HttpSession session = request.getSession(false);
	    int ownerid = (int) session.getAttribute("id");
		
		Dog dog = new Dog();
		dog.setName(name);
		dog.setBreed(breed);
		dog.setSize(size);
		dog.setAge(age);
		dog.setBasic_info(basic_info);
		dog.setPhoto(photoPath);
		dog.setOwnerid(ownerid);
		try {
		dogdao.postingdog(dog);
	
		response.sendRedirect("MyDog");
		
		}catch (Exception e) {
        request.setAttribute("message", "Error: " + e.getMessage());
        e.printStackTrace();
    }
	}

    
}