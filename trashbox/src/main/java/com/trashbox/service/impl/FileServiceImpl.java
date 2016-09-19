package com.trashbox.service.impl;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trashbox.dao.FileDao;
import com.trashbox.service.FileService;
import com.trashbox.vo.AttachFile;

@Service
public class FileServiceImpl implements FileService {
	@Autowired FileDao fileDao;
	
	private static String readableFileSize(long size) {
	    if(size <= 0) return "0";
	    final String[] units = new String[] { "B", "KB", "MB", "GB", "TB" };
	    int digitGroups = (int) (Math.log10(size)/Math.log10(1024));
	    return new DecimalFormat("#,##0.#").format(size/Math.pow(1024, digitGroups)) + " " + units[digitGroups];
	}
	
	@Override
	public List<AttachFile> getFileList(int articleNo) {
		
		List<AttachFile> attachFiles = fileDao.selectList(articleNo);	
		
		for(int i=0; i< attachFiles.size(); i++) {
			long size = Integer.parseInt(attachFiles.get(i).getSize());	
			String formattingSize = readableFileSize(size);		
			attachFiles.get(i).setSize(formattingSize);
		}
		
		return attachFiles;
	}
	
	@Override
	public int add(int articleNo, String originName, String saveName, long size, String type) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("no", articleNo);
		paramMap.put("name", originName);
		paramMap.put("saveName", saveName);
		paramMap.put("size", size);
		paramMap.put("type", type);
		
		return fileDao.insert(paramMap);
	}
	
	@Override
	public int remove(AttachFile attachFile) {
		return fileDao.delete(attachFile.getNo());
	}
	
//    @Override
//	public List<Comment> list(int articleNo, int page) {	
//		return commentDao.list(articleNo, page);
//	}
//	
//    @Override
//	public int add(Comment comment) {
//		return commentDao.add(comment);
//	}
//    
//    @Override
//    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and #comment.userNo == principal.no)")
//    public int remove(Comment comment) {
//    	return commentDao.remove(comment);
//    }
//	
//    @Override
//	public int getTotalCount(int articleNo) {
//		return commentDao.getTotalCommentNum(articleNo);
//	}
//	
//    @Override
//    public List<Comment> list() {
//    	return commentDao.selectNewComments();
//    }
//
//	@Override
//	public List<Map<Integer, Integer>> getTotalCount(List<Integer> articleNoList) {
//		return commentDao.selectTotalCount(articleNoList);
//	}
//
//	
	
	@Override
	public boolean hasFile(int articleNo) {
		
		return fileDao.hasFile(articleNo);
	}

	
	
	
	


}
