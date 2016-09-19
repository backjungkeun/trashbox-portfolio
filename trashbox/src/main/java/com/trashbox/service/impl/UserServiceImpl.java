package com.trashbox.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.trashbox.dao.RoleDao;
import com.trashbox.dao.UserDao;
import com.trashbox.security.MyKeyBasedPersistenceTokenService;
import com.trashbox.security.MyUserDetails;
import com.trashbox.service.MailService;
import com.trashbox.service.UserService;
import com.trashbox.vo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired UserDao userDao;
	@Autowired RoleDao roleDao;
	@Autowired MailService mailService;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	@Autowired MyKeyBasedPersistenceTokenService myTokenService;
	
	
	private static final Logger LOG = (Logger) LogManager.getLogger(UserServiceImpl.class);

	
	/* Check */
	
	@Override
	public int checkDuplicateId(String id) throws Exception {
		return userDao.checkDuplicateId(id);
	}
	
	@Override
	public int checkDuplicateNickname(String nickname) throws Exception {
		return userDao.checkDuplicateNickname(nickname);
	}
	
	@Override
	public int checkDuplicateEmail(String email) throws Exception {
		return userDao.checkDuplicateEmail(email);
	}
	
	/* Update , Change */
	
	@Override
	public void update(MyUserDetails user) throws Exception {
		userDao.updateLoginDate(user.getNo(), new Date());	
	}
	
	@Override
	public int updateNickname(String id, String nickname) throws Exception {
		return userDao.updateNickname(id, nickname);
	}
	
	@Override
	public int changePassword(String id, String password) throws Exception {
		return userDao.changePassword(id, passwordEncoder.encode(password));
	}
	
	@Override
	public int leave(MyUserDetails user) throws Exception {
		return userDao.updateEnabled(user.getNo());
	}
	
	@Override
	public int updateProfileImage(int no, String imageName) throws Exception {	
		return userDao.updateProfileImage(no, imageName);
	}
	

	/* Get */
	
	@Override
	public String getEmail(String id) throws Exception {
		return userDao.getEmail(id);
	}
	
	@Override
	public String getNickname(int no) throws Exception {
		return userDao.getNickname(no);
	}
	
	@Override
	public String getId(int no) throws Exception {
		return userDao.getId(no);
	}
	
	
	/* Register , AuthMail */
	
	@Override
	public boolean registerUserAccount(User user) throws Exception {

		boolean sendMail = false;
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		int addUserCount = userDao.addUser(user);
		roleDao.addDefaultRole(user.getNo());
		
		if(addUserCount > 0) {
		   sendMail = sendAuthMail(user);
		}	
		
		return sendMail;

	}
	
	@Override
	public boolean sendAuthMail(User user) throws Exception {
		String key = myTokenService.allocateToken(user.getId()).getKey();
		userDao.updateAuthKey(user.getId(), key);
		userDao.updateEmail(user.getId(), user.getEmail());
		userDao.updateUnlocked(user.getId(), 0);
		return mailService.sendAuthMail(user, key);
	}

	@Override
	public Map<String, Object> verifyMail(String key) throws Exception {
	
		Map<String, Object> result = new HashMap<String, Object>();
		
		String id;
		String savedKey;

		boolean tokenExpired;
		boolean unlocked;
		boolean sameKey;
		
		try {
			id = myTokenService.verifyToken(key).getExtendedInformation();
			savedKey = userDao.getAuthKey(id);
			
			tokenExpired = myTokenService.isTokenExpired(key);
			unlocked = userDao.getUnlocked(id);
			sameKey = myTokenService.isSameKey(key, savedKey);
			
			result.put("id", id);
			result.put("verifyResult", updateUnlocked(id, tokenExpired, unlocked, sameKey));
			
			return result;
			
		} catch (IllegalArgumentException ex) {
			
			result.put("verifyResult", 0);
			return result; 
		}
	
	}
	
	
	protected int updateUnlocked(String id, boolean tokenExpired, boolean unlocked, boolean sameKey) {
		/* 1. 유효하지 않은 요청입니다.
		 * 2. 만료된 키입니다. 다시 발급 받아주세요.
		 * 3. 이미 인증이 완료 되었습니다.
		 * 4. 유효하지 않은 요청입니다. 메일 인증을 다시 시도 해주세요.
		 * 5. 인증에 성공하였습니다.
		 * 6. 인증에 실패하였습니다. */
		
		int result = 0;
		
		if (tokenExpired == true && unlocked == true && sameKey == false) {
			result = 1;
		
		} else if (tokenExpired == false && unlocked == false && sameKey == true) {
			result = 2;
		
		} else if (tokenExpired == true && unlocked == true && sameKey == true) {
			result = 3; 
			
		} else if (tokenExpired == true && unlocked == false && sameKey == false) {
			result = 4;
			
		} else if (tokenExpired == true && unlocked == false && sameKey == true) {
	
			try {
				userDao.updateUnlocked(id, 1);
				result = 5;
			
			} catch (Exception e) {
				result = 6;
			}
		}
		

		LOG.debug("tokenExpired :: " + tokenExpired);
		LOG.debug("unlocked :: " + unlocked);
		LOG.debug("sameKey :: " + sameKey);

		LOG.debug("result :: " + result);
		
		
		return result;
	}
	
	public List<User> getUserDefaultInfo(List<Integer> userNoList) throws Exception {
		return userDao.getUserDefaultInfo(userNoList);
	}

	
	public String findIdByEmail(String email) throws Exception {
		String id = userDao.getIdByEmail(email);
		StringBuffer sb = new StringBuffer();
		sb.append(id.substring(0, id.length()/2));
		
		for(int i=0; i< id.length()-id.length()/2; i++) {
			sb.append("*");
		}
		
		
		return sb.toString();
		
	}
	
	public boolean checkUserByIdAndEmail(String id, String email) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("email", email);
		
		return userDao.checkUserByIdAndEmail(paramMap);
	}
	
	public boolean sendPasswordResetMail(String id, String email) throws Exception {
		
		String key = myTokenService.allocateToken(id).getKey();
		userDao.updateAuthKey(id, key);
		
		
		return mailService.sendPasswordResetMail(id, email, key);
		
	}
}
