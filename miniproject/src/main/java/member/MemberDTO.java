package member;

//ID       NOT NULL NUMBER        
//USERID   NOT NULL VARCHAR2(100) 
//USERPW   NOT NULL VARCHAR2(500) 
//USERNAME NOT NULL VARCHAR2(100) 
//EMAIL    NOT NULL VARCHAR2(100) 
//GENDER            VARCHAR2(100) 
//PNUM     NOT NULL VARCHAR2(100) 
//ISADMIN           NUMBER        
//DELETED           NUMBER        
//AGE               NUMBER 

public class MemberDTO {
	private int id;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String gender;
	private String pNum;
	private int isAdmin;
	private int deleted;
	private int age;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}