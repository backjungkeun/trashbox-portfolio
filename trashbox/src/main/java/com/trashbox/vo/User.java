package com.trashbox.vo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int 			no; 
	private String 			id; 
	private String			password; 
	private String  		nickname;
	private String  		email; 
	private Date 			registrationDate;
	private Date 			lastLoginDate; 
	private String 			profileImage;
	private boolean 		enabled; 
	private boolean 		unlocked;
//	private List<Role>		roles;
	
	@Override
	public String toString() {
		return "User [no=" + no + ", id=" + id + ", password=" + password + ", nickname=" + nickname + ", email="
				+ email + ", registrationDate=" + registrationDate + ", lastLoginDate=" + lastLoginDate
				+ ", profileImage=" + profileImage + ", enabled=" + enabled + ", unlocked=" + unlocked + "]";
	}

	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public boolean isUnlocked() {
		return unlocked;
	}
	public void setUnlocked(boolean unlocked) {
		this.unlocked = unlocked;
	}
//	public List<Role> getRoles() {
//		return roles;
//	}
//	public void setRoles(List<Role> roles) {
//		this.roles = roles;
//	}
	
	

}
