package com.trashbox.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired; //test
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.trashbox.security.MyUserDetails;
import com.trashbox.service.UserService;
import com.trashbox.vo.LoginUserInfo;

@Controller
public class UserController {
	private static final Logger LOG = LogManager.getLogger(UserController.class);

	@Autowired UserService userService;	
	@Autowired SessionRegistry sessionRegistry;
	
	
	/* @Login */
	@RequestMapping("/login")	
	public String login() throws Exception {
		return "user/login/로그인";
	}
	
//    // social login
//	@RequestMapping("/naverLogin")
//	public String naverLogin(Model model) throws Exception {
//		String clientID = "RRbE72kPss0s9fTwzebJ";
//		String callbackURL = URLEncoder.encode("http://jungkeun-portfolio.tk/main", "utf-8");
//		
//		LOG.debug(clientID);
//		LOG.debug(callbackURL);
////		LOG.debug(token.getToken());
//		
//		
//		model.addAttribute("clientID", clientID);
//		model.addAttribute("callbackURL", callbackURL);
////		model.addAttribute("token", token.getToken());
//		
//		return "user/naverLoginCall";
////		return "redirect:https://nid.naver.com/oauth2.0/authorize?client_id=" + clientID 
////				+"&response_type=code&redirect_uri=" + callbackURL 
////				+"&state=" + token.getToken();
//	}
	
	/* @SignUp */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUp() throws Exception {
		return "user/signup/회원가입";
	}

	/* @UserInfo */
	@RequestMapping("/userInfo")
	public String userInfo() {				
		return "user/userInfo/회원정보";
	}
	
	/* -ModifyUserInfo */
	@RequestMapping("/modifyUserInfo")
	public String modifyUserInfo() throws Exception {
		return "user/modifyUserInfo/회원정보 변경";
	}	
	
	@RequestMapping("/modifyUserPassword")
	public String modifyUserPassword() throws Exception {
		return "user/modifyUserPassword/비밀번호 변경";
	}
	
	@RequestMapping("/sessionInfo")
	public String userLoginInfo(HttpSession currentSession, Model model, Principal principal) throws Exception {
	
		SimpleDateFormat dateFomat = new SimpleDateFormat("yyyy-MM-dd (E) HH:mm:ss");
		
		String name = principal.getName();
		model.addAttribute("username", name);
		
		List<LoginUserInfo> userSessionData = new ArrayList<LoginUserInfo>();		
		List<Object> principals = sessionRegistry.getAllPrincipals();
			
		String remoteAddress = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes())
		           .getRequest().getLocalAddr();
				
		for (Object object : principals) {
			
			MyUserDetails user = (MyUserDetails) object;
			List<SessionInformation> sessions = sessionRegistry.getAllSessions(user, false);
		    
			String username = user.getUsername();
			
			for (SessionInformation session : sessions) {
				LoginUserInfo userInfo = new LoginUserInfo();
				Date lastRequest = session.getLastRequest();
				String sessionId = session.getSessionId();
				
				userInfo.setUsername(username);
				userInfo.setIp(remoteAddress);
				userInfo.setLastActivity(dateFomat.format(lastRequest.getTime()));
				userInfo.setSessionId(sessionId);
				
				if(name.equals(userInfo.getUsername())) {
					
					if(currentSession.getId().equals(sessionId)){
						model.addAttribute("currentSession", userInfo);	
					} else {
						userSessionData.add(userInfo);	
					}		
				
				}	
			}
		}
		model.addAttribute("userSessionData", userSessionData);
		
		return "user/sessionInfo/로그인 관리";	
	}
	
	
	@RequestMapping("/logoutSession")
	public String logoutSession(String sessionId) {
		  SessionInformation session = sessionRegistry.getSessionInformation(sessionId);
		  if (session != null) {
		    session.expireNow();
		  }
		  
		 return "redirect:/sessionInfo";
	}
	
	@RequestMapping("/session-expired")
	public String expiredUrl() {
		return "user/sessionExpired";
	}
	
	@RequestMapping("/leave")
	public String leave() {
		return "user/leave/탈퇴";
	}
	
	@RequestMapping("/resendAuthMail")
	public String resendAuthMail(HttpSession session, Model model) throws Exception {
		
		synchronized(session) {
			String id = (String)session.getAttribute("LAST_LOGIN_ATTEMPT_USER");
			
			if(id != null) {
				
				model.addAttribute("email", userService.getEmail(id));
				model.addAttribute("errorUser", id);
				
				session.removeAttribute("LAST_LOGIN_ATTEMPT_USER");
			}
		}
	
		return "user/resendAuthMail/이메일 재발송";
	}

	@RequestMapping("/mailVerify")
	public String mailVerify(@RequestParam(required=false) boolean isPasswordReset, String key, Model model) throws Exception {		
		
		/* 1. 유효하지 않은 요청입니다.
		 * 2. 만료된 키입니다. 다시 발급 받아주세요.
		 * 3. 이미 인증이 완료 되었습니다.
		 * 4. 유효하지 않은 요청입니다. 메일 인증을 다시 시도 해주세요.
		 * 5. 인증에 성공하였습니다.
		 * 6. 인증에 실패하였습니다. */
		
		Map<String, Object> result = userService.verifyMail(key);
	
		String id = (String)result.get("id");
		int verifyResult = (Integer)result.get("verifyResult");
		
		model.addAttribute("verifyResult", verifyResult);

		if(isPasswordReset == true && (verifyResult == 3 || verifyResult == 5)) {
			
			model.addAttribute("newPassword", key.substring(35, 45));
			userService.changePassword(id, key.substring(35, 45));

		} 
		
		return "user/verifyMail";	
	
	}


	// test
	@RequestMapping("/user/usertest/mm")
	public String userpage(HttpServletRequest request) throws Exception {
		
		LOG.debug(request.getServletPath().split("/")[1]);
		LOG.debug(request.getPathInfo());
		
		return "user/usertest";
		
		
	}

	// test
	@RequestMapping("/admin") 
	public String adminpage() throws Exception {
		return "user/Admin";
	}
	
	
	//test 파일삭제
//	@ResponseBody
//	public String boardFileDelete() {
//
//        String path = "C:\Users\Public\Pictures\Sample Pictures\abc.jpg"​ // 삭제할 파일의 경로
//
//        File file = new File(path);
//
//        if(file.exists() == true){
//        	file.delete();
//        	
//        }
//        
//        return null;

//} 
	
	@RequestMapping("/messageBox")
	public String messageBox() throws Exception {
		return "user/messageBox/Message Box";
	}

	@RequestMapping("/findUserAccount")
	public String findUserAccount() throws Exception {
		return "user/findUserAccount/아이디 &#47; 비번찾기";
	}


}
