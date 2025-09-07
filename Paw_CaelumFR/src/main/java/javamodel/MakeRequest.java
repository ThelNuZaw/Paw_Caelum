package javamodel;
import java.time.LocalDateTime;


public class MakeRequest {
	private int walkrequestid;
	private int ownerid;
	private LocalDateTime creation_at;
	public int getWalkrequestid() {
		return walkrequestid;
	}
	public void setWalkrequestid(int walkrequestid) {
		this.walkrequestid = walkrequestid;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public LocalDateTime getCreation_at() {
		return creation_at;
	}
	public void setCreation_at(LocalDateTime creation_at) {
		this.creation_at = creation_at;
	}
	
	
}

