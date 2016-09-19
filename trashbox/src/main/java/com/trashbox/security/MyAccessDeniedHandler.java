package com.trashbox.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.csrf.MissingCsrfTokenException;


public class MyAccessDeniedHandler extends AccessDeniedHandlerImpl {
	private static final Logger LOG = LogManager.getLogger(MyAccessDeniedHandler.class);
	
	private RedirectStrategy redirectStrategy;
	
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException)
			throws IOException, ServletException {
	
		String ajaxHeader = request.getHeader("X-AJAX-CALL");
		
		if(ajaxHeader != null) {
			
			if(accessDeniedException.getClass().equals(MissingCsrfTokenException.class)) {
				response.getWriter().println("MissingCsrfToken");
				response.getWriter().flush();
				response.getWriter().close();
				
			} else {
				response.getWriter().println("AccessDenied");
				response.getWriter().flush();
				response.getWriter().close();
			}
			
			
			
		} else {
			
			if(request.getServletPath().split("/")[1].equals("login")) {
				
				redirectStrategy = new DefaultRedirectStrategy();	
				redirectStrategy.sendRedirect(request, response, "/main");
				
			} else {
				setErrorPage("/accessDenied");
				super.handle(request, response, accessDeniedException);
			}
			
			//request.getServletPath()
		
			LOG.debug(request.getServletPath().split("/")[1]);
			
			LOG.debug(accessDeniedException);
//	
//		request.setAttribute("errorMSG", request.getServletPath());
			
		}
		
	}

}
