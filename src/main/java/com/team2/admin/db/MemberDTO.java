package com.team2.admin.db;

import java.sql.Date;

public class MemberDTO {
	// jspdb : itwill_member 테이블 정보 저장객체
	private String id;
	private String pw;
	private String memName;
	private String tel;
	private Date birth;
	private String email;
	private Date regDate;
	private int point;
	
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
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	// alt shfit s + s
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", memName=" + memName + ", tel=" + tel + ", birth=" + birth
				+ ", email=" + email + ", regDate=" + regDate + ", point=" + point + "]";
	}

}
