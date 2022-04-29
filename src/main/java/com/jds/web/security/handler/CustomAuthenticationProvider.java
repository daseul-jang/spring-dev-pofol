package com.jds.web.security.handler;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jds.web.security.dto.CustomUserDetails;
import com.jds.web.security.service.CustomUserDetailService;
import com.jds.web.util.PasswordEncoding;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);
	
	@Inject
	private CustomUserDetailService service;
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {

		String id = (String)auth.getPrincipal();
		String pw = (String)auth.getCredentials();
		
		logger.info("param ID : " + id);
		logger.info("param PW : " + pw);

		CustomUserDetails user = null;
		
		user = (CustomUserDetails)service.loadUserByUsername(id);
		
		logger.info("userDetails : " + user.toString());
		
		PasswordEncoding encode = new PasswordEncoding();
		
		if(user.getM_loginType() == 1) { // 홈페이지 자체 회원이라면
			if(!encode.matches(pw, user.getPassword())) {
				throw new BadCredentialsException(id);
			}	
		} else if(user.getM_loginType() == 2 || user.getM_loginType() == 3 || user.getM_loginType() == 4) { // 소셜 회원이라면
			if(!pw.equals(user.getPassword())) {
				throw new BadCredentialsException(id);
			}
		}

		if(!user.isEnabled()) {
			throw new AuthenticationCredentialsNotFoundException(id);
		}
		
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
		token.setDetails(user);
		
		return token;
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}

}
