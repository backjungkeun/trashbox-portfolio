package com.trashbox.service;

import java.util.List;
import java.util.Map;

import com.trashbox.security.MyUserDetails;
import com.trashbox.vo.User;

public interface UserService {

    /* Check */
	
	public int checkDuplicateId(String id) throws Exception;
	
	public int checkDuplicateNickname(String nickname) throws Exception;
	
	public int checkDuplicateEmail(String email) throws Exception;
	
	/* Update , Change */
	
	public void update(MyUserDetails user) throws Exception;
	
	public int updateNickname(String id, String nickname) throws Exception;
	
	public int changePassword(String id, String password) throws Exception;
	
	public int leave(MyUserDetails user) throws Exception;
	
	public int updateProfileImage(int no, String imageName) throws Exception;
	

	/* Get */
	
	public String getEmail(String id) throws Exception;
	
	public String getNickname(int no) throws Exception;
	
	public String getId(int no) throws Exception;
	

	
	/* Register , AuthMail */
	
	public boolean registerUserAccount(User user) throws Exception;
	
	public boolean sendAuthMail(User user) throws Exception;

	public Map<String, Object> verifyMail(String key) throws Exception;


	
//	protected int updateUnlocked(String id, boolean tokenExpired, boolean unlocked, boolean sameKey);

	
	
	// GET USER DEFAULT INFO LIST
	public List<User> getUserDefaultInfo(List<Integer> userNoList) throws Exception;
	
	
	public String findIdByEmail(String email) throws Exception;
	public boolean checkUserByIdAndEmail(String id, String email) throws Exception;
	public boolean sendPasswordResetMail(String id, String eamil) throws Exception;

}
