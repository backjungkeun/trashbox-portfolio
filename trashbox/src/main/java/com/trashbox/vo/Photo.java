package com.trashbox.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Photo implements Serializable {
	private static final long serialVersionUID = 1L;

	// photo_uploader.html페이지의 form태그내에 존재하는 file 태그의 name명과 일치시켜줌
	private MultipartFile Filedata;
	// callback URL
	private String callback;
	// 콜백함수??
	private String callback_func;
	
	// 게시판 사진 업로드에서 필요
	private int imageWidth;
	
	// 프로필 사진 변경에서 필요
	private String userProfileInfo;
	
	public MultipartFile getFiledata() {
		return Filedata;
	}
	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}
	public String getCallback() {
		return callback;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}
	public String getCallback_func() {
		return callback_func;
	}
	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}
	public int getImageWidth() {
		return imageWidth;
	}
	public void setImageWidth(int imageWidth) {
		this.imageWidth = imageWidth;
	}
	public String getUserProfileInfo() {
		return userProfileInfo;
	}
	public void setUserProfileInfo(String userProfileInfo) {
		this.userProfileInfo = userProfileInfo;
	}
	
	
	
	

	

}
