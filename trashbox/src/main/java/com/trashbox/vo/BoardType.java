package com.trashbox.vo;

import java.io.Serializable;

public class BoardType implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String name;
	private String koName;
	private int permissionNo;
	
	@Override
	public String toString() {
		return "BoardType [no=" + no + ", name=" + name + ", koName=" + koName + ", permissionNo=" + permissionNo + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKoName() {
		return koName;
	}
	public void setKoName(String koName) {
		this.koName = koName;
	}
	public int getPermissionNo() {
		return permissionNo;
	}
	public void setPermissionNo(int permissionNo) {
		this.permissionNo = permissionNo;
	}
	
	
	

}
