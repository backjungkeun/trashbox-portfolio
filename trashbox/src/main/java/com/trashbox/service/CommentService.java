package com.trashbox.service;

import java.util.List;
import java.util.Map;

import com.trashbox.vo.Comment;

public interface CommentService {

	public int add(Comment comment);
	public int remove(Comment comment);
	
	public List<Comment> list(int articleNo, int page);
	
	public int getTotalCount(int articleNo);
	
	//main
	public List<Comment> list();
	
	
	public List<Map<Integer, Integer>> getTotalCount(List<Integer> articleNoList);

}
