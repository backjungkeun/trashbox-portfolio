package com.trashbox.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

public class MyLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
	private final static Logger LOG = LogManager.getLogger(MyLogoutSuccessHandler.class);

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		LOG.debug("Logout Success");
		LOG.debug(request.getHeader("Referrer"));
		
		
		if (authentication != null) {
			// do something
		}
		
		setDefaultTargetUrl("/main");
		super.onLogoutSuccess(request, response, authentication);
	}
}
