package com.trashbox.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.trashbox.dao.CommentDao;
import com.trashbox.service.CommentService;
import com.trashbox.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired CommentDao commentDao;
	
    @Override
	public List<Comment> list(int articleNo, int page) {	
		return commentDao.list(articleNo, page);
	}
	
    @Override
	public int add(Comment comment) {
		return commentDao.add(comment);
	}
    
    @Override
    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and #comment.userNo == principal.no)")
    public int remove(Comment comment) {
    	return commentDao.remove(comment);
    }
	
    @Override
	public int getTotalCount(int articleNo) {
		return commentDao.getTotalCommentNum(articleNo);
	}
	
    @Override
    public List<Comment> list() {
    	return commentDao.selectNewComments();
    }

	@Override
	public List<Map<Integer, Integer>> getTotalCount(List<Integer> articleNoList) {
		return commentDao.selectTotalCount(articleNoList);
	}

	
	
	
	
	
	


}
