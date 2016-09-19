package com.trashbox.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;

import com.trashbox.vo.Article;
import com.trashbox.vo.BoardType;

public interface BoardService {
	
	/* boardType */
	BoardType getBoardType(String boardTypeName);
	BoardType getBoardType(int boardNo);
	List<BoardType> getBoardTypeList();

	BoardType getBoardTypeAndCheckAuth(int boardNo);
	
	int getTotalCount(BoardType boardType);
	int getTotalCount(BoardType boardType, String searchTarget, String searchQuery);

	/* Article */
	List<Article> getArticleList(BoardType boardType, int page);
	List<Article> getPrevAndNextArticleList(BoardType boardType, int no);
	
	//search
	List<Article> getArticleList(BoardType boardType, int page, int total, String searchTarget, String searchQuery);
	
	//main
	List<Article> getArticleList(BoardType boardType);
	
	Article getArticle(int no);
	Article getArticleAndCheckAuth(int no);
	
	int add(Article article);
	int edit(Article article);
	int remove(Article article); 
	
	
	public Map<String, Object> updateRecommendCount(int userNo, int articleNo);
	
	int updateHitCount(int no);
}
