package javaDAO ;
import javamodel.Dog;

import java.sql.*;
import java.util.*;

public class DogDAO {
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
	    String db = "Paw_Caelum"; 
	    String user = "root";
	    String password = "feifeisone@2018";

	    Class.forName("com.mysql.cj.jdbc.Driver");

	    return DriverManager.getConnection(
	        "jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false",
	        user, password
	    );
	}
	
	public void postingdog(Dog dog)throws ClassNotFoundException, SQLException{

		String sql = "INSERT INTO Paw_Caelum.Dogs" + "(Name, Breed, Size, Age, Basic_info, Photo, Owner_Id) VALUES " + "(?,?,?,?,?,?,?);";
		
		
		try(Connection con =getConnection();
               
			PreparedStatement ps = con.prepareStatement(sql)){
			ps.setString(1, dog.getName());
	        ps.setString(2, dog.getBreed());                     
	        ps.setString(3, dog.getSize());
	        ps.setInt(4, dog.getAge());
	        ps.setString(5, dog.getBasic_info());
	        ps.setString(6,  dog.getPhoto());
	        ps.setInt(7, dog.getOwnerid());
	        
	       
	        ps.executeUpdate();
		}
	        catch (SQLException e) {
	            System.out.println("Database connection or query failed.");
	            e.printStackTrace();
	        }
	}
	
	public List<Dog> displayDog(String statusFilter) throws ClassNotFoundException, SQLException{
		List<Dog> dogList = new ArrayList<>();
		String reterivedsql = "SELECT d*, wr.status LEFT FROM Paw_Caelum.Dogs AS d LEFT JOIN Paw_Caelum.Walk_Request AS wr ON d.Dog_ID = wr.Dog_ID ORDER BY wr.Walkrequest_ID ASC";
		try(Connection con1 = getConnection();
			PreparedStatement ps1 = con1.prepareStatement(reterivedsql);
			ResultSet rs = ps1.executeQuery();)
		{
			Set<Integer> seen = new HashSet<>();
            while (rs.next()) {
                int dogId = rs.getInt("Dog_Id");
                String status = rs.getString("Status");
                boolean match = statusFilter == null || statusFilter.isEmpty() || statusFilter.equalsIgnoreCase(status);
                if (!seen.contains(dogId) && match) {
                    Dog dog = new Dog();
                    dog.setDogid(dogId);
                    dog.setName(rs.getString("Name"));
                    dog.setBreed(rs.getString("Breed"));
                    dog.setSize(rs.getString("Size"));
                    dog.setAge(rs.getInt("Age"));
                    dog.setBasic_info(rs.getString("Basic_info"));
                    dog.setPhoto(rs.getString("Photo"));
                    dog.setOwnerid(rs.getInt("Owner_id"));
                    dog.setStatus(status);
                    dogList.add(dog);
                    seen.add(dogId);
                }
            }
        }
        return dogList;
		
	}
	public List<Dog> getAllDogs() throws ClassNotFoundException, SQLException {
	    List<Dog> dogList = new ArrayList<>();
	    String sql = "SELECT * FROM Paw_Caelum.Dogs";

	    try (Connection con = getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Dog dog = new Dog();
	            dog.setDogid(rs.getInt("Dog_Id"));
	            dog.setName(rs.getString("Name"));
	            dog.setBreed(rs.getString("Breed"));
	            dog.setSize(rs.getString("Size"));
	            dog.setAge(rs.getInt("Age"));
	            dog.setBasic_info(rs.getString("Basic_info"));
	            dog.setPhoto(rs.getString("Photo"));
	            dog.setOwnerid(rs.getInt("Owner_Id"));
	            dogList.add(dog);
	        }
	    }
	    return dogList;
	}

	public List<Dog> getDogForOwner(int ownerid) throws ClassNotFoundException, SQLException{
		List<Dog> mydogList = new ArrayList<>();
		String getsql = "SELECT * FROM Paw_Caelum.Dogs WHERE Owner_ID = ?";
		try(Connection con2 = getConnection();
				
			PreparedStatement ps2 = con2.prepareStatement(getsql)){
			ps2.setInt(1, ownerid);
			try (ResultSet rs = ps2.executeQuery()) {
                Set<Integer> seen = new HashSet<>();
                while (rs.next()) {
                    int dogId = rs.getInt("Dog_Id");
                    if (!seen.contains(dogId)) {
                        Dog dog = new Dog();
                        dog.setDogid(dogId);
                        dog.setName(rs.getString("Name"));
                        dog.setBreed(rs.getString("Breed"));
                        dog.setSize(rs.getString("Size"));
                        dog.setAge(rs.getInt("Age"));
                        dog.setBasic_info(rs.getString("Basic_info"));
                        dog.setPhoto(rs.getString("Photo"));
                        dog.setOwnerid(rs.getInt("Owner_id"));
                       // dog.setStatus(rs.getString("Status"));
                        mydogList.add(dog);
                        seen.add(dogId);
                    }
                }
            }
        }
        return mydogList;
	}
	
	public Dog getDogById(int Dogid) throws ClassNotFoundException, SQLException{
		Dog dog = null;
		String getdogsql = "SELECT * FROM Paw_Caelum.Dogs WHERE Dog_Id = ?;";
		try (Connection con = getConnection();
		         PreparedStatement ps = con.prepareStatement(getdogsql)) {
		        ps.setInt(1, Dogid);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		                dog = new Dog();
		                dog.setDogid(rs.getInt("Dog_Id"));
		                dog.setName(rs.getString("Name"));
		                dog.setBreed(rs.getString("Breed"));
		                dog.setSize(rs.getString("Size"));
		                dog.setAge(rs.getInt("Age"));
		                dog.setBasic_info(rs.getString("Basic_info"));
		                dog.setPhoto(rs.getString("Photo"));
		                dog.setOwnerid(rs.getInt("Owner_Id"));
		            }
		        }
		    }
		    return dog;
		}
	public void datatofavorite(int did, int wid) throws ClassNotFoundException, SQLException{
		String favsql = "Insert into Paw_Caelum.FAVORITE (Dog_id, Walker_id) Values (?, ?)";
		try (Connection con = getConnection();
		         PreparedStatement ps = con.prepareStatement(favsql)) {
			ps.setInt(1, did);
			ps.setInt(2, wid);
			ps.executeUpdate();
		
		}
		
	}
	public List<Dog> getfavorite(int wid) throws ClassNotFoundException, SQLException{
		
		List<Dog> fav = new ArrayList<>();
		String selectfav = "Select d.* From FAVORITE f JOIN Dogs d ON d.Dog_id = f.Dog_id WHERE f.Walker_id = ?";
		
		try (Connection con = getConnection();
		        PreparedStatement ps = con.prepareStatement(selectfav)) {
				ps.setInt(1, wid);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					Dog dog = new Dog();
					dog.setDogid(rs.getInt("Dog_Id"));
	                dog.setName(rs.getString("Name"));
	                dog.setBreed(rs.getString("Breed"));
	                dog.setSize(rs.getString("Size"));
	                dog.setAge(rs.getInt("Age"));
	                dog.setBasic_info(rs.getString("Basic_info"));
	                dog.setPhoto(rs.getString("Photo"));
					fav.add(dog);
				}
		}
		return fav;	
	}
	public void deleteFav(int Dogid, int wid)  throws ClassNotFoundException, SQLException{
		String delfav = "DELETE FROM Paw_Caelum.FAVORITE WHERE Dog_id = ? AND Walker_id =?";
		try(Connection con =getConnection();
	               
				PreparedStatement ps = con.prepareStatement(delfav)){
			 	ps.setInt(1, Dogid);
			 	ps.setInt(2,  wid);
			 	ps.executeUpdate();
		}
	}

	
	public void updateDog(Dog dog) throws ClassNotFoundException, SQLException{
		String sqlWithPhoto = "UPDATE Paw_Caelum.Dogs SET Name=?, Breed=?, Size=?, Age=?, Basic_info=?, Photo=? WHERE Dog_Id=?";
	    String sqlWithoutPhoto = "UPDATE Paw_Caelum.Dogs SET Name=?, Breed=?, Size=?, Age=?, Basic_info=?, Photo = ? WHERE Dog_Id=?";

	    try (Connection con = getConnection()) {
	        if (dog.getPhoto() != null && !dog.getPhoto().isEmpty()) {
	            try (PreparedStatement ps = con.prepareStatement(sqlWithPhoto)) {
	                ps.setString(1, dog.getName());
	                ps.setString(2, dog.getBreed());
	                ps.setString(3, dog.getSize());
	                ps.setInt(4, dog.getAge());
	                ps.setString(5, dog.getBasic_info());
	                ps.setString(6, dog.getPhoto());
	                ps.setInt(7, dog.getDogid());
	                ps.executeUpdate();
	            }
	        } else {
	        	Dog oldDog = getDogById(dog.getDogid());
	            try (PreparedStatement ps = con.prepareStatement(sqlWithoutPhoto)) {
	                ps.setString(1, dog.getName());
	                ps.setString(2, dog.getBreed());
	                ps.setString(3, dog.getSize());
	                ps.setInt(4, dog.getAge());
	                ps.setString(5, dog.getBasic_info());
	                ps.setString(6, oldDog.getPhoto());
	                ps.setInt(7, dog.getDogid());
	                ps.executeUpdate();
	            }
	            
	        }
	    }
	}

	public void deleteDog(int Dogid) throws ClassNotFoundException, SQLException{
		try (Connection con = getConnection()) {

	       
	        try (PreparedStatement ps = con.prepareStatement("DELETE FROM Favorite WHERE Dog_ID = ?")) {
	            ps.setInt(1, Dogid);
	            ps.executeUpdate();
	        }

	        
	        try (PreparedStatement ps = con.prepareStatement("DELETE FROM Make_Request WHERE Walkrequest_ID IN (SELECT Walkrequest_ID FROM Walk_Request WHERE Dog_ID = ?)")) {
	            ps.setInt(1, Dogid);
	            ps.executeUpdate();
	        }

	        
	        try (PreparedStatement ps = con.prepareStatement("DELETE FROM Walk_Request WHERE Dog_ID = ?")) {
	            ps.setInt(1, Dogid);
	            ps.executeUpdate();
	        }

	        
	        try (PreparedStatement ps = con.prepareStatement("DELETE FROM Dogs WHERE Dog_Id = ?")) {
	            ps.setInt(1, Dogid);
	            ps.executeUpdate();
	        }
	    }
	}
	
	public boolean restrictededitdel(int Dogid) throws ClassNotFoundException, SQLException{
		try(Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM Paw_Caelum.Walk_Request WHERE Dog_ID = ? AND STATUS = 'open'")){
				ps.setInt(1, Dogid);
				
				try(ResultSet rs = ps.executeQuery()){
					if(rs.next()) {
						if(rs.getInt(1) > 0) {
							return true;
						}
					}
				}
				
		}
		return false;
	}
	public List<Dog> filterDogs(String size, String minPrice, String maxPrice, String minZip, String maxZip)
	        throws ClassNotFoundException, SQLException {

	    List<Dog> list = new ArrayList<>();
	    StringBuilder sql = new StringBuilder(
	        "SELECT d.* FROM Paw_Caelum.Dogs d " +
	        "JOIN Paw_Caelum.Walk_Request wr ON d.Dog_Id = wr.Dog_ID " +
	        "JOIN Paw_Caelum.Owner o ON d.Owner_Id = o.Owner_Id " +
	        "JOIN Paw_Caelum.User u ON o.Owner_Id = u.User_Id " + 
	        "WHERE wr.Status = 'open'"
	    );

	    if (size != null && !size.isEmpty())
	        sql.append(" AND d.Size = ?");
	    if (minPrice != null && !minPrice.isEmpty())
	        sql.append(" AND wr.Price >= ?");
	    if (maxPrice != null && !maxPrice.isEmpty())
	        sql.append(" AND wr.Price <= ?");
	    if (minZip != null && !minZip.isEmpty())
	        sql.append(" AND u.Zip >= ?");
	    if (maxZip != null && !maxZip.isEmpty())
	        sql.append(" AND u.Zip <= ?");

	    try (Connection con = getConnection();
	         PreparedStatement ps = con.prepareStatement(sql.toString())) {

	        int index = 1;
	        if (size != null && !size.isEmpty()) ps.setString(index++, size);
	        if (minPrice != null && !minPrice.isEmpty()) ps.setDouble(index++, Double.parseDouble(minPrice));
	        if (maxPrice != null && !maxPrice.isEmpty()) ps.setDouble(index++, Double.parseDouble(maxPrice));
	        if (minZip != null && !minZip.isEmpty()) ps.setInt(index++, Integer.parseInt(minZip));
	        if (maxZip != null && !maxZip.isEmpty()) ps.setInt(index++, Integer.parseInt(maxZip));

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Dog dog = new Dog();
	            dog.setDogid(rs.getInt("Dog_Id"));
	            dog.setName(rs.getString("Name"));
	            dog.setSize(rs.getString("Size"));
	            dog.setPhoto(rs.getString("Photo"));
	            dog.setAge(rs.getInt("Age"));
	            dog.setBreed(rs.getString("Breed"));
	            dog.setBasic_info(rs.getString("Basic_info"));
	            dog.setOwnerid(rs.getInt("Owner_id"));
	            list.add(dog);
	        }
	    }

	    return list;
	}

	
}
