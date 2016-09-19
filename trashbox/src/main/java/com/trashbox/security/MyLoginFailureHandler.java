package com.trashbox.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class MyLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler  {
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
		setDefaultFailureUrl("/login");

		
		if (exception.getClass().equals(LockedException.class)) {
			getRedirectStrategy().sendRedirect(request, response, "/resendAuthMail");
			
		} else {
			
			HttpSession session = request.getSession();
			if(session != null) {
				String currPage = (String)session.getAttribute("currPage");
				
				if(currPage != null) {
					getRedirectStrategy().sendRedirect(request, response, currPage);
					
				
				} else {
				   super.onAuthenticationFailure(request, response, exception);
				   
				}
				
			} else {
				super.onAuthenticationFailure(request, response, exception);
			}	
			
			
		}
		
		
	}
	

 

}
