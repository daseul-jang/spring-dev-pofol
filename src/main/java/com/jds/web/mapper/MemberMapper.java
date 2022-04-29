package com.jds.web.mapper;

import com.jds.web.member.domain.MemberDTO;
import com.jds.web.member.domain.MemberFindDTO;

public interface MemberMapper {
	
	// DB테스트용 현재시각 가져오는 메서드
	public String getTime();
	
	// 회원가입 (Member 테이블에 회원정보 insert)
	public int insertMember(MemberDTO memberDTO) throws Exception;
	
	// 단일 회원 정보 조회
	public MemberDTO selectMemberById(String id) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	// 닉네임 중복체크
	public int nickCheck(MemberDTO memberDTO) throws Exception;
	
	// 이메일 중복체크
	public int emailCheck(MemberDTO memberDTO) throws Exception;
	
	// 이메일 인증키 update
	public void updateAuthKey(MemberDTO memberDTO) throws Exception;
	
	// 이메일 인증키 일치여부 select
	public MemberDTO selectAuthKeyCheck(MemberDTO memberDTO) throws Exception;
	
	// 이메일 인증 상태 update
	public void updateAuthStatus(MemberDTO memberDTO) throws Exception;
	
	// 로그인시 이메일 인증이 됐는지 체크
	public String loginEmailAuthChk(String id) throws Exception;
	
	// 아이디 찾기
	public String selectFindId(MemberFindDTO memFindDTO) throws Exception;
	
	// 이메일 select
	public String selectEmail(String id) throws Exception;
	
	// 비밀번호 찾기를 위한 id select
	public MemberFindDTO selectFindPw(MemberFindDTO memFindDTO) throws Exception;
	
	// 임시 비밀번호로 update
	public int updateMemberPw(MemberFindDTO memFindDTO) throws Exception;
	
	// DB에 해당 이름이 존재하는지 count
	public int selectCntByName(String name) throws Exception;
	
	// DB에 해당 이메일이 존재하는지 count
	public int selectCntByEmail(String email) throws Exception;
	
	// DB에 해당 이름과 이메일이 일치하는 정보가 있는지 조회
	public int selectCntByNameEmail(MemberFindDTO memFindDTO) throws Exception;
	
	// DB에 해당 아이디, 이름, 이메일과 일치하는 정보가 있는지 조회
	public int selectCntByIdNameEmail(MemberFindDTO memFindDTO) throws Exception;
	
	// 마이페이지 비밀번호 확인
	public String selectPwById(MemberDTO memberDTO) throws Exception;
}
