package com.trashbox.controller.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserControllerInterceptor extends HandlerInterceptorAdapter {
	private static final Logger LOG = LogManager.getLogger(UserControllerInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		LOG.debug("UserControllerInterceptor " );
		
		HttpSession session = request.getSession();
		
		synchronized(session) {
			
			if(request.getRequestURI().contains("/login")) {
				session.setAttribute("prevPage", request.getHeader("Referer"));
			
			} else {
				session.setAttribute("currPage", request.getServletPath());
			}
			
			String errorUser = (String)session.getAttribute("LAST_LOGIN_ATTEMPT_USER");
			
			if(errorUser != null) {
				
				modelAndView.addObject("errorUser", errorUser);
				modelAndView.addObject("error", true);
				
				session.removeAttribute("LAST_LOGIN_ATTEMPT_USER");
			}
		}
		
	}

}
