package com.trashbox.service;

import java.util.List;

import com.trashbox.vo.AttachFile;

public interface FileService {
	
	int add(int articleNo, String originName, String saveName, long size, String type);
//	int edit(Article article);
//	int remove(Article article); 
	
	int remove(AttachFile attachFile);
	
	List<AttachFile> getFileList(int articleNo);
	
	boolean hasFile(int articleNo);
	
}
