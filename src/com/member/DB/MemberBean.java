package com.member.DB;
import java.sql.Timestamp;

public class MemberBean {
	//자바빈 
	
	private int num;
	private String id;
	private String pw;
	private String name;
	private String email;
	private int level, travel_agency_no;
	private Timestamp date;
	
	public MemberBean() {}

	public MemberBean(int num, String id, String pw, String name, String email, int level, int travel_agency_no,
			Timestamp date) {
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.level = level;
		this.travel_agency_no = travel_agency_no;
		this.date = date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getTravel_agency_no() {
		return travel_agency_no;
	}

	public void setTravel_agency_no(int travel_agency_no) {
		this.travel_agency_no = travel_agency_no;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

		

}
