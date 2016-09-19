package com.trashbox.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.trashbox.logger.MyLogLevel;

public class MyLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	private static final Logger LOG = LogManager.getLogger(MyLoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
			
		
//		// 인증 세션을 가져와 새로운 쿠키 생성
//		Cookie k = new Cookie("JSESSIONID", request.getSession().getId());
//		k.setPath(request.getContextPath());
//		response.addCookie(k);
		
		
		
		LOG.log(MyLogLevel.START,"====================================================");
		
		setDefaultTargetUrl("/main");			
		

		HttpSession session = request.getSession();
		if(session != null) {
			
//			Cookie cookie = new Cookie("JSESSIONID", session.getId());
//			cookie.setPath(request.getContextPath());
//			response.addCookie(cookie);
//			
//			LOG.debug(request.getSession());
//			LOG.debug(request.getSession().getId());
//			LOG.debug(request.getContextPath());
			
			
			String currPage = (String)session.getAttribute("currPage");
			String prevPage = (String)session.getAttribute("prevPage");
		
			if(currPage != null) {
				getRedirectStrategy().sendRedirect(request, response, currPage);
				
			} else if (prevPage != null) {
						   		  
			   if(prevPage.contains("login")
					   || prevPage.contains("signup")
					   || prevPage.contains("mailVerify")
					   || prevPage.contains("resendAuthMail")
					   || prevPage.contains("findUserAccount"))   {
				   
				   super.onAuthenticationSuccess(request, response, authentication);
				   
			   } else  {
				   getRedirectStrategy().sendRedirect(request, response, prevPage);
			
			   }
		   
		   
		   } else {
			   super.onAuthenticationSuccess(request, response, authentication);
		   }
			
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}	
		
	}	
}
