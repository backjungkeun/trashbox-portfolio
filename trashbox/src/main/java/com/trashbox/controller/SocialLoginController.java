package com.trashbox.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class SocialLoginController {
	private static final Logger LOG = LogManager.getLogger(SocialLoginController.class);

	    private static final String CLIENT_ID = "RRbE72kPss0s9fTwzebJ";
	    private static final String CLIENT_SECRET = "obFIKkGLuZ";
	    private static final String CALLBACK_URL = "http://jungkeun-portfolio.tk/naver/loginCallback";
	
	    /* @네이버 로그인 요청
	     * clientID, callbackURL, csrfToken 값으로  
	     * 네이버 아이디로 로그인 인증 요청문 생성 및 요청 */
		@RequestMapping("/naverLogin")
		public String naverLogin(HttpServletRequest request, Model model) throws Exception {
			
			CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(request);
			
			LOG.debug(token.getToken());
			
			LOG.debug(CLIENT_ID);
			LOG.debug(CALLBACK_URL);
//			LOG.debug(token.getToken());
			
			model.addAttribute("module", "authorize");
			
			model.addAttribute("clientID", CLIENT_ID);
			model.addAttribute("callbackURL", URLEncoder.encode(CALLBACK_URL, "utf-8"));
//			model.addAttribute("token", token.getToken());
			
			return "user/naverLoginCall";
//			return "redirect:https://nid.naver.com/oauth2.0/authorize?client_id=" + clientID 
//					+"&response_type=code&redirect_uri=" + callbackURL 
//					+"&state=" + token.getToken();
		}
		
		/* @네이버 로그인 인증정보 콜백 
		 * state : 콜백으로 전달받은 상태 토큰
		 *  code : 콜백으로 전달받은 인증코드 접근토큰발급에 사용
		 * */
		@RequestMapping("/naver/loginCallback")
		public String loginCallback(@RequestParam("state") String token, String code , HttpServletRequest request) throws Exception {
			
			/* error : access_denied
			 * error_description : Canceled By User
			 * */
			
			CsrfToken storedToken  = new HttpSessionCsrfTokenRepository().loadToken(request);
			
			LOG.debug("storedToken" + storedToken);
			LOG.debug("token" + token);
			LOG.debug("code" + code);
			
			
			if( !token.equals( storedToken.getToken() ) ) {
//			    return RESPONSE_UNAUTHORIZED; //401 unauthorized
				LOG.debug("401 unauthorized");
				return "error/401";
			} else {
//			    Return RESPONSE_SUCCESS; //200 success
				LOG.debug("200 success");
				return "redirect:/naver/test?token=" + token 
						+ "&code=" + code;
			}
			
		}
		
		/* @네이버 접근토큰 요청*/
		@RequestMapping("/naver/getAccessToken")
		public String getAccessToken(String token, String code, Model model) throws Exception {
			
			model.addAttribute("module", "token");
			
			model.addAttribute("clientID", CLIENT_ID);
			model.addAttribute("clientSecret", CLIENT_SECRET);
            model.addAttribute("grant_type", "authorization_code");
            model.addAttribute("token", token);
            model.addAttribute("code", code);
		
			return "user/naverLoginCall";
		}
		
		@RequestMapping("/naver/test")
		public String naverTest(String token, String code, Model model) throws Exception {
			
			RestTemplate restTemplate = new RestTemplate();
			
			Map<String, String> urlVariables = new HashMap<String, String>();
			
			urlVariables.put("clientID", CLIENT_ID);
			urlVariables.put("clientSecret", CLIENT_SECRET);
			urlVariables.put("token", token);
			urlVariables.put("code", code);
			
			String url = "https://nid.naver.com/oauth2.0/token?"
	    	        + "client_id={clientID}" 
	    	        + "&client_secret={clientSecret}"
	    	        + "&grant_type=authorization_code"
	    	        + "&state={token}"
	    	        + "&code={code}";
			
			Map<String, Object> result = restTemplate.getForObject(url, HashMap.class, urlVariables);
			
			
			model.addAttribute("result", result);
			
			return "old/test/test2";
		}
}
