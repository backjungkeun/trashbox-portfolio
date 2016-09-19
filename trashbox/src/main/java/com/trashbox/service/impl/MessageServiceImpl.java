package com.trashbox.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.trashbox.dao.MessageDao;
import com.trashbox.service.MessageSendService;
import com.trashbox.service.MessageService;
import com.trashbox.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired MessageDao messageDao;
	@Autowired MessageSendService messageSendService;
	
	
	@Override
	public int send(String senderNickname, String receiverId, Message message) {

		
		int count = messageDao.send(message);
		
		if(count == 1) {
			
			messageSendService.sendToUserMessage(senderNickname, receiverId, MessageSendServiceImpl.DEST_PRIVATE_MESSAGE, message.getContent());
		}
		return count;
	}
	
	@PreAuthorize("hasRole('USER') and #userNo == principal.no")
	@Override
	public List<Message> getMessageList(String query, int userNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("query", query);
		paramMap.put("no", userNo);
		
		return messageDao.selectMessageList(paramMap);
	}
	
	@Override
	public int setMessageChecked(int messageNo) {
		return messageDao.setMessageChecked(messageNo);
	}
	
	@Override
	public int setMessageSaved(int messageNo) {
		return messageDao.setMessageSaved(messageNo);
	}
	
	@Override
	public int removeMessages(int userNo, List<Integer> messageNoList) {
		
		List<Message> messageList =  messageDao.selectMessages(messageNoList);
		Map<String, Object> paramMap = null;
		int count = 0;
		
		for(int i=0; i< messageList.size(); i++) {
			
			if(messageList.get(i).getReceiverNo() == messageList.get(i).getSenderNo()) {
				count = messageDao.deleteMessage(messageList.get(i).getNo());
			
			} else if(messageList.get(i).getReceiverNo() == userNo) {
				
				if(messageList.get(i).isRemoveSender()){
					count = messageDao.deleteMessage(messageList.get(i).getNo());
				
				} else {
					paramMap = new HashMap<String, Object>();
					paramMap.put("query", "receive");
					paramMap.put("no", messageList.get(i).getNo());
					
					count = messageDao.updateDeleteFlag(paramMap);
				}
				
			} else if(messageList.get(i).getSenderNo() == userNo) {
				
				if(messageList.get(i).isRemoveReceiver()){
					count = messageDao.deleteMessage(messageList.get(i).getNo());
				
				} else {
					paramMap = new HashMap<String, Object>();
					paramMap.put("query", "send");
					paramMap.put("no", messageList.get(i).getNo());
					
					count = messageDao.updateDeleteFlag(paramMap);
				}
				
			}
	
		}
		
		
		return count;
	}

	

}
