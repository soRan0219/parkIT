package com.team2.member.db;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String newpw;
	private String memname;
	private Date birth;
	private String tel;
	private String email;
	private Date regdate;
	
	
	
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
	public String getNewpw() {
		return newpw;
	}
	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", newpw=" + newpw + ", memname=" + memname + ", birth=" + birth
				+ ", tel=" + tel + ", email=" + email + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
}