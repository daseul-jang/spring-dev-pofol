package com.jds.web.service;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jds.web.mapper.MemberMapper;
import com.jds.web.member.domain.MemberDTO;
import com.jds.web.member.domain.MemberFindDTO;
import com.jds.web.util.MailUtils;
import com.jds.web.util.PasswordEncoding;
import com.jds.web.util.TempKey;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private JavaMailSender mailSender;

	private PasswordEncoding passwordEncoder = new PasswordEncoding();

	@Override
	public String getTime() {
		return memberMapper.getTime();
	}

	@Override
	public int insertMember(MemberDTO memberDTO) throws Exception {

		logger.info("Before Encoding : " + memberDTO.getM_pw());

		// DTO에서 비밀번호를 가져와 암호화
		String encodePw = passwordEncoder.encode(memberDTO.getM_pw());

		logger.info("After Encoding : " + encodePw);
		logger.info("Insert User Info : " + memberDTO);

		// DTO에 암호화 된 비밀번호 세팅
		memberDTO.setM_pw(encodePw);

		return memberMapper.insertMember(memberDTO);
	}

	@Override
	public MemberDTO selectMemberById(String id) throws Exception {
		return memberMapper.selectMemberById(id);
	}
	
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		return memberMapper.idCheck(memberDTO);
	}
	
	@Override
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		return memberMapper.nickCheck(memberDTO);
	}
	
	@Override
	public int emailCheck(MemberDTO memberDTO) throws Exception {
		return memberMapper.emailCheck(memberDTO);
	}

	@Override
	public void emailAuth(MemberDTO memberDTO) throws Exception {

		// 임의의 authKey 생성
		String authKey = new TempKey().getKey(20, false);

		memberDTO.setM_authKey(authKey);
		memberMapper.updateAuthKey(memberDTO);

		// mail 작성
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[DEV POFO] 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[DEV POFO] 회원가입을 위한 이메일 인증</h1>")
				.append("<a href='http://localhost:8099/join/emailConfirm?m_id=").append(memberDTO.getM_id())
				.append("&m_email=").append(memberDTO.getM_email()).append("&m_authKey=").append(authKey)
				.append("' target='_blenk'>여기를 눌러 인증을 완료하세요.</a>").toString());
		sendMail.setFrom("devzzang94@gmail.com", "DEVPOFO");
		sendMail.setTo(memberDTO.getM_email());
		sendMail.send();
	}

	@Override
	public MemberDTO selectAuthKeyCheck(MemberDTO memberDTO) throws Exception {
		return memberMapper.selectAuthKeyCheck(memberDTO);
	}

	@Override
	public void authStatus(MemberDTO memberDTO) throws Exception {
		memberMapper.updateAuthStatus(memberDTO);		
	}

	@Override
	public String loginEmailAuthChk(String id) throws Exception {
		return memberMapper.loginEmailAuthChk(id);
	}

	@Override
	public String selectFindId(MemberFindDTO memFindDTO) throws Exception {
		return memberMapper.selectFindId(memFindDTO);
	}

	@Override
	public void findIdEmailSend(String findId) throws Exception {
		String m_email = memberMapper.selectEmail(findId);
		
		// mail 작성
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[DEV POFO] 회원님의 아이디를 알려드립니다.");
		sendMail.setText(new StringBuffer().append("<h1>[DEV POFO] 아이디 찾기 결과</h1>")
				.append("<h3>회원님의 아이디는 ").append(findId)
				.append(" 입니다. </h3>").toString());
		sendMail.setFrom("devzzang94@gmail.com", "DEVPOFO");
		sendMail.setTo(m_email);
		sendMail.send();
	}

	@Override
	public String findPwEmailSend(MemberFindDTO memFindDTO) throws Exception {
		logger.info("findPwEmailSend().memFindDTO1: " + memFindDTO.toString());
		
		memFindDTO = memberMapper.selectFindPw(memFindDTO);
		
		logger.info("findPwEmailSend().memFindDTO2: " + memFindDTO.toString());

		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		for (int i = 0; i < 12; i++) {
			num = ran.nextInt(93) + 48;

			if ((num == 33 || num == 42 || num == 64 || num == 126 || (num >=35 && num <= 38)) ||
				(num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		}

		String encodePw = passwordEncoder.encode(sb);
		memFindDTO.setM_pw(encodePw);
		
		logger.info("findPwEmailSend().sb: " + sb);
		logger.info("findPwEmailSend().encodePw: " + encodePw);
		logger.info("findPwEmailSend().memberDTO.getM_pw(): " + memFindDTO.getM_pw());
		logger.info("findPwEmailSend().memberDTO.getM_email(): " + memFindDTO.getM_email());

		// mail 작성
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[DEV POFO] 회원님의 임시 비밀번호를 알려드립니다.");
		sendMail.setText(new StringBuffer().append("<h1>[DEV POFO] 임시 비밀번호</h1>").append("<h3>회원님의 임시 비밀번호는 ")
				.append(sb).append(" 입니다. </h3>").append("<p>로그인 후 비밀번호를 변경해 주세요.</p>").toString());
		sendMail.setFrom("devzzang94@gmail.com", "DEVPOFO");
		sendMail.setTo(memFindDTO.getM_email());
		sendMail.send();

		int cnt = memberMapper.updateMemberPw(memFindDTO);

		if (cnt == 1) {
			return "pwUpdateSuccess";
		} else {
			return "pwUpdateFail";
		}
	}

	@Override
	public int selectCntByName(String name) throws Exception {
		return memberMapper.selectCntByName(name);
	}

	@Override
	public int selectCntByEmail(String email) throws Exception {
		return memberMapper.selectCntByEmail(email);
	}

	@Override
	public int selectCntByNameEmail(MemberFindDTO memFindDTO) throws Exception {
		return memberMapper.selectCntByNameEmail(memFindDTO);
	}

	@Override
	public int selectCntByIdNameEmail(MemberFindDTO memFindDTO) throws Exception {
		return memberMapper.selectCntByIdNameEmail(memFindDTO);
	}

	@Override
	public int mypagePwCheck(MemberDTO memberDTO) throws Exception {
		
		if(passwordEncoder.matches(memberDTO.getM_pw(), memberMapper.selectPwById(memberDTO))) {
			return 1;
		}
		
		return 0;
	}
}