package com.trashbox.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.trashbox.dao.RoleDao;
import com.trashbox.dao.UserDao;
import com.trashbox.vo.Role;
import com.trashbox.vo.User;

@Service
public class MyUserDetailsService implements UserDetailsService {
	protected final MessageSourceAccessor messages = SpringSecurityMessageSource.getAccessor();
	
	@Autowired UserDao userDao;
	@Autowired RoleDao roleDao;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
	
		User user = null;
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		try {
			int userNo = userDao.getUserNo(id);
			
			if(userNo > 0) {
				user = userDao.getUser(userNo);
				authorities = buildUserAuthorities(roleDao.getRoles(userNo));
			}
		
		} catch (Exception e) {
			throw new UsernameNotFoundException(messages.getMessage(
					"user notFound", new Object[] { id },
					"User {0} notFound"));
		}
	
		return buildUserForAuthentication(user, authorities);
			
	}

	private MyUserDetails buildUserForAuthentication(User user, List<GrantedAuthority> authorities) {

		MyUserDetails userDetails = new MyUserDetails(user.getNo(), user.getId(), user.getPassword(), 
				user.getNickname(), user.getEmail(), user.getRegistrationDate(), user.getLastLoginDate(),
				user.getProfileImage(), user.isEnabled(), user.isUnlocked(), authorities);

		return userDetails;
	}
	
	private List<GrantedAuthority> buildUserAuthorities(List<Role> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(Role role : roles) {
			authorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		
		return authorities;
	}

}
