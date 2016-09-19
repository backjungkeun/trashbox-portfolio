package com.trashbox.dao;

import java.util.List;
import java.util.Map;

import com.trashbox.vo.Article;

public interface ArticleDao {

	List<Article> selectList(Map<String, Object> paramMap);
	
	List<Article> selectPrevAndNextList(Map<String, Object> paramMap);
	
	Article selectArticle(int no);

	int selectTotalCount(int boardNo);
	int selectSearchTotalCount(Map<String, Object> paramMap);
	
	int insert(Article article);
	int update(Article article);
	int delete(int no);
	

	
	int updateRecommendCount(int no);
	
	int selectTotalRecommendCount(int no);
	
	int updateHitCount(int articleNo);

	List<Article> selectList2(Map<String, Object> paramMap);
	
	List<Article> selectSearchList(Map<String, Object> paramMap);
}
