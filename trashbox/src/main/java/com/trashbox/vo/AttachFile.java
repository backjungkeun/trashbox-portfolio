package com.trashbox.vo;

import java.io.Serializable;

public class AttachFile implements Serializable {
	private static final long serialVersionUID = 1L;

	private int no;
	private int articleNo;
	private String originName;
	private String saveName;
	private String size;
	private String type;
	
	@Override
	public String toString() {
		return "AttachFile [no=" + no + ", articleNo=" + articleNo + ", originName=" + originName + ", saveName="
				+ saveName + ", size=" + size + ", type=" + type + "]";
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

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
}
