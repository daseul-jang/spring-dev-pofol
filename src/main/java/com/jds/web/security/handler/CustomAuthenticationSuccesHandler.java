package com.jds.web.security.handler;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.jds.web.security.dao.CustomUserDAO;
import com.jds.web.security.dto.CustomUserDetails;

public class CustomAuthenticationSuccesHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccesHandler.class);

	@Inject
	private SqlSession sqlSession;
	
	private String m_id;
	private String defaultUrl;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		CustomUserDetails customUserDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getDetails();

		request.getSession().setAttribute("m_id", customUserDetails.getM_id());
		request.getSession().setAttribute("m_name", customUserDetails.getM_name());
		request.getSession().setAttribute("m_nick", customUserDetails.getM_nick());
		request.getSession().setAttribute("m_profile", customUserDetails.getM_profile());
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		CustomUserDAO customUserDao = sqlSession.getMapper(CustomUserDAO.class);
		
		String id = request.getParameter(this.m_id);
		/* customUserDao.updateMemberFailureCount_Init(id); */
		
		if(savedRequest != null) {
			String tempUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, tempUrl);
		} else {
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}

	}

}