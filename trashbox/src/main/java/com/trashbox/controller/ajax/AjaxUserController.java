package com.trashbox.controller.ajax;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired; //test
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.trashbox.security.MyUserDetails;
import com.trashbox.service.UserService;
import com.trashbox.vo.Photo;
import com.trashbox.vo.User;

@Controller
public class AjaxUserController {
	private static final Logger LOG = LogManager.getLogger(AjaxUserController.class);

	@Autowired UserService userService;	
	@Autowired SessionRegistry sessionRegistry;
	
	
	@RequestMapping(value = "/registerUserAccount", method = RequestMethod.POST)
	@ResponseBody
	public boolean registerUserAccount(User user) throws Exception {
		return userService.registerUserAccount(user);
	}
	

	@RequestMapping(value = "/updateNickname", method = RequestMethod.POST)
	@ResponseBody
	public int updateNickname(@RequestParam String nickname) throws Exception {

		MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int count = userService.updateNickname(user.getUsername(), nickname);
		
		if(count == 1) {
			user.setNickname(nickname);
			Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}
		
		return count;
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public int changePassword(@RequestParam String password) throws Exception {

		MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int count = userService.changePassword(user.getUsername(), password);
		
		if(count == 1) {
			Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}
		
		return count;
	}
	
	// 프로필 사진 업로드
		@RequestMapping(value = "/uploadProfilePhoto" , method = RequestMethod.POST)
		@ResponseBody
		public Object photoUpload(HttpServletRequest request, Photo photo) {
			
			String userProfileInfo = photo.getUserProfileInfo();
//			LOG.debug("userProfileInfo : " + userProfileInfo);
			
			userProfileInfo = userProfileInfo.replaceAll("data:image/png;base64,", "");
			byte[] imgBytes = Base64Utils.decode(userProfileInfo.getBytes());
			    
			try {
				if(photo.getFiledata() != null && photo.getFiledata().getOriginalFilename() != null && !photo.getFiledata().getOriginalFilename().equals("")) {
					//파일이 존재하면
					String original_name = photo.getFiledata().getOriginalFilename();
					String ext = original_name.substring(original_name.lastIndexOf(".")+1);
					//파일 기본경로
					String defaultPath = request.getSession().getServletContext().getRealPath("/");
			        //파일 기본경로 _ 상세경로
			        String path = defaultPath + "resources" + File.separator + "photo_upload_profile" + File.separator;              
			        File file = new File(path);
			        System.out.println("path:"+path);
			        //디렉토리 존재하지 않을경우 디렉토리 생성
			        if(!file.exists()) {
			        	file.mkdirs();
			        }
			        //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
			        String realname = UUID.randomUUID().toString() + "." + ext;
			        
			        ///////////////// 서버에 파일쓰기 ///////////////// 
			        FileOutputStream fos = new FileOutputStream(new File(path + realname));
			        
			        fos.write(imgBytes);
			        fos.flush();
			        fos.close();
			        
			        MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			    	
			        int count = userService.updateProfileImage(user.getNo(), realname);
			        
			        if(count == 1) {
			        	user.setProfileImage(realname);
			        	Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
			    		SecurityContextHolder.getContext().setAuthentication(authentication);
			    		
			    		return true;
			    		
			        } else {
			        	return false;
			        	
			        }
			        
				} else {
					return false;
					
				}
				
			} catch (Exception e) {
				return false;
				
			}
			
		}
	

	@RequestMapping(value = "/leaveUser", method = RequestMethod.GET)
	@ResponseBody
	public int leaveUser() throws Exception {
	
		MyUserDetails user = (MyUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		int count = userService.leave(user);
		
		if(count != -1) {
			
			List<SessionInformation> sessions = sessionRegistry.getAllSessions(user, false);
			
			for (SessionInformation session : sessions) {
				session.expireNow();
				
			}	
		}
	
		return count;
	}
	

	
	@RequestMapping(value= "/sendAuthMail", method = RequestMethod.POST)
	@ResponseBody
	public boolean sendAuthMail(User user) throws Exception {
		return userService.sendAuthMail(user);
	}
	
	
	
    
	@RequestMapping(value="/getUserDefaultInfo", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserDefaultInfo(@RequestParam (value="userNoList[]")List<Integer> userNoList) throws Exception{
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
//		List<String> authorNicknameList = new ArrayList<String>();
//		
//		for(int i=0; i < userNoList.size(); i++) {
//			authorNicknameList.add(i, userService.getNickname(userNoList.get(i)));
//		}
		List<User> users = userService.getUserDefaultInfo(userNoList);
		
		Map<Integer, User> defaultInfoMap = new HashMap<Integer, User>();
		
		for(int i=0; i < users.size(); i++) {
			int key = users.get(i).getNo();
			User value = users.get(i);
			
			defaultInfoMap.put(key, value);
		}
		
//		int total = commentService.getTotalCount(articleNo);

		Gson gson = new Gson();
		gson.toJson(defaultInfoMap);  
		
		jsonResult.put("defaultInfoMap", defaultInfoMap);
		
		return jsonResult;
	}


	
	

	

	



	
	

	
	/* check method */

	@RequestMapping(value = "/checkDuplicateId", method = RequestMethod.GET)
	@ResponseBody
	public int checkDuplicateId(@RequestParam String id) throws Exception {
		return userService.checkDuplicateId(id);
	}
	
	@RequestMapping(value = "/checkDuplicateNickname", method = RequestMethod.GET)
	@ResponseBody
	public int checkDuplicateNickname(@RequestParam String nickname) throws Exception {
		return userService.checkDuplicateNickname(nickname);
	}

	@RequestMapping(value = "/checkDuplicateEmail")
	@ResponseBody
	public int checkDuplicateEmail(@RequestParam String email) throws Exception {
		return userService.checkDuplicateEmail(email);
	}
	
	

	
	@RequestMapping(value="checkUser", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE ) 
	@ResponseBody
	public Map<String, Object> checkUser() throws Exception {
		
		MyUserDetails user = null;
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		try {
			user = (MyUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
			jsonResult.put("user", user.getNo());
		
		} catch(ClassCastException e) {
			jsonResult.put("user", 0);
		}
		
		return jsonResult;
	}


	@RequestMapping("/findIdByEmail")
	@ResponseBody
	public Map<String, Object> findIdByEmail(@RequestParam String email) throws Exception {
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		int count = userService.checkDuplicateEmail(email);
		
		if(count > 0) {
			jsonResult.put("result", true);
			jsonResult.put("id", userService.findIdByEmail(email));
		
		} else {
			jsonResult.put("result", false);
		}
		
		return jsonResult;
	}
	
	@RequestMapping("/sendResetPasswordMail")
	@ResponseBody
	public Map<String, Object> resetPassword(@RequestParam String id, @RequestParam String email) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
        boolean result = userService.checkUserByIdAndEmail(id, email);
        jsonResult.put("result", result);
       
        if(result) {
        	userService.sendPasswordResetMail(id, email);
        } 
		
		return jsonResult;
	}
	
	@RequestMapping("/checkUserByIdAndEmail")
	@ResponseBody
	public Map<String, Object> checkUserByIdAndEmail(@RequestParam String id, @RequestParam String email) throws Exception {
	    Map<String, Object> jsonResult = new HashMap<String, Object>();
	    
	    jsonResult.put("result", userService.checkUserByIdAndEmail(id, email));
		
	    return jsonResult;
	}
	 
	

}
