package com.team2.question.db;

import java.sql.Date;
import java.time.LocalDateTime;

public class QuestionDTO {
	// 자바빈 => DTO(Data Transfer Object)
	//               데이터 전송 객체
	//               DB 데이터를 JSP페이지로 전송 
	
	private int quNo;
	private String quTitle;
	private String quContents;
	private LocalDateTime quDateTime;
	private String id;
	
	
	
	// alt shift s + r
	
	public int getQuestionNo() {
		return quNo;
	}
	public void setQuestionNo(int quNo) {
		this.quNo = quNo;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestionTitle() {
		return quTitle;
	}
	public void setQuestionTitle(String quTitle) {
		this.quTitle = quTitle;
	}
	public String getQuestionContents() {
		return quContents;
	}
	public void setQuestionContents(String quContents) {
		this.quContents = quContents;
	}

	public LocalDateTime getQuDateTime() {
		return quDateTime;
	}
	public void setQuDateTime(LocalDateTime quDateTime) {
		this.quDateTime = quDateTime;
	}
	// alt shift s + s
	@Override
	public String toString() {
		return "QuestionDTO [quNo=" + quNo + ", id=" + id +", quTitle=" + quTitle + ", quContents=" + quContents + ", quDateTime="
				+ quDateTime + "]";
	}
	
	
	
	

	
	

}
