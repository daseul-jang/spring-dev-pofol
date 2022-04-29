package com.jds.web.service;

import com.jds.web.member.domain.MemberDTO;
import com.jds.web.member.domain.MemberFindDTO;

public interface MemberService {

	// DB테스트용 현재시각 가져오는 메서드
	public String getTime();

	// 회원가입
	public int insertMember(MemberDTO memberDTO) throws Exception;

	// 단일 회원 정보 조회
	public MemberDTO selectMemberById(String id) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	// 닉네임 중복체크
	public int nickCheck(MemberDTO memberDTO) throws Exception;
	
	// 이메일 중복체크
	public int emailCheck(MemberDTO memberDTO) throws Exception;
	
	// 이메일 인증키 생성
	public void emailAuth(MemberDTO memberDTO) throws Exception;
	
	// 이메일 인증키 일치여부 select
	public MemberDTO selectAuthKeyCheck(MemberDTO memberDTO) throws Exception;
	
	// 이메일 인증 상태 변경
	public void authStatus(MemberDTO memberDTO) throws Exception;
	
	// 로그인 시 이메일 인증 여부 체크
	public String loginEmailAuthChk(String id) throws Exception;
	
	// 아이디 찾기
	public String selectFindId(MemberFindDTO memFindDTO) throws Exception;
	
	// 아이디 이메일 전송
	public void findIdEmailSend(String findId) throws Exception;
	
	// 비밀번호 이메일 전송
	public String findPwEmailSend(MemberFindDTO memFindDTO) throws Exception;
	
	// DB에 해당 이름이 존재하는지 count
	public int selectCntByName(String name) throws Exception;
	
	// DB에 해당 이메일이 존재하는지 count
	public int selectCntByEmail(String email) throws Exception;
	
	// DB에 해당 이름과 이메일이 일치하는 정보가 있는지 조회
	public int selectCntByNameEmail(MemberFindDTO memFindDTO) throws Exception;
	
	// DB에 해당 아이디, 이름, 이메일과 일치하는 정보가 있는지 조회
	public int selectCntByIdNameEmail(MemberFindDTO memFindDTO) throws Exception;
	
	// 마이페이지 비밀번호 확인
	public int mypagePwCheck(MemberDTO memberDTO) throws Exception;
}
