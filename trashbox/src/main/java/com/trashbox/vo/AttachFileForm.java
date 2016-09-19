package com.trashbox.vo;

import java.io.Serializable;
import java.util.List;

/*RequestParam 에서 리스트로 받기 위함*/
public class AttachFileForm implements Serializable {
	private static final long serialVersionUID = 1L;

	private List<AttachFile> attachFiles;

	public List<AttachFile> getAttachFiles() {
		return attachFiles;
	}

	public void setAttachFiles(List<AttachFile> attachFiles) {
		this.attachFiles = attachFiles;
	}
	

	
	
	
	
	
	
	
}
