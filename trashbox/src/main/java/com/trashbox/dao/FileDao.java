package com.trashbox.dao;

import java.util.List;
import java.util.Map;

import com.trashbox.vo.AttachFile;

public interface FileDao {
	List<AttachFile> selectList(int articleNo);
	int insert(Map<String, Object> paramMap);
	int delete(int attachFileNo);
	
	boolean hasFile(int articleNo);
}
