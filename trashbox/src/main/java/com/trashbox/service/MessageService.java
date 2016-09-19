package com.trashbox.service;

import java.util.List;

import com.trashbox.vo.Message;

public interface MessageService {
	public int send(String senderNickname, String receiverId, Message message);
	
	public List<Message> getMessageList(String query, int userNo);
	
	public int setMessageChecked(int messageNo);
	
	public int setMessageSaved(int messageNo);
	
	public int removeMessages(int userNo, List<Integer> messageNoList);
}
