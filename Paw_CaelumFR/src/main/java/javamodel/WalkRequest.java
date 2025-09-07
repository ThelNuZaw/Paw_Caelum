package javamodel;

public class WalkRequest {
	private int walkrequestid;
	private int dogid;
	private int walkerid;
	private String status;
	private double price;
	private int duration;
	private String note;
	
	public int getWalkrequestid() {
		return walkrequestid;
	}
	public void setWalkrequestid(int walkrequestid) {
		this.walkrequestid = walkrequestid;
	}
	public int getDogid() {
		return dogid;
	}
	public void setDogid(int dogid) {
		this.dogid = dogid;
	}
	public int getWalkerid() {
		return walkerid;
	}
	public void setWalkerid(int walkerid) {
		this.walkerid = walkerid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	

}

