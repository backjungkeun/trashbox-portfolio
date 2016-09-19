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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.trashbox.security.MyUserDetails;
import com.trashbox.service.MessageService;
import com.trashbox.service.UserService;
import com.trashbox.vo.Message;

@Controller
public class AjaxMessageController {
	private static final Logger LOG = LogManager.getLogger(AjaxMessageController.class);
	@Autowired MessageService messageService;
	@Autowired UserService userService;
	
	private Map<String, Object> jsonResult ;
	
	@RequestMapping("/sendMessage")
	@ResponseBody
	public int sendMessage(Message message) throws Exception {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUserDetails user = authentication == null ? null : (MyUserDetails)authentication.getPrincipal();
	
		int result = 0;
		
		if(user != null) {
			message.setSenderNo(user.getNo());
			
			String senderNickname = user.getNickname();
			String receiverId = userService.getId(message.getReceiverNo());
			
			if(senderNickname != null && receiverId != null) {
				result = messageService.send(senderNickname, receiverId, message);
				
			}
		
		}
		
		LOG.debug(message);
		
		return result;
		
	}
	
	@RequestMapping(value="/message/{query}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE, headers="X-AJAX-CALL=true")
	@ResponseBody
	public Map<String, Object> message(@PathVariable String query) throws Exception {
		
		jsonResult = new HashMap<String, Object>();
		
		MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		jsonResult.put("query", query);
		jsonResult.put("result", messageService.getMessageList(query, user.getNo()));
		
		Gson gson = new Gson();
		
		gson.toJson(jsonResult);
		
		return jsonResult;
		
	}
	
	@RequestMapping(value= "/checkMessage", headers="X-AJAX-CALL=true")
	@ResponseBody
	public Map<String, Object> checkMessage(@RequestParam("messageNo") int messageNo) throws Exception {
		jsonResult = new HashMap<String, Object>();
		
		int count = messageService.setMessageChecked(messageNo);
		
		if(count > 0) {
			jsonResult.put("result", true);
			
		} else {
			jsonResult.put("result", false);
		}
		
        Gson gson = new Gson();
		gson.toJson(jsonResult);
		
		return jsonResult;
	}
	
	@RequestMapping(value= "/saveMessage", headers="X-AJAX-CALL=true")
	@ResponseBody
	public Map<String, Object> saveMessage(@RequestParam("messageNo") int messageNo) throws Exception {
		jsonResult = new HashMap<String, Object>();
		
		int count = messageService.setMessageSaved(messageNo);
		
		if(count > 0) {
			jsonResult.put("result", true);
			
		} else {
			jsonResult.put("result", false);
		}
		
        Gson gson = new Gson();
		gson.toJson(jsonResult);
		
		return jsonResult;
	}
	
	
	@RequestMapping("/removeMessages")
	@ResponseBody
	public Map<String, Object> removeMessages(@RequestParam (value="messageNoList[]")List<Integer> messageNoList) throws Exception {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUserDetails user = authentication == null ? null : (MyUserDetails)authentication.getPrincipal();
	
		jsonResult = new HashMap<String, Object>();
		jsonResult.put("result", false);
		
		if(user != null) {
			
			int count = messageService.removeMessages(user.getNo(), messageNoList);
		
			if(count > 0) {
				jsonResult.put("result", true);
				jsonResult.put("removeMessagesNo", messageNoList);
				
			} 
	
		} 
		
		
		Gson gson = new Gson();
		gson.toJson(jsonResult);
		
		return jsonResult;
	}
	
}
		 

		
		
	

	
	/* @Service
	 * public class MessageService { 
	 *   
	 *     @Autowired MessageDao messageDao;
	 *     
	 *     public void send(Message message) {
	 *     
	 *     @@@ [int senderNo, int receiverNo, String message]
	 *        
	 *         messageDao.send(message);
	 *     
	 *     
	 *     }
	 * 
	 * 
	 * 
	 * 
	 * }
	 * 
	 * 
	 * @@@ VO
	 * 
	 * public class Message {
	 *   
	 *   private int no;
	 *   private int senderNo;
	 *   private int receiverNo;
	 *   private String content;
	 *   private Date registrationDate;
	 *   private boolean checked;
	 * 
	 * 
	 * 
	 * }
	 * 
	 * 
	 * */
	

//}
