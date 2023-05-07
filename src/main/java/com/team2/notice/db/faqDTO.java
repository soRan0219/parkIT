package com.team2.notice.db;

import java.sql.Date;

public class faqDTO {
	
	private int faqNumber;
	private String faqTitle;
	private String faqContents;
	private Date faqDate;
	
	
	
	public int getFaqNumber() {
		return faqNumber;
	}
	public void setFaqNumber(int faqNumber) {
		this.faqNumber = faqNumber;
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
	@Override
	public String toString() {
		return "faqDTO [faqNumber=" + faqNumber + ", faqTitle=" + faqTitle + ", faqContents=" + faqContents
				+ ", faqDate=" + faqDate + "]";
	}
	
	
	
	
	
	

}
