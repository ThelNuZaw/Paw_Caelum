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

@WebServlet("/DogUpdate")
@MultipartConfig
public class DogUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DogUpdate() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
            int dogId = Integer.parseInt(request.getParameter("DogId"));
            String name = request.getParameter("name");
            String breed = request.getParameter("breed");
            String size = request.getParameter("size");
            int age = Integer.parseInt(request.getParameter("age"));
            String basic_info = request.getParameter("basic_info");
            Part photo = request.getPart("photo");

            DogDAO dao = new DogDAO();
            Dog existingDog = dao.getDogById(dogId);

            String photoPath = existingDog.getPhoto();

           
            if (photo != null && photo.getSize() > 0) {
                String fileName = Paths.get(photo.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("/uploads");
                new File(uploadPath).mkdirs();
                File savedFile = new File(uploadPath, fileName);
                photo.write(savedFile.getAbsolutePath());
                photoPath = "uploads/" + fileName;
            }

           
            Dog dog = new Dog();
            dog.setDogid(dogId);
            dog.setName(name);
            dog.setBreed(breed);
            dog.setSize(size);
            dog.setAge(age);
            dog.setBasic_info(basic_info);
            dog.setPhoto(photoPath); 
            dao.updateDog(dog);
            response.sendRedirect("MyDog");
         } catch (Exception e) {
             e.printStackTrace();
             response.getWriter().println("Update failed: " + e.getMessage());
         }
     }
}
