package com.team2.question.db;

import java.sql.Date;
import java.time.LocalDateTime;

public class QuestionDTO {
	// 자바빈 => DTO(Data Transfer Object)
	//               데이터 전송 객체
	//                DB 데이터를 JSP페이지로 전송 
	
	private int quNo;
	private int quNoRe;
	private String selOp;
	private String quTitle;
	private String quContents;
	private String quContentsRe;
	private LocalDateTime quDateTime;
	private String id;
	
	
	
	// alt shift s + r
	
	




	public int getQuNo() {
		return quNo;
	}



	public void setQuNo(int quNo) {
		this.quNo = quNo;
	}



	public int getQuNoRe() {
		return quNoRe;
	}



	public void setQuNoRe(int quNoRe) {
		this.quNoRe = quNoRe;
	}



	public String getSelOp() {
		return selOp;
	}



	public void setSelOp(String selOp) {
		this.selOp = selOp;
	}



	public String getQuTitle() {
		return quTitle;
	}



	public void setQuTitle(String quTitle) {
		this.quTitle = quTitle;
	}



	public String getQuContents() {
		return quContents;
	}



	public void setQuContents(String quContents) {
		this.quContents = quContents;
	}



	public String getQuContentsRe() {
		return quContentsRe;
	}



	public void setQuContentsRe(String quContentsRe) {
		this.quContentsRe = quContentsRe;
	}



	public LocalDateTime getQuDateTime() {
		return quDateTime;
	}



	public void setQuDateTime(LocalDateTime quDateTime) {
		this.quDateTime = quDateTime;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	@Override
	public String toString() {
		return "QuestionDTO [quNo=" + quNo + ", quNoRe=" + quNoRe+ ", selOp=" + selOp + ", quTitle=" + quTitle + ", quContentsRe=" + quContentsRe+ ", quContents=" + quContents
				+ ", quDateTime=" + quDateTime + ", id=" + id + "]";
	}
	
	
	
	

	
	

}
