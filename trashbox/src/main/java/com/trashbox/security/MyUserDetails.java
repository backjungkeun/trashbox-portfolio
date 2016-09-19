package com.trashbox.security;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

public class MyUserDetails implements UserDetails {
	private static final long serialVersionUID = 1L;

	private int     no;
	private String  id;
	private String  password;
	private String  nickname;
	private String  email;
	private String 	registrationDate;
	private String 	lastLoginDate; 
	private String  profileImage;
	private boolean enabled;
	private boolean accountNonExpired;
	private boolean accountNonLocked;
	private boolean credentialsNonExpired;
	private Collection<? extends GrantedAuthority> authorities;

	
	public MyUserDetails(int no, String id, String password, String nickname, String email,
			Date registrationDate, Date lastLoginDate, String profileImage, boolean enabled,
			boolean unlocked, Collection<? extends GrantedAuthority> authorities) {

		this.no = no;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
		this.registrationDate = formatDate(registrationDate);
		this.lastLoginDate = formatDate(lastLoginDate);
		this.profileImage = profileImage;
		this.enabled = enabled;
		this.accountNonExpired = true;
		this.accountNonLocked = unlocked;
		this.credentialsNonExpired = true;
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
	}

	
	@Override
	public String toString() {
		return "MyUserDetails [no=" + no + ", id=" + id + ", password=" + "[Protected]" + ", nickname=" + nickname
				+ ", email=" + email + ", registrationDate=" + registrationDate + ", lastLoginDate=" + lastLoginDate
				+ ", profileImage=" + profileImage + ", enabled=" + enabled + ", accountNonExpired=" + accountNonExpired
				+ ", accountNonLocked=" + accountNonLocked + ", credentialsNonExpired=" + credentialsNonExpired
				+ ", authorities=" + authorities + "]";
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}
	
	public int getNo() {
		return no;
	}

	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}
	
	public String getRegistrationDate() {
		return registrationDate;
	}

	public String getLastLoginDate() {
		return lastLoginDate;
	}
	
	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}



	private String formatDate(Date date) {
		
		SimpleDateFormat dateFomat = new SimpleDateFormat("yyyy-MM-dd (E) HH:mm:ss");
		//DateFormat dateFomat = DateFormat.getDateInstance(DateFormat.LONG);
		return dateFomat.format(date);
	}
	
	
	// Copy org.springframework.security.core.userdetails.User 

	

	private static SortedSet<GrantedAuthority> sortAuthorities(Collection<? extends GrantedAuthority> authorities) {
		Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
		
		SortedSet<GrantedAuthority> sortedAuthorities = new TreeSet<GrantedAuthority>(new AuthorityComparator());

		for (GrantedAuthority grantedAuthority : authorities) {
			Assert.notNull(grantedAuthority, "GrantedAuthority list cannot contain any null elements");
			sortedAuthorities.add(grantedAuthority);
		}

		return sortedAuthorities;
	}

	private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable {
		private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

		public int compare(GrantedAuthority g1, GrantedAuthority g2) {
			
			if (g2.getAuthority() == null) {
				return -1;
			}

			if (g1.getAuthority() == null) {
				return 1;
			}

			return g1.getAuthority().compareTo(g2.getAuthority());
		}
	}
}
