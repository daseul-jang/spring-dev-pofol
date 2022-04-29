package com.jds.web.member.domain;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class MemberDTO {
	
	@NotBlank
	@Pattern(regexp = "^[a-z]{2}[a-z0-9_\\-]{4,20}$")
	private String m_id;			// 아이디
	
	@NotBlank
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*])[A-Za-z\\d~!@#$%^&*]{8,20}$")
	private String m_pw;			// 패스워드
	
	@NotBlank
	@Pattern(regexp = "^[가-힣]{3,7}$")
	private String m_name;			// 이름
	
	@NotBlank
	@Pattern(regexp = "^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\\s]{2,20}$")
	private String m_nick;			// 닉네임
	
	@NotBlank
	@Pattern(regexp = "^(([a-zA-Z\\d][-_]?){3,20})@([a-zA-z\\d.]{3,20})\\.([a-z]{2,3})$")
	private String m_email;			// 이메일
	
	private String m_profile;		// 프로필 사진
	private String m_etc;			// 기타 소개말
	private String m_mailAuth;		// 이메일 인증 여부
	private String m_authKey;		// 이메일 인증 키
	private Timestamp m_regDate;	// 가입일
	private int m_status;			// 회원상태  1: 회원, 2: 탈퇴한 회원, 3: 임시정지, 4: 영구정지
	private int m_loginType;		// 로그인타입 1: 홈페이지 자체 회원, 2: 네이버 로그인 회원, 3: 구글 로그인 회원, 4: 페이스북 로그인 회원, 5: 트위터 로그인 회원
	private int m_loginFailCnt;		// 로그인 실패 횟수
	private String m_scrAuth;		// [스프링 시큐리티 기능] - 회원 role 저장할 곳 (관리자 or 일반회원)
	private boolean m_scrEnabled;	// [스프링 시큐리티 기능] - 0: 비활성화 상태, 1: 활성화 상태
	
	
	public MemberDTO() {}

	public MemberDTO(@NotBlank @Pattern(regexp = "^[a-z]{2}[a-z0-9_\\-]{4,20}$") String m_id,
			@NotBlank @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*])[A-Za-z\\d~!@#$%^&*]{8,20}$") String m_pw,
			@NotBlank @Pattern(regexp = "^[가-힣]{3,7}$") String m_name,
			@NotBlank @Pattern(regexp = "^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\\s]{2,20}$") String m_nick,
			@NotBlank @Pattern(regexp = "^(([a-zA-Z\\d][-_]?){3,20})@([a-zA-z\\d.]{3,20})\\.([a-z]{2,3})$") String m_email,
			String m_profile, String m_etc, String m_mailAuth, String m_authKey, Timestamp m_regDate, int m_status,
			int m_loginType, int m_loginFailCnt, String m_scrAuth, boolean m_scrEnabled) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_nick = m_nick;
		this.m_email = m_email;
		this.m_profile = m_profile;
		this.m_etc = m_etc;
		this.m_mailAuth = m_mailAuth;
		this.m_authKey = m_authKey;
		this.m_regDate = m_regDate;
		this.m_status = m_status;
		this.m_loginType = m_loginType;
		this.m_loginFailCnt = m_loginFailCnt;
		this.m_scrAuth = m_scrAuth;
		this.m_scrEnabled = m_scrEnabled;
	}

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

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public String getM_etc() {
		return m_etc;
	}

	public void setM_etc(String m_etc) {
		this.m_etc = m_etc;
	}

	public String getM_mailAuth() {
		return m_mailAuth;
	}

	public void setM_mailAuth(String m_mailAuth) {
		this.m_mailAuth = m_mailAuth;
	}

	public String getM_authKey() {
		return m_authKey;
	}

	public void setM_authKey(String m_authKey) {
		this.m_authKey = m_authKey;
	}

	public Timestamp getM_regDate() {
		return m_regDate;
	}

	public void setM_regDate(Timestamp m_regDate) {
		this.m_regDate = m_regDate;
	}

	public int getM_status() {
		return m_status;
	}

	public void setM_status(int m_status) {
		this.m_status = m_status;
	}

	public int getM_loginType() {
		return m_loginType;
	}

	public void setM_loginType(int m_loginType) {
		this.m_loginType = m_loginType;
	}

	public int getM_loginFailCnt() {
		return m_loginFailCnt;
	}

	public void setM_loginFailCnt(int m_loginFailCnt) {
		this.m_loginFailCnt = m_loginFailCnt;
	}

	public String getM_scrAuth() {
		return m_scrAuth;
	}

	public void setM_scrAuth(String m_scrAuth) {
		this.m_scrAuth = m_scrAuth;
	}

	public boolean isM_scrEnabled() {
		return m_scrEnabled;
	}

	public void setM_scrEnabled(boolean m_scrEnabled) {
		this.m_scrEnabled = m_scrEnabled;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_nick=" + m_nick + ", m_email="
				+ m_email + ", m_profile=" + m_profile + ", m_etc=" + m_etc + ", m_mailAuth=" + m_mailAuth
				+ ", m_authKey=" + m_authKey + ", m_regDate=" + m_regDate + ", m_status=" + m_status + ", m_loginType="
				+ m_loginType + ", m_loginFailCnt=" + m_loginFailCnt + ", m_scrAuth=" + m_scrAuth + ", m_scrEnabled="
				+ m_scrEnabled + "]";
	}

}
