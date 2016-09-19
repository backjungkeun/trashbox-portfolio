package com.trashbox.service;

import com.trashbox.vo.User;

public interface MailService {
	public boolean sendAuthMail(User user, String key);
	public boolean sendPasswordResetMail(String id, String email, String key);
}
