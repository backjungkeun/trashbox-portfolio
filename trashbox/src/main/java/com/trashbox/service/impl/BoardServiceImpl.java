package com.trashbox.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.trashbox.dao.ArticleDao;
import com.trashbox.dao.BoardTypeDao;
import com.trashbox.dao.RecommendLogDao;
import com.trashbox.service.BoardService;
import com.trashbox.service.MessageSendService;
import com.trashbox.vo.Article;
import com.trashbox.vo.BoardType;
import com.trashbox.vo.RecommendLog;

@Service
public class BoardServiceImpl implements BoardService {
//	private static final Logger LOG = LogManager.getLogger(BoardServiceImpl.class);

	@Autowired BoardTypeDao boardTypeDao;
	@Autowired ArticleDao articleDao;
	
	@Autowired RecommendLogDao recommendLogDao;
	@Autowired MessageSendService messageSendService;
	
	@Override
	public int getTotalCount(BoardType boardType) {
		return articleDao.selectTotalCount(boardType.getNo());
	}
	
	@Override
	public int getTotalCount(BoardType boardType, String searchTarget, String searchQuery) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", boardType.getNo());
		paramMap.put("searchTarget", searchTarget);
		paramMap.put("searchQuery", searchQuery);
		
		return articleDao.selectSearchTotalCount(paramMap);
	}
	
	@Override
	public BoardType getBoardType(String boardTypeName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardTypeName", boardTypeName);
		
		return boardTypeDao.selectBoardType(paramMap);
	}
	
	@Override
	public BoardType getBoardType(int boardNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", boardNo);
		
		return boardTypeDao.selectBoardType(paramMap);
	}
	
	@Override
    @PostAuthorize("returnObject.permissionNo == 1 ? hasRole('ADMIN') : hasRole('USER')")
	public BoardType getBoardTypeAndCheckAuth(int boardNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", boardNo);
		
		return boardTypeDao.selectBoardType(paramMap);
	}
	
	@Override
	public List<BoardType> getBoardTypeList() {
		return boardTypeDao.selectBoardTypeList();
	}
	
	@Override
	public List<Article> getArticleList(BoardType boardType, int page) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", boardType.getNo());
		paramMap.put("page", page);
		
		return articleDao.selectList(paramMap);
	}
	
	@Override
	public List<Article> getArticleList(BoardType boardType, int page, 
			int total, String searchTarget, String searchQuery) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", boardType.getNo());
		paramMap.put("page", page);
		paramMap.put("total", total);
		paramMap.put("searchTarget", searchTarget);
		paramMap.put("searchQuery", searchQuery);
		
		
		return articleDao.selectSearchList(paramMap);
	}
	
	@Override
	public List<Article> getArticleList(BoardType boardType) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		switch(boardType.getName()) { 
		
		  case "popularArticles":
			  paramMap.put("limit", 15);
			  paramMap.put("order", "hit");
			  break;
			    
		  case "newArticles":
			  paramMap.put("limit", 15);
			  paramMap.put("order", "no");
			  break;
			  
		  case "newComments":
			  
		  default : 
			  paramMap.put("boardNo", boardType.getNo());
			  paramMap.put("limit", 5);
			  paramMap.put("order", "no");
			  
		}
			
		
//		notice : content,
// 		event  : content,
// 		mostPopularArtices : content,
// 		newArtices : content,
// 		newComments : content
		return articleDao.selectList2(paramMap);
	}
	
	@Override
	public List<Article> getPrevAndNextArticleList(BoardType boardType, int no) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", boardType.getNo());
		paramMap.put("no", no);
		
		return articleDao.selectPrevAndNextList(paramMap);
	}
	
	@Override
	public Article getArticle(int no) {
		return articleDao.selectArticle(no);
	}
	
	@Override
	@PostAuthorize("hasAnyRole('ADMIN', 'USER') and returnObject.userNo == principal.no") 
	public Article getArticleAndCheckAuth(int no) {
		return articleDao.selectArticle(no); 
	}
	
	
	/* 추천 */
	@Override
	@PreAuthorize("hasRole('USER') and #userNo == principal.no")
	public Map<String, Object> updateRecommendCount(int userNo, int articleNo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		RecommendLog recommendLog = new RecommendLog();
		recommendLog.setUserNo(userNo);
		recommendLog.setArticleNo(articleNo);
		
		boolean checked = recommendLogDao.checkRecommend(recommendLog);
		
		if(checked) {
			resultMap.put("result", 2);
	
			
		} else {
			insertRecommendLog(recommendLog);
			articleDao.updateRecommendCount(articleNo);
			messageSendService.sendArticleMessage(articleNo, "recommend", getTotalRecommendCount(articleNo));
			resultMap.put("result", 1);
		
		}
		
		return resultMap;
	}
	
	private int insertRecommendLog(RecommendLog recommendLog) {
		return recommendLogDao.insert(recommendLog);
	}
	
	
//	@Override
//	public int updateRecommendCount(int userNo, int articleNo) throws Exception {
//
//		/* 1 = 성공 
//		 * 2 = 이미 추천하였음
//		 * 3 = 에러 */
//		
//		try {
//			
//			boolean result = recommendLogDao.checkRecommend(new RecommendLog(userNo, articleNo));
//			
//			if(!result) {
//				recommendLogDao.insert(new RecommendLog(userNo, articleNo));
//				boardDao.updateRecommendCount(userNo, articleNo);
//				messageSendService.sendArticleMessage(articleNo, MessageSendService.RECOMMEND, getTotalRecommendNum(articleNo));
//
//				return 1;
//			
//			} else {
//				return 2;
//			}
//			
//			
//		} catch(Exception e) {
//			return 3;
//		}
//		
//	}
	
	
	private int getTotalRecommendCount(int no) {
		return articleDao.selectTotalRecommendCount(no);
	}
	
	

	@Override
	@PreAuthorize("hasAnyRole('ADNIN', 'USER') and #article.userNo == principal.no")
	public int add(Article article) {
		
		article.setHasImage(hasImage(article.getContent()));
		
		int count = articleDao.insert(article);
		return count;
	}

	@Override
	@PreAuthorize("hasAnyRole('ADNIN', 'USER') and #article.userNo == principal.no")
	public int edit(Article article) {
		article.setHasImage(hasImage(article.getContent()));
		int count = articleDao.update(article);
		return count;
	}

	@Override
	@PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and #article.userNo == principal.no)")
	public int remove(Article article) {
		int count = articleDao.delete(article.getNo());
		return count;
	}


	@Override
	public int updateHitCount(int no) {
		int count = articleDao.updateHitCount(no);
		return count;
	}
	
	
	private boolean hasImage(String content) {
		String imgTag = "<img src=";
		
		return content.contains(imgTag);
	}
	

}
