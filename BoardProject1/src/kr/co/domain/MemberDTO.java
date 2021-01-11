package kr.co.domain;

public class MemberDTO {
	private String id;
	private String name;
	private String email;
	private String pw;
	private String date;
	private int tel;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public MemberDTO(String id, String name, String email, String pw, String date, int tel) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.pw = pw;
		this.date = date;
		this.tel = tel;
	}

	

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getTel() {
		return tel;
	}


	public void setTel(int tel) {
		this.tel = tel;
	}


	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", name=" + name + ", pw=" + pw + "]";
	}
	
	
	

}
