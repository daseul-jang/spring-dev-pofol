package com.jds.web.security.handler;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jds.web.security.dao.CustomUserDAO;
import com.jds.web.security.dto.ResponseDataCode;
import com.jds.web.security.dto.ResponseDataDTO;
import com.jds.web.security.dto.ResponseDataStatus;
import com.jds.web.security.service.CustomUserDetailService;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);
	
	@Inject
	private SqlSession sqlSession;

	private String m_id;
	private String m_pw;
	private String errormsgname;
	private String defaultFailUrl;
	
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

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailUrl() {
		return defaultFailUrl;
	}

	public void setDefaultFailUrl(String defaultFailUrl) {
		this.defaultFailUrl = defaultFailUrl;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		
		String id = request.getParameter(this.m_id);
		String pw = request.getParameter(this.m_pw);
		String errormsg = null;
		
		logger.info("onAuthenticationFailure().id: " + id);
		
		request.setAttribute(this.m_id, id);
		
		if(exception instanceof InternalAuthenticationServiceException) { // 아이디가 존재하지 않을 때
			
			errormsg = "아이디 또는 비밀번호를 다시 한번 확인해주세요.";
			
		} else if(exception instanceof BadCredentialsException) { // 비밀번호가 일치하지 않을 때
			
			//CustomUserDAO customUserDao = sqlSession.getMapper(CustomUserDAO.class);
			//customUserDao.updateMemberFailureCount(id); 
			
			//int count = customUserDao.selectMemberFailureCount(id); 
			
			//if(count == 5) {
				//customUserDao.updateMemberEnabled(id); 
			//	errormsg = "계정이 비활성화 처리되었습니다."; 
			//} else { 
			//	errormsg = "아이디 또는 비밀번호를 다시 한번 확인해주세요.<br>"
			//			+ "5회 실패 시 계정이 비활성화됩니다.(" + count +"/5)"; 
			//}
			errormsg = "아이디 또는 비밀번호를 다시 한번 확인해주세요.";
			logger.info("비번틀리면 : " + errormsg);
			 
		} else if(exception instanceof DisabledException) { // 계정이 비활성화 상태일 때
			
			errormsg = "비활성화되어 있는 계정입니다.";
			
		}
		
		request.setAttribute(errormsgname, errormsg);
		
		request.getRequestDispatcher(defaultFailUrl).forward(request, response);
	}

}

/*
 * <Exception 참고>
 * BadCredentialException - 비밀번호가 일치하지 않을 때 예외처리
 * InternalAuthenticationServiceException - 아이디가 존재하지 않을 때 예외처리
 * AuthenticationCredentialNotFoundException - 인증 요구가 거부되었을 때 예외처리
 * LockedException - 인증 거부 : 잠긴 계정
 * DisabledException - 인증 거부 : 계정 비활성화
 * AccountExpiredException - 인증 거부 : 계정 유효기간 만료
 * CredentialExpiredException - 인증 거부 : 비밀번호 유효기간 만료
 */
