package com.trashbox.vo;

import java.io.Serializable;

public class Role implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int       no;
	private String  name;
	
	@Override
	public String toString() {
		return "Role [no=" + no + ", name=" + name + "]";
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

}
