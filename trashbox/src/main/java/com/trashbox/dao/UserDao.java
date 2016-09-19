package com.trashbox.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.trashbox.vo.User;

public interface UserDao {
	
	int getUserNo(String id) throws Exception;
	User getUser(int no) throws Exception;
	
	int updateEnabled(int no) throws Exception;
	
	
	User findByUser(String id) throws Exception;
	
	int updateLoginDate(@Param("no") int no, @Param("date") Date date) throws Exception;
	
	int checkDuplicateId(String userId) throws Exception;
	int checkDuplicateNickname(String nickname) throws Exception;
	
	int checkDuplicateEmail(String userEmail) throws Exception;
	
	int updateNickname(@Param("id") String id, @Param("nickname")String nickname) throws Exception;
	int changePassword(@Param("id") String id, @Param("password")String password) throws Exception;

	String getEmail(String userId) throws Exception;
	
	
	int updateEmail(@Param("id") String id, @Param("email") String email) throws Exception;
	
	String getAuthKey(String id) throws Exception;
	int updateAuthKey(@Param("id") String id, @Param("authKey") String authKey) throws Exception;
	
	int updateUnlocked(@Param("id") String id, @Param("value") int value) throws Exception;
	boolean getUnlocked(String id) throws Exception;
	
	int updateProfileImage(@Param("no") int no, @Param("imageName") String imageName) throws Exception;
	
	
	int addUser(User user) throws Exception;
	
	String getNickname(int no) throws Exception;
	String getId(int no) throws Exception;
	
	String getIdByEmail(String email) throws Exception;
	
	List<User> getUserDefaultInfo(List<Integer> userNoList) throws Exception;
	
	
	boolean checkUserByIdAndEmail(Map<String, Object> paramMap);

}
