package com.trashbox.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.trashbox.service.MessageSendService;
 
@Service
public class MessageSendServiceImpl implements MessageSendService {
	private final static Logger LOG = LogManager.getLogger(MessageSendServiceImpl.class);
	
	@Autowired SimpMessagingTemplate template;
//	@Autowired JmsTemplate jmsTemplate;
	
	public final static String RECOMMEND = "recommend";
	
	public final static String DEST_NOTIFICATION = "/queue/notification";
	public final static String DEST_ARTICLE = "/topic/article/";
	public final static String DEST_PRIVATE_MESSAGE = "/queue/privateMessage";
	private Map<String, Object> payload;
	
	@Override
	public void sendToUserMessage(String senderNickname, String receiverId,  String destination, String message) {
		
		payload = new HashMap<String, Object>();
		payload.put("sender", senderNickname);
		payload.put("content", message);
		
		LOG.debug("senderNickname :: " + senderNickname);
		LOG.debug("receiverId :: " + receiverId);
		LOG.debug("destination :: " + destination);
		LOG.debug("message :: " + message);
		
		this.template.convertAndSendToUser(receiverId, destination, payload);
	}
	
	@Override
	public void sendMessage(String destination, String message) {
		this.template.convertAndSend(destination, message);
	}
	

	@Override
	public void sendArticleMessage(int articleNo, String articleEventType, Object message) {

		payload = new HashMap<String, Object>();
		payload.put("eventType", articleEventType);
		
		if(message != null) {
			payload.put("message", message);
		}
		
		
		this.template.convertAndSend(DEST_ARTICLE + articleNo , payload);
		
//		this.jmsTemplate.convertAndSend(DEST_ARTICLE + articleNo , payload);
		
		//Test
//		Queue queue = new ActiveMQQueue("ArticleEvent");
//		
//		this.jmsTemplate.convertAndSend(queue , payload);
	}
	
//	@JmsListener(destination="ArticleEvent")
//	public void sendToReceiveArticleMessage(MapMessage mapMessage) throws JMSException {
//
//		
//		LOG.debug(mapMessage.getString("articleNo"));
//		
////		this.template.convertAndSend(DEST_ARTICLE + articleNo , payload);
//		
//		
//	}
	

	

}
