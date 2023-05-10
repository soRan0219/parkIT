package com.team2.notice.db;

import java.sql.Date;

public class NoticeDTO {
	

	private String noticeTitle;
	private String noticeContents;
	private int noticeNo;
	private Date noticeDate;
	private int noticeRc;
	private String noticeFile;
	
	
	
	
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeRc() {
		return noticeRc;
	}
	public void setNoticeRc(int noticeRc) {
		this.noticeRc = noticeRc;
	}
	public String getNoticeFile() {
		return noticeFile;
	}
	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}
	
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeTitle=" + noticeTitle + ", noticeContents=" + noticeContents + ", noticeNo=" + noticeNo
				+ ", noticeDate=" + noticeDate + ", noticeRc=" + noticeRc + ", noticeFile=" + noticeFile + "]";
	}
	
	
	
	
	
	
	
	

}
