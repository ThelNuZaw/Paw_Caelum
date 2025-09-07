package javamodel;

public class Dog {
	private int Dogid;
	private String name;
	private String breed;
	private String size;
	private int age;
	private String basic_info;
	private String photo;
	private int ownerid;
	private String status; // for display only
	
	public int getDogid() {
		return Dogid;
	}
	public void setDogid(int Dogid) {
		this.Dogid = Dogid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getBasic_info() {
		return basic_info;
	}
	public void setBasic_info(String basic_info) {
		this.basic_info = basic_info;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
