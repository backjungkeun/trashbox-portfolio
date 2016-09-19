package com.trashbox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.trashbox.vo.Comment;

public interface CommentDao {
	int add(Comment comment);
	List<Comment> list(@Param("articleNo") int articleNo, @Param("page") int page);
	int getTotalCommentNum(int articleNo);
	
	List<Comment> selectNewComments();
	
	List<Map<Integer, Integer>> selectTotalCount(List<Integer> articleNoList);
	
	int remove(Comment comment);
}
