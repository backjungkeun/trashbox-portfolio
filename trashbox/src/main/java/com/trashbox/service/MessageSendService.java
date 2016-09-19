package com.trashbox.service;

public interface MessageSendService {
	
	public void sendToUserMessage(
			String senderNickname, String receiverId,  String destination, String message); 
	
	public void sendMessage(String destination, String message);
	
	public void sendArticleMessage(int articleNo, String articleEventType, Object message);
	
	
}
