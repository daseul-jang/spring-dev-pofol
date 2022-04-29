package com.jds.web.security.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jds.web.security.dao.CustomUserDAO;
import com.jds.web.security.dto.CustomUserDetails;

@Service
public class CustomUserDetailService implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailService.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		logger.info("loadUserByUsername().id: " + id);
		
		CustomUserDAO customUserDao = sqlSession.getMapper(CustomUserDAO.class);
		CustomUserDetails customUserDetails = customUserDao.selectMemberById(id);
		
		logger.info("loadUserByUsername().dao: " + customUserDao);
		logger.info("loadUserByUsername().dto: " + customUserDetails);
		
		if (customUserDetails == null) {
			logger.info("loadUserByUsername().if.null");
			throw new InternalAuthenticationServiceException(id);
		} else {
			logger.info("loadUserByUsername().if.not null");
			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
			roles.add(new SimpleGrantedAuthority(customUserDetails.getM_scrRole()));
			logger.info("loadUserByUsername().customUserDetails : " + customUserDetails.toString());
			return customUserDetails;
		}
	}

}
