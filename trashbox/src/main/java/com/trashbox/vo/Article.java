package com.trashbox.vo;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int		 no;
	private int		 userNo;
	private int 	 boardNo;
	private String 	 userNickname;
	private String   title;
	private String   content;
	private int      hitCount;
	private int      recommendCount;
	private Date     registrationDate;
	private Date     changeDate;
	
	private boolean  hasImage;
	private boolean  hasFile;
	
	@Override
	public String toString() {
		return "Article [no=" + no + ", userNo=" + userNo + ", boardNo=" + boardNo + ", userNickname=" + userNickname
				+ ", title=" + title + ", content=" + content + ", hitCount=" + hitCount + ", recommendCount="
				+ recommendCount + ", registrationDate=" + registrationDate + ", changeDate=" + changeDate
				+ ", hasImage=" + hasImage + ", hasFile=" + hasFile + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public boolean isHasImage() {
		return hasImage;
	}

	public void setHasImage(boolean hasImage) {
		this.hasImage = hasImage;
	}

	public boolean isHasFile() {
		return hasFile;
	}

	public void setHasFile(boolean hasFile) {
		this.hasFile = hasFile;
	}
	
	
	
	
	
}
