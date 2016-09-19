package com.trashbox.vo;

import java.io.Serializable;


/* jQuery FileUpload */
public class FileInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	private String deleteType;
	private String deleteUrl;
	private String name;
	private String saveName;
	private long size;
	private String thumbnailUrl;
	private String type;
	private String url;
	
	
	@Override
	public String toString() {
		return "FileInfo [deleteType=" + deleteType + ", deleteUrl=" + deleteUrl + ", name=" + name + ", saveName="
				+ saveName + ", size=" + size + ", thumbnailUrl=" + thumbnailUrl + ", type=" + type + ", url=" + url
				+ "]";
	}
	
	public String getDeleteType() {
		return deleteType;
	}
	public void setDeleteType(String deleteType) {
		this.deleteType = deleteType;
	}
	public String getDeleteUrl() {
		return deleteUrl;
	}
	public void setDeleteUrl(String deleteUrl) {
		this.deleteUrl = deleteUrl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	

}
