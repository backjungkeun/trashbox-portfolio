package com.trashbox.vo;

import java.io.Serializable;

public class LoginUserInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String  username;
	private String  ip;
	private String  lastActivity;
	private String  sessionId;
	private boolean currentSession;
	
	@Override
	public String toString() {
		return "LoginUserInfo [username=" + username + ", ip=" + ip + ", lastActivity=" + lastActivity + ", sessionId="
				+ sessionId + ", currentSession=" + currentSession + "]";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getLastActivity() {
		return lastActivity;
	}
	public void setLastActivity(String lastActivity) {
		this.lastActivity = lastActivity;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}	
	public boolean isCurrentSession() {
		return currentSession;
	}
	public void setCurrentSession(boolean currentSession) {
		this.currentSession = currentSession;
	}
	
	
	
	

}
