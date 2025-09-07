package javaDAO;
import java.sql.*;
import java.util.*;
import javamodel.WalkerViewRating;

public class RatingDAO {
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
	public void insertRating(int ownerid, int walkerid, String comment, int score) {
		String sql = "INSERT INTO Paw_Caelum.OWNER_WALKER_RATING(Owner_id, Walker_id, Comment, RatingScore) VALUES (?,?,?,?)";
		try (Connection c = getConnection();
	             PreparedStatement ps = c.prepareStatement(sql)) {
	            ps.setInt(1, ownerid);
	            ps.setInt(2, walkerid);
	            ps.setString(3, comment);
	            ps.setInt(4, score);
	            ps.executeUpdate();
	        }catch(Exception e) {
	        	System.out.println("Database connection or query failed.");
	            e.printStackTrace();
	            
	        }

	}
	
	public double[] getWalkerAverageAndCount(int walkerId) throws Exception {
        String sql = "SELECT COALESCE(AVG(RatingScore),0), COUNT(*) FROM OWNER_WALKER_RATING WHERE Walker_id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, walkerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new double[]{ rs.getDouble(1), rs.getInt(2) };
                }
            }
        }
        return new double[]{0.0, 0.0};
    }
	
	public List<WalkerViewRating> getWalkerRatings(int walkerId, int limit) throws Exception {
        String sql = "SELECT r.RatingScore, r.Comment, u.Name " +
                     "FROM OWNER_WALKER_RATING r JOIN User u ON u.User_id = r.Owner_id " +
                     "WHERE r.Walker_id=? ORDER BY r.rating_ID DESC LIMIT ?";
        List<WalkerViewRating> list = new ArrayList<>();
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, walkerId);
            ps.setInt(2, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new WalkerViewRating(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                    ));
                }
            }
        }
        return list;
    }
	

}
