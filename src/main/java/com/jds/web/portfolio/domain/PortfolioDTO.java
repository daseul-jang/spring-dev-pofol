package com.jds.web.portfolio.domain;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

public class PortfolioDTO {

	// 포트폴리오 테이블 부분 ========================================
	private int p_no;				// 포폴 코드 (pk)
	private String m_id;			// 회원 아이디 (회원pk)
	private String p_title; 		// 포폴 제목
	private String p_content;		// 포폴 내용
	private String p_startDate; 	// 개발 시작일
	private String p_endDate;		// 개발 종료일
	private String p_devSetting;	// 개발 환경
	private String p_stack; 		// 기술 스택
	private String p_thumbnail;		// 썸네일
	private String p_video;			// 시연 동영상
	private String p_link;			// 시연 페이지 또는 깃허브 링크
	private Timestamp p_regDate;	// 포폴 등록 날짜
	private Timestamp p_modDate;	// 포폴 수정 날짜
	private int p_recomm;			// 포폴 추천수
	private int p_viewCnt;			// 포폴 조회수
	private int p_status;			// 포폴 상태 (공개, 비공개 등..)
	
	// 회원 테이블 부분 =============================================
	// 해당 포트폴리오 작성자 정보
	private String m_name;
	private String m_nick;
	private String m_profile;
	private String m_email;
	
	// 파일 테이블 부분 =============================================
	private String[] files;
	private List<FileDTO> filesDTO;
	
	public PortfolioDTO() {}

	public PortfolioDTO(int p_no, String m_id, String p_title, String p_content, String p_startDate, String p_endDate,
			String p_devSetting, String p_stack, String p_thumbnail, String p_video, String p_link, Timestamp p_regDate,
			Timestamp p_modDate, int p_recomm, int p_viewCnt, int p_status, String m_name, String m_nick,
			String m_profile, String m_email, String[] files, List<FileDTO> filesDTO) {
		super();
		this.p_no = p_no;
		this.m_id = m_id;
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_startDate = p_startDate;
		this.p_endDate = p_endDate;
		this.p_devSetting = p_devSetting;
		this.p_stack = p_stack;
		this.p_thumbnail = p_thumbnail;
		this.p_video = p_video;
		this.p_link = p_link;
		this.p_regDate = p_regDate;
		this.p_modDate = p_modDate;
		this.p_recomm = p_recomm;
		this.p_viewCnt = p_viewCnt;
		this.p_status = p_status;
		this.m_name = m_name;
		this.m_nick = m_nick;
		this.m_profile = m_profile;
		this.m_email = m_email;
		this.files = files;
		this.filesDTO = filesDTO;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_startDate() {
		return p_startDate;
	}

	public void setP_startDate(String p_startDate) {
		this.p_startDate = p_startDate;
	}

	public String getP_endDate() {
		return p_endDate;
	}

	public void setP_endDate(String p_endDate) {
		this.p_endDate = p_endDate;
	}

	public String getP_devSetting() {
		return p_devSetting;
	}

	public void setP_devSetting(String p_devSetting) {
		this.p_devSetting = p_devSetting;
	}

	public String getP_stack() {
		return p_stack;
	}

	public void setP_stack(String p_stack) {
		this.p_stack = p_stack;
	}

	public String getP_thumbnail() {
		return p_thumbnail;
	}

	public void setP_thumbnail(String p_thumbnail) {
		this.p_thumbnail = p_thumbnail;
	}

	public String getP_video() {
		return p_video;
	}

	public void setP_video(String p_video) {
		this.p_video = p_video;
	}

	public String getP_link() {
		return p_link;
	}

	public void setP_link(String p_link) {
		this.p_link = p_link;
	}

	public Timestamp getP_regDate() {
		return p_regDate;
	}

	public void setP_regDate(Timestamp p_regDate) {
		this.p_regDate = p_regDate;
	}

	public Timestamp getP_modDate() {
		return p_modDate;
	}

	public void setP_modDate(Timestamp p_modDate) {
		this.p_modDate = p_modDate;
	}

	public int getP_recomm() {
		return p_recomm;
	}

	public void setP_recomm(int p_recomm) {
		this.p_recomm = p_recomm;
	}

	public int getP_viewCnt() {
		return p_viewCnt;
	}

	public void setP_viewCnt(int p_viewCnt) {
		this.p_viewCnt = p_viewCnt;
	}

	public int getP_status() {
		return p_status;
	}

	public void setP_status(int p_status) {
		this.p_status = p_status;
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

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public List<FileDTO> getFilesDTO() {
		return filesDTO;
	}

	public void setFilesDTO(List<FileDTO> filesDTO) {
		this.filesDTO = filesDTO;
	}

	@Override
	public String toString() {
		return "PortfolioDTO [p_no=" + p_no + ", m_id=" + m_id + ", p_title=" + p_title + ", p_content=" + p_content
				+ ", p_startDate=" + p_startDate + ", p_endDate=" + p_endDate + ", p_devSetting=" + p_devSetting
				+ ", p_stack=" + p_stack + ", p_thumbnail=" + p_thumbnail + ", p_video=" + p_video + ", p_link=" + p_link
				+ ", p_regDate=" + p_regDate + ", p_modDate=" + p_modDate + ", p_recomm=" + p_recomm + ", p_viewCnt="
				+ p_viewCnt + ", p_status=" + p_status + ", m_name=" + m_name + ", m_nick=" + m_nick + ", m_profile="
				+ m_profile + ", m_email=" + m_email + ", files=" + Arrays.toString(files) + ", filesDTO=" + filesDTO
				+ "]";
	}
	
}
