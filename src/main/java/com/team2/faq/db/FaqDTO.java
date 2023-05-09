package com.team2.faq.db;

import java.sql.Date;

public class FaqDTO {
	// 자바빈 => DTO(Data Transfer Object)
	//               데이터 전송 객체
	//               DB 데이터를 JSP페이지로 전송 
	
	private int faqNo;
	private String faqTitle;
	private String faqContents;
	private Date faqDate;
	
	
	
	// alt shift s + r
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContents() {
		return faqContents;
	}
	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}
	public Date getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}
	
	// alt shift s + s
	@Override
	public String toString() {
		return "FaqDTO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContents=" + faqContents + ", faqDate="
				+ faqDate + "]";
	}
	
	
	
	

	
	

}
