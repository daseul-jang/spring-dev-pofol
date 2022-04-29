package com.jds.web.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jds.web.member.domain.MemberDTO;
import com.jds.web.member.domain.MemberFindDTO;
import com.jds.web.security.dto.CustomUserDetails;
import com.jds.web.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final String DIR_MEMBER = "member";
	private final String DIR_EMAIL_AUTH = "/email_auth";
	private final String DIR_FIND = "/find";
	private final String DIR_MYPAGE = "/mypage";

	@Autowired
	@Qualifier("MemberService")
	private MemberService service;

	// 회원가입 관련  =====================================================================
	// 회원가입 폼으로 이동하는 메소드
	@GetMapping("/join")
	public String joinView() {
		logger.info("JoinController.joinView()");

		logger.info(service.getTime());

		return DIR_MEMBER + "/join-view";
	}
	
	@PostMapping("/join/join-check")
	@ResponseBody
	public String join(@Valid MemberDTO memberDTO, BindingResult bindingResult) throws Exception {
		logger.info("join~ing~");

		service.insertMember(memberDTO); // 회원가입 메소드 (DB에 회원 정보 insert)

		logger.info("join().MemberDTO : " + service.selectMemberById(memberDTO.getM_id()));

		return "Success";
	}
	
	// 아이디 중복체크
	@PostMapping("/join/idChk")
	@ResponseBody
	public String idCheck(MemberDTO memberDTO) throws Exception {
		logger.info("idCheck().MemberDTO.m_id: " + memberDTO.getM_id());
		
		int result = service.idCheck(memberDTO);
		
		logger.info("idCheck().result: " + result);
		
		if(memberDTO.getM_id() != null) {
			if(result == 0) { // 중복된 아이디가 없으면
				return "Success";
			}
		}
		
		return "Fail";
	}
	
	// 닉네임 중복체크
	@PostMapping("/join/nickChk")
	@ResponseBody
	public String nickCheck(MemberDTO memberDTO) throws Exception {
		int result = service.nickCheck(memberDTO);
		
		if(memberDTO.getM_nick() != null) {
			if(result == 0) { // result가 0이면 (닉네임 검색 결과가 0건이면)
				return "Success";
			}
		}
		
		return "Fail";
	}
	
	@PostMapping("/join/emailChk")
	@ResponseBody
	public String emailChk(MemberDTO memberDTO) throws Exception {
		int result = service.emailCheck(memberDTO);
		
		if(memberDTO.getM_email() != null) {
			if(result == 0) { // result가 0이면 (이메일 검색 결과가 0건이면)
				return "Success";
			}
		}
		
		return "Fail";
	}
	
	@GetMapping("/join/reqEmailAuth")
	public String reqEmailAuth(MemberDTO memberDTO, Model model) throws Exception {
		logger.info("reqEmailAuth()");
		
		// view단으로 DTO 데이터 전달 (인증메일 재전송 시 이용)
		model.addAttribute("memberDTO", memberDTO);
		
		MemberDTO selectMember = service.selectMemberById(memberDTO.getM_id());
		
		logger.info("reqEmailAuth().memberDTO: " + memberDTO.toString());
		logger.info("reqEmailAuth().selectMember: " + selectMember.toString());
		
		if(selectMember != null) {
			service.emailAuth(selectMember); // 이메일 전송 메소드 (이메일 인증 링크 전송)
		}
		
		return DIR_MEMBER + DIR_EMAIL_AUTH + "/reqEmailAuth";	
	}
	
	@GetMapping("/join/emailConfirm")
	public String emailConfirm(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model) throws Exception {
		MemberDTO authKeyChk = service.selectAuthKeyCheck(memberDTO);
		
		logger.info("emailConfirm().memberDTO.param: " + memberDTO.toString());
		// logger.info("emailConfirm().authKeyChk.param: " + authKeyChk.toString());
		logger.info("emailConfirm().memberDTO: " + service.selectMemberById(memberDTO.getM_id()));
		
		if (authKeyChk.getM_id() != null) {
			service.authStatus(memberDTO);
			logger.info("emailConfirm().memberDTO2: " + service.selectMemberById(memberDTO.getM_id()));
			return DIR_MEMBER + DIR_EMAIL_AUTH + "/emailAuthSucc";
		} 
		
		//model.addAttribute("auth_check", memberDTO.getM_mailAuth());
		
		return DIR_MEMBER + DIR_EMAIL_AUTH + "/emailAuthFail";
	}

	// 로그인 관련 =====================================================================
	@RequestMapping("/login")
	public String loginView() {
		logger.info("login-page");
		return DIR_MEMBER + "/login-view";
	}
	
	// 이메일 인증 여부에 따라 로그인 후 보이는 페이지를 다르게 함.
	@RequestMapping("/login/authChk")
	public String loginAuthChk(Principal principal) throws Exception {
		logger.info("loginAuthChk().principal.getName() : " + principal.getName());
		
		String result = service.loginEmailAuthChk(principal.getName());
		
		logger.info("loginAuthChk().result: " + result);
		
		if(result.equals("N")) {
			return DIR_MEMBER + DIR_EMAIL_AUTH + "/loginEmailAuthReq";
		}
		
		return "redirect:/main";
	}
	
	@PostMapping("/login/sendAuthMail")
	@ResponseBody
	public String sendAuthMail(MemberDTO memberDTO) throws Exception {
		logger.info("sendAuthMail().request memberDTO : " + memberDTO.getM_id());

		MemberDTO selectMember = service.selectMemberById(memberDTO.getM_id());

		if (selectMember != null) {
			service.emailAuth(selectMember); // 이메일 전송 메소드 (이메일 인증 링크 전송)
			return "Success";
		}

		return "Fail";
	}

	// 아이디/비밀번호 찾기  =====================================================================
	// 아이디/비밀번호 찾기 화면으로 이동
	@GetMapping("/login/findUserInfo")
	public String findUserInfoView() {
		return DIR_MEMBER + DIR_FIND + "/findUserInfo-view";
	}
	
	// 아이디 찾기
	@GetMapping("/login/findId")
	public String findIdView(MemberFindDTO memFindDTO, Model model) throws Exception {
		logger.info("findIdView()");
		logger.info("findIdView().memFindDTO.getM_name: " + memFindDTO.getM_name());
		logger.info("findIdView().memFindDTO.getM_email: " + memFindDTO.getM_email());
		
		String errorMsg = "";
		
		try {
			// 아이디 찾기
			String findId = service.selectFindId(memFindDTO);

			// 아이디 끝 세자리 별표처리
			String subId = findId.substring(findId.length() - 3, findId.length());
			String findIdTrans = findId.replace(subId, "***");

			logger.info("findIdView().findId: " + findId);

			// view단으로 데이터 넘겨주기
			model.addAttribute("findID", findIdTrans); // 별표처리된 아이디
			model.addAttribute("fullID", findId); // 온전한 아이디
			model.addAttribute("memEmail", memFindDTO.getM_email()); // 이메일

		} catch (NullPointerException e) {
			logger.info("findIdView().널");
			logger.info("findIdView().NullPointerException: " + e.getMessage());
			
			int name = service.selectCntByName(memFindDTO.getM_name());
			int email = service.selectCntByEmail(memFindDTO.getM_email());
			int selectMember = service.selectCntByNameEmail(memFindDTO);

			if (e.getMessage() != null) {
				errorMsg = "입력이 올바르지 않습니다.";
			} else if (name == 0) {
				errorMsg = "존재하지 않는 이름 입니다.";
			} else if (email == 0) {
				errorMsg = "존재하지 않는 이메일 입니다.";
			} else if (selectMember == 0) {
				errorMsg = "입력하신 정보와 일치하는 아이디가 존재하지 않습니다.";
			}
			
			model.addAttribute("error", errorMsg);
		}

		return DIR_MEMBER + DIR_FIND + "/findId-result-view";
	}
	
	// 아이디 이메일로 전송
	@PostMapping("/login/findIdEmailSend")
	@ResponseBody
	public String findIdEmailSend(String findId) throws Exception {
		logger.info("findIdEmailSend().findId: " + findId);
		service.findIdEmailSend(findId);
		return "Success";
	}
	
	// 비밀번호 찾기
	@GetMapping("/login/findPw")
	public String findPwView(MemberFindDTO memFindDTO, Model model) throws Exception {
		
		String msg = "";
		String errorMsg = "";
		
		try {
			String result = service.findPwEmailSend(memFindDTO);
			
			if(result.equals("pwUpdateSuccess")) {
				msg = "임시 비밀번호가 발송되었습니다.";
				model.addAttribute("msg", msg);
			}
			
		} catch (NullPointerException e) {
			MemberDTO memberDTO = service.selectMemberById(memFindDTO.getM_id());
			int name = service.selectCntByName(memFindDTO.getM_name());
			int email = service.selectCntByEmail(memFindDTO.getM_email());
			int selectMember = service.selectCntByIdNameEmail(memFindDTO);
			
			if(e.getMessage() != null) {
				errorMsg = "입력이 올바르지 않습니다.";
			} /*
				 * else if(memberDTO.getM_id() == null || memberDTO.getM_id().equals("") ||
				 * memberDTO.getM_id().length() == 0) { errorMsg = "존재하지 않는 아이디 입니다."; }
				 */ else if(name == 0) {
				errorMsg = "존재하지 않는 이름 입니다.";
			} else if(email == 0) {
				errorMsg = "존재하지 않는 이메일 입니다.";
			} else if(selectMember == 0) {
				errorMsg = "입력하신 정보와 일치하는 회원이 존재하지 않습니다.";
			}
			
			model.addAttribute("error", errorMsg);
		}
		
		return DIR_MEMBER + DIR_FIND + "/findPw-result-view";
	}
	
	// 중복 로그인 발생 시
	@RequestMapping("/expired-login")
	public String expired_login() {
		return "error/expired-login";
	}

	// 마이페이지 =====================================================================
	@RequestMapping("/mypage")
	public String mypagePwView() {
		logger.info("mypagePwView()");
		
		return DIR_MEMBER + DIR_MYPAGE + "/mypage-view";
	}
	
	@RequestMapping("/mypage/{m_id}")
	@ResponseBody
	public String mypageView(@PathVariable String m_id, MemberDTO memberDTO) throws Exception {
		logger.info("mypageView().PathVariable.m_id: " + m_id);
		logger.info("mypageView().memberDTO.getM_id(): " + memberDTO.getM_id());
		logger.info("mypageView().memberDTO.getM_pw(): " + memberDTO.getM_pw());
		
		if(service.mypagePwCheck(memberDTO) == 1) {
			return "Success";
		}
		
		return "Fail";
	}
	
	/*
	@RequestMapping("/mypage/{m_id}")
	@ResponseBody
	public String resMypageView(@PathVariable String m_id, MemberDTO memberDTO) {
		logger.info("resMypageView().memberDTO.getM_pw(): " + memberDTO.getM_pw());
		
		
		return "Success";
	}*/
	
}
