package com.trashbox.controller.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.trashbox.exception.AuthenticationException;
import com.trashbox.security.MyUserDetails;
import com.trashbox.service.BoardService;
import com.trashbox.vo.Article;
import com.trashbox.vo.BoardType;

@Controller
@RequestMapping("/board")
public class AjaxBoardController {
	private static final Logger LOG = LogManager.getLogger(AjaxBoardController.class);
	@Autowired BoardService boardService;

	
	@RequestMapping("/ajax/test") 
	@ResponseBody 
	public Map<String, Object> testing() {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		Gson gson = new Gson();
		
		jsonResult.put("test", true);
		
		gson.toJson(jsonResult);
		
		return jsonResult;
	}
	
	/* RECOMMEND */
	@RequestMapping("/ajax/updateRecommendCount")
	@ResponseBody
	public Map<String, Object> updateRecommendCount(@RequestParam("articleNo") String articleNo) {
		
		Map<String, Object> resultMap = null;
		Gson gson = new Gson();
		/* 0 = 로그인 에러 */
		
		try {
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			MyUserDetails user = authentication == null ? null : (MyUserDetails)authentication.getPrincipal();
			
			if(user == null) {
				throw new AuthenticationException("Authentication Not Found");
			}
			
			resultMap = boardService.updateRecommendCount(user.getNo(), Integer.parseInt(articleNo));
		
			
		} catch (Exception e) {
			LOG.debug(e);
			
			resultMap = new HashMap<String, Object>();
			resultMap.put("result", 0);
			resultMap.put("exception", e.getMessage());

		}
		
		gson.toJson(resultMap);
		return resultMap;
		
	
	}
	

	/* Main */
	@RequestMapping(value="/{boardTypeName}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE, headers="X-AJAX-CALL=true")
	@ResponseBody
	public Map<String, Object> list(@PathVariable String boardTypeName) {
		
		
		BoardType boardType = null;
		boardType = boardService.getBoardType(boardTypeName);
		
		if(boardType == null) {
			boardType = new BoardType();
			boardType.setNo(0);
			boardType.setName(boardTypeName);
		}
		 
		List<Article> boardList = boardService.getArticleList(boardType);
		
		
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		Gson gson = new Gson();
		
		 
		
		gson.toJson(boardList);  
		
		
		jsonResult.put("boardTypeName", boardTypeName);
		jsonResult.put("content", boardList);
		
		return jsonResult;
	}
}
