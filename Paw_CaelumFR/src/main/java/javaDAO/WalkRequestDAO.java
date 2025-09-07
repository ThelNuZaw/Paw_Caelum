package javaDAO;
import javamodel.Dog;
import javamodel.WalkRequest;

import java.sql.*;
import java.util.*;

public class WalkRequestDAO {
    
    private static Connection getConnection() throws ClassNotFoundException, SQLException {
        String db = "Paw_Caelum"; 
        String user = "root";
        String password = "feifeisone@2018";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false",
            user, password
        );
    }

    public int insertdataTo_walkrequest(WalkRequest wr) throws ClassNotFoundException, SQLException {
        
        String requestsql = "INSERT INTO Paw_Caelum.Walk_Request" + "(Dog_ID, Walker_ID, status, price, duration, note) VALUES " + "(?,NULL,'open',?,?,?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(requestsql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, wr.getDogid());
            ps.setDouble(2, wr.getPrice());
            ps.setInt(3, wr.getDuration());
            ps.setString(4, wr.getNote());

            ps.executeUpdate();

            try (ResultSet wid = ps.getGeneratedKeys()) {
                if (wid.next()) {
                    return wid.getInt(1);
                }
            }

        } catch (SQLException e) {
            System.out.println("Database connection or query failed.");
            e.printStackTrace();
        }

        return -1;
    }

    public void insertdataTo_makerequest(int wrid, int oid) throws ClassNotFoundException, SQLException {
        String mrequestsql = "INSERT INTO paw_Caelum.Make_Request" + "(Walkrequest_ID, Owner_Id) VALUES " + "(?,?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(mrequestsql)) {
            ps.setInt(1, wrid);
            ps.setInt(2, oid);
            ps.executeUpdate();
        }
    }

    public List<Dog> getallrequestDog() throws ClassNotFoundException, SQLException {
        List<Dog> d = new ArrayList<>();
        String getreqinfo = "SELECT d.* ,w.price, w.duration, w.note FROM Dogs d JOIN Walk_Request w ON d.Dog_Id = w.Dog_ID WHERE w.status = 'open'";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(getreqinfo);
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

                String info = "Price: " + rs.getDouble("price") + "$ for " + rs.getInt("duration") + " hr.   (" + rs.getString("note") + ")";
                dog.setBasic_info(info);

                d.add(dog);
            }
        }
        return d;
    }

    public static String getstatus(int Dogid) throws ClassNotFoundException, SQLException {
        String status = "No Request Yet";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT Status FROM Paw_Caelum.Dogs d JOIN Walk_Request wr ON d.Dog_Id = wr.Dog_Id JOIN Owner o ON o.Owner_Id = d.Owner_Id WHERE wr.Dog_Id = ?")) {
            ps.setInt(1, Dogid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    status = rs.getString("status");
                }
            }
        }
        return status;
    }
}
