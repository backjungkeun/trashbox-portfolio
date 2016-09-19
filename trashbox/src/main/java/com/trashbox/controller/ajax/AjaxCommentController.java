package com.trashbox.controller.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.trashbox.controller.support.PaginationUtil;
import com.trashbox.service.CommentService;
import com.trashbox.vo.Comment;
import com.trashbox.vo.PaginationInfo;

@Controller
@RequestMapping("/comment")
public class AjaxCommentController {
	private static final Logger LOG = LogManager.getLogger(AjaxCommentController.class);
	@Autowired CommentService commentService;


	private Map<String, Object> jsonResult;
	
	@RequestMapping(value="/list", method= RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> list(@RequestParam(value="articleNo") int articleNo , int pageNum) throws Exception {
	
		try {
			
			jsonResult = new HashMap<String, Object>();
			
			int total = commentService.getTotalCount(articleNo);
			PaginationInfo paginationInfo = PaginationUtil.buildPaginationInfo(pageNum, total, PaginationUtil.COMMENT_LIMIT);
			
			List<Comment> comments = commentService.list(articleNo, paginationInfo.getPage());
			
			Gson gson = new Gson();
			
			gson.toJson(paginationInfo);
			gson.toJson(comments);
			
			jsonResult.put("result", true);
			jsonResult.put("paginationInfo", paginationInfo);
			jsonResult.put("comments", comments);
			
		} catch (Exception e) {
			
			jsonResult.put("result", false);
		}
		
		
		return jsonResult;
	
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Comment comment) throws Exception {
		
		try {
			jsonResult = new HashMap<String, Object>();
			
			int count = commentService.add(comment);
			
			if(count < 1) {
				throw new Exception("add failed");
			}
			
			int total = commentService.getTotalCount(comment.getArticleNo());
			PaginationInfo paginationInfo = PaginationUtil.buildPaginationInfo(1, total, PaginationUtil.COMMENT_LIMIT);
			
			List<Comment> comments = commentService.list(comment.getArticleNo(), paginationInfo.getPage());
			
			Gson gson = new Gson();
			
			gson.toJson(paginationInfo);
			gson.toJson(comments);
			
			jsonResult.put("result", true);
			jsonResult.put("paginationInfo", paginationInfo);
			jsonResult.put("comments", comments);
			
		} catch (Exception e) {
			jsonResult.put("result", false);
			jsonResult.put("cause", e.getMessage());
			
		}
		
		return jsonResult;
		
	}
	
//	@RequestMapping("/add")
//	@ResponseBody
//	public Map<String, Object> add(Comment comment, String userNo) throws Exception {
//		
//		comment.setUserNo(Integer.parseInt(userNo));
//		int count = commentService.add(comment);
//		
//		Map<String, Object> listAndPaginationInfo = null;
//		
//		if(count != 0) {
//			listAndPaginationInfo = getListAndPaginationInfo(comment.getArticleNo(), 1);
//			
//		} else {
//			listAndPaginationInfo = new HashMap<String, Object>();
//			listAndPaginationInfo.put("result", false);
//		}
//		
//		return listAndPaginationInfo;
//	}
	
	
//	@RequestMapping("/add")
//	@ResponseBody
//	public Object addComment(Comment comment, String userNo) throws Exception {
//		// article_no , user_no , content
//		
//		comment.setUserNo(Integer.parseInt(userNo));
//		LOG.debug(comment);
//		
//		int count = commentService.add(comment);
//		
//		int startPage = 0;
//		int endPage = 0;
//		int page = 0;
//		
//		int pageNum = 1;
//		
//		
//		try {
//			
//			//  전체 게시물 갯수 뽑아옴 
//			int totalCommentNum = commentService.getTotalCommentNum(comment.getArticleNo());
//			
//			LOG.debug("totalCommentNum ::: " +  totalCommentNum);
//			
//			
//			//totalPageNum 변수는 전체 페이지의 수
//			int totalPageNum = totalCommentNum / 10 + 1; 
//			LOG.debug("totalPageNum ::: " +  totalPageNum);
//			
//		    // 게시물이 딱 15개일 경우 다음페이지가 생기지 않게 -1 해줌
//			if(totalCommentNum % 10 == 0){ 
//				totalPageNum--;
//				
//			}
//			
//			if((pageNum - 2) <= 1) {
//				
//				startPage = 1;
//				
//				if((pageNum + 2) >= totalPageNum) {
//					endPage = totalPageNum;
//				} else {
//					endPage = (pageNum + 4);
//				}
//				
//				
//			} else {
//				startPage = (pageNum - 2);
//			
//			    if((pageNum + 2) >= totalPageNum) {
//			       startPage = (totalPageNum - 4);
//			       endPage = totalPageNum;
//		        } else {
//			       endPage = (pageNum + 2);
//		        }
//			}
//			
//			if(pageNum != -1) {
//			
//				if(!(pageNum == 1)) {
//					// 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴
//					
//					int temp = (pageNum - 1) * 10;
//					
//					page = temp;
//					
//				} else if (pageNum == 1) {
//					
//					// 페이지 번호가 1이면 처음부터 15개
//					page = 0;	
//				}
//				
//			}
//			
//			if(endPage > totalPageNum) {
//			// 예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
//				endPage = totalPageNum; 
//				
//			}
//
//			
//			
//			//게시물 번호와 해당 페이지에서 뽑아올 댓글 시작번호를 파라미터로 데이터를 뽑아옴
//			List<Comment> comments = commentService.list(comment.getArticleNo(), page);
//			Map<String, Object> jsonResultMap = new HashMap<String, Object>();
//			
//			Map<String, Object> paginationInfo = new HashMap<String, Object>();
//			paginationInfo.put("totalCommentNum", totalCommentNum);
//			paginationInfo.put("currentPage", pageNum);
//			paginationInfo.put("totalPageNum", totalPageNum);
//			paginationInfo.put("start", startPage);
//			paginationInfo.put("end", endPage);
//			
//			Gson gson = new Gson();
//			
//			gson.toJson(comments);
//			gson.toJson(paginationInfo);
//			
//			jsonResultMap.put("comments", comments);
//			jsonResultMap.put("paginationInfo", paginationInfo);
//			jsonResultMap.put("result", count);
//
//			
//			return jsonResultMap;
//			
//		} catch(Exception e) {
//			
//			// 이상한 페이지 번호 들어오면 해당 게시판 처음으로 리다이렉트
////			return "redirect:/board/" + boardName + "/1";  
//			return false;
//		}
		
		
//	}
	
//	@MessageMapping("/getTotalCommentNum")
////	@SendTo("/topic/totalCommentNum")
//	@SendToUser("/queue/totalCommentNum")
//	public Object getTotalCommentNum(String jsonValue) throws Exception {
//		LOG.debug(jsonValue);
//		
//		
//		
//		return jsonValue ; //commentService.getTotalCommentNum(articleNo);
//	}
	
	/* Main */
	@RequestMapping(value="/newComments", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> list() {
		
		jsonResult = new HashMap<String, Object>();
		
		List<Comment> comments = commentService.list();
		
		Gson gson = new Gson();
		gson.toJson(comments);  
		
		
		jsonResult.put("boardTypeName", "newComments");
		jsonResult.put("content", comments);
		
		return jsonResult;
	}
	
	@RequestMapping("/getTotalCountByArticle")
	@ResponseBody
	public Map<String, Object> getCommentCount(@RequestParam (value="articleNoList[]")List<Integer> articleNoList) {
		jsonResult = new HashMap<String, Object>();
		
//		List<Integer> commentCountList = new ArrayList<Integer>();
		List<Map<Integer, Integer>> totalCountResultMapList = commentService.getTotalCount(articleNoList);
		
		Map<Integer, Object> finalResultMap = new HashMap<Integer, Object>();
		
		for(int i=0; i< totalCountResultMapList.size(); i++) {
			finalResultMap.put(
					totalCountResultMapList.get(i).get("key"), 
					totalCountResultMapList.get(i).get("value"));
			
		}
		
	
//		
//		for(int i=0; i < commentCountResultMap.size(); i++) {
//			int key = commentCountResultMap.get(i).get("key");
//			int value = commentCountResultMap.get(i).get("value");
//			
//			finalCommentCountResultMap.put(key, value);
//		}
		
		LOG.debug(finalResultMap);
		
//		for(int i=0; i < articleNoList.size(); i++) {
//			commentCountList.add(i, commentService.getTotalCount(articleNoList.get(i)));
//		}
		
		
		
//		int total = commentService.getTotalCount(articleNo);

		Gson gson = new Gson();
		gson.toJson(finalResultMap);  
//		
		jsonResult.put("commentCount", finalResultMap);
//		
		return jsonResult;
	}
	
	
	
	@RequestMapping("/remove")
	@ResponseBody
	public Map<String, Object> remove(Comment comment) throws Exception {
		
		try {
			jsonResult = new HashMap<String, Object>();
			
			int count = commentService.remove(comment);
			
			if(count < 1) {
				throw new Exception("remove failed");
			}
			
			int total = commentService.getTotalCount(comment.getArticleNo());
			PaginationInfo paginationInfo = PaginationUtil.buildPaginationInfo(1, total, PaginationUtil.COMMENT_LIMIT);
			
			List<Comment> comments = commentService.list(comment.getArticleNo(), paginationInfo.getPage());
			
			Gson gson = new Gson();
			
			gson.toJson(paginationInfo);
			gson.toJson(comments);
			
			jsonResult.put("result", true);
			jsonResult.put("paginationInfo", paginationInfo);
			jsonResult.put("comments", comments);
			
		} catch (Exception e) {
			jsonResult.put("result", false);
			jsonResult.put("cause", e.getMessage());
			
		}
		
		return jsonResult;
		
	}	

	

}
