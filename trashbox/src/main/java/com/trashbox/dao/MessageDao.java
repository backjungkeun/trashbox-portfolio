package com.trashbox.dao;

import java.util.List;
import java.util.Map;

import com.trashbox.vo.Message;

public interface MessageDao {
	int send(Message message);
	
	
	List<Message> selectMessageList(Map<String, Object> paramMap);
	
	int setMessageChecked(int messageNo);
	int setMessageSaved(int messageNo);
	
//	int deleteMessages(List<Integer> messageNoList);
	
	int deleteMessage(int messageNo);
	
	int updateDeleteFlag(Map<String, Object> paramMap);
	
	List<Message> selectMessages(List<Integer> messageNoList);

}
