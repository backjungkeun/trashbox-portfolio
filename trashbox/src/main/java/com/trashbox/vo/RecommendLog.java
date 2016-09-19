package com.trashbox.vo;

import java.io.Serializable;

public class RecommendLog implements Serializable {
	private static final long serialVersionUID = 1L;

	private int no;
	private int userNo;
	private int articleNo;

	
	@Override
	public String toString() {
		return "RecommendLog [no=" + no + ", articleNo=" + articleNo + ", userNo=" + userNo + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
