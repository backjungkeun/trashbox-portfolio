package com.trashbox.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.trashbox.service.UserService;

public class MyUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	private static final Logger LOG = LogManager.getLogger(MyUsernamePasswordAuthenticationFilter.class);
	private static final String LAST_LOGIN_ATTEMPT_USER = "LAST_LOGIN_ATTEMPT_USER";

	@Autowired UserService userService;

	
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {
	
		LOG.debug(authResult);
		
		
		if(SecurityContextHolder.getContext().getAuthentication() != null) {
			request.getSession().setAttribute("checkedPassword", true);			
			
			super.successfulAuthentication(request, response, chain, authResult);
		
		} else {
			
			try {
				userService.update((MyUserDetails) authResult.getPrincipal());
				super.successfulAuthentication(request, response, chain, authResult);
				
			} catch (Exception e) {
				unsuccessfulAuthentication(request, response, new BadCredentialsException("Update fail"));
			}
		}

		

	}

	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {

		LOG.debug(obtainUsername(request));
		
		
		request.getSession().setAttribute(LAST_LOGIN_ATTEMPT_USER, obtainUsername(request));
		
		if(SecurityContextHolder.getContext().getAuthentication() != null) { //?
			getFailureHandler().onAuthenticationFailure(request, response, failed);
		
		} else {
			super.unsuccessfulAuthentication(request, response, failed);
			
		}
		
	
	}

}
