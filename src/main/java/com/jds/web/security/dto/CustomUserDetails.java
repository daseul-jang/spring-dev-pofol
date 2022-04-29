package com.jds.web.security.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_nick;
	private String m_profile;
	private int m_loginType;
	private String m_scrRole;
	private boolean m_scrEnabled;
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public int getM_loginType() {
		return m_loginType;
	}

	public void setM_loginType(int m_loginType) {
		this.m_loginType = m_loginType;
	}

	public String getM_scrRole() {
		return m_scrRole;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(this.m_scrRole));
		return roles;
	}

	@Override
	public String getPassword() {
		return this.m_pw;
	}

	@Override
	public String getUsername() {
		return this.m_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return this.m_scrEnabled;
	}

	@Override
	public String toString() {
		return "CustomUserDetails [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_nick=" + m_nick
				+ ", m_profile=" + m_profile + ", m_loginType=" + m_loginType + ", m_scrRole=" + m_scrRole
				+ ", m_scrEnabled=" + m_scrEnabled + "]";
	}

}
