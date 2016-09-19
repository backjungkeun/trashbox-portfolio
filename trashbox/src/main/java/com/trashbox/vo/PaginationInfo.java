package com.trashbox.vo;

import java.io.Serializable;

public class PaginationInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int totalNum;
	private int currentPage;
	private int totalPageNum;
	private int start;
	private int end;
	private int page; // DB에 요청한 요청할 페이지 번호
	
	
	public PaginationInfo(int totalNum, int currentPage, int totalPageNum, int start, int end, int page) {
		this.totalNum = totalNum;
		this.currentPage = currentPage;
		this.totalPageNum = totalPageNum;
		this.start = start;
		this.end = end;
		this.page = page;
	}

	
	@Override
	public String toString() {
		return "PaginationInfo [totalNum=" + totalNum + ", currentPage=" + currentPage + ", totalPageNum="
				+ totalPageNum + ", start=" + start + ", end=" + end + ", page=" + page + "]";
	}


	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	

}
