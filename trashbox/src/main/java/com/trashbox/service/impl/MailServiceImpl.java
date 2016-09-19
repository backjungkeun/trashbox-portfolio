package com.trashbox.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.trashbox.service.MailService;
import com.trashbox.vo.User;

@Service
public class MailServiceImpl implements MailService {
	@Autowired 
	JavaMailSender mailSender;
	@Autowired
	VelocityEngine velocityEngine;
	
	private final static String LOCATION = "http://jungkeun-portfolio.tk";
	private final static String TEST_LOCATION = "http://localhost/trashbox";
	
	private final static String DEFAULT_VERIFY_LOCATION = "/mailVerify";
	private final static String PASSWORD_RESET_VERIFY_LOCATION = "/mailVerify?isPasswordReset=true";
	
	
	public boolean sendAuthMail(User user, String key) {
		boolean result = false;
		
		try {
			
			String location = LOCATION + DEFAULT_VERIFY_LOCATION;
			
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage message) throws Exception {
	                MimeMessageHelper helper = new MimeMessageHelper(message);
	                helper.setTo(user.getEmail());
	                helper.setSubject("Trashbox 인증메일");
//	                helper.setFrom("webmaster@csonth.gov.uk"); // could be parameterized...
	                Map<String, Object> model = new HashMap<String, Object>();
	                model.put("user", user);
	                model.put("key", key);
	                
	                model.put("home", LOCATION);
	                model.put("action", location);
	               
	                String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, 
	                		"com/trashbox/vm/welcome.vm", "UTF-8", model);
	                
	                helper.setText(text, true);
	            }
			};
			
			this.mailSender.send(preparator);
	
			
			result = true;
			
		} catch (MailSendException ex) {
			result = false;
			
		}	
		return result;
	}
	
	public boolean sendPasswordResetMail(String id, String email, String key) {
		boolean result = false;
		
		try {
			
			String location = LOCATION + PASSWORD_RESET_VERIFY_LOCATION;
			
			
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage message) throws Exception {
	                MimeMessageHelper helper = new MimeMessageHelper(message);
	                helper.setTo(email);
	                helper.setSubject("Trashbox 비밀번호 재설정");
//	                helper.setFrom("webmaster@csonth.gov.uk"); // could be parameterized...
	                Map<String, Object> model = new HashMap<String, Object>();
	                model.put("id", id);
	                model.put("email", email);
	                model.put("key", key);
	                
	                model.put("home", LOCATION);
	                model.put("action", location);
	               
	                String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, 
	                		"com/trashbox/vm/password_reset.vm", "UTF-8", model);
	                
	                helper.setText(text, true);
	            }
			};
			
			this.mailSender.send(preparator);
			
			result = true;
			
			
		} catch (MailSendException ex) {
			result = false;
			
		}	
		return result;
	}
	
	
//	public boolean sendAuthMail(User user, String key) {
//		boolean result = false;
//		
//		try {
//			
//			String location = TEST_LOCATION + DEFAULT_VERIFY_LOCATION;
//			
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message);
//			
//			helper.setTo(user.getEmail());
//			helper.setSubject("Trashbox 인증메일");
//			helper.setText("<html>"
//					+ "<body>"
//					+ "가입한 계정 정보는 아래와 같습니다.<br>"
//					+ "<hr noshade=''>"
//					+ "<ul>"
//					+ " <li>Trashbox (<a href='" + TEST_LOCATION + "' target='_blank'>trashbox</a>) </li> "
//					+ " <li>아이디 : " + user.getId() + "</li>"
//					+ " <li>이메일 주소 : " + user.getEmail() + "</li>"
//					+ " <li>인증하기 (<a href='" + location + key + "' target='_blank'>인증하기</a>) </li>"
//					+ "</ul>"
//					+ "<hr noshade=''>"
//					+ "<br>"
//					+ "</body>"
//					+ "</html>", true);
//			
//
//			mailSender.send(message);
//			
//			result = true;
//			
//		} catch (MailSendException | MessagingException ex) {
//			result = false;
//			
//		}	
//		return result;
//	}
	
	
//	public boolean sendPasswordResetMail(String id, String email, String key) {
//		boolean result = false;
//		
//		try {
//			
//			String location = TEST_LOCATION + PASSWORD_RESET_VERIFY_LOCATION;
//			
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message);
//			
//			helper.setTo(email);
//			helper.setSubject("Trashbox 비밀번호 재설정");
//			helper.setText("<html>"
//					+ "<body>"
//					+ "비밀번호 재설정 확인 메일<br>"
//					+ "<hr noshade=''>"
//					+ "<ul>"
//					+ " <li>Trashbox (<a href='" + TEST_LOCATION + "' target='_blank'>trashbox</a>) </li> "
//					+ " <li>아이디 : " + id + "</li>"
//					+ " <li>이메일 주소 : " + email + "</li>"
//					+ " <li>비밀번호 재설정 (<a href='" + location + key + "' target='_blank'>비밀번호 재설정하기</a>) </li>"
//					+ "</ul>"
//					+ "<hr noshade=''>"
//					+ "<br>"
//					+ "</body>"
//					+ "</html>", true);
//			
//
//			mailSender.send(message);
//			
//			result = true;
//			
//		} catch (MailSendException | MessagingException ex) {
//			result = false;
//			
//		}	
//		return result;
//	}
	

	

}



