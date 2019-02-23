package model;

public class User {
	private String uid;
	private String uname;
	private String upassword;
	private String uemail;
	private String uphone;
	private String ucity;
	private int uexperience;
	private float ubalance; 
	private int urank;
	private int kind;
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getUrank() {
		return urank;
	}
	public void setUrank(int urank) {
		this.urank = urank;
	}
	public float getUbalance() {
		return ubalance;
	}
	public void setUbalance(float ubalance) {
		this.ubalance = ubalance;
	}
	public int getUexperience() {
		return uexperience;
	}
	public void setUexperience(int uexperience) {
		this.uexperience = uexperience;
	}
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUcity() {
		return ucity;
	}
	public void setUcity(String ucity) {
		this.ucity = ucity;
	}
}