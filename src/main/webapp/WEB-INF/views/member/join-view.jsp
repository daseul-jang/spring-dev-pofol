<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%-- <meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}"> --%>
<meta charset="UTF-8">
<title>DEV POFO</title>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
<script type="text/javascript">
var $idChk = false;
var $pwChk = false;
var $pwComChk = false;
var $nameChk = false;
var $nickChk = false;
var $emailChk = false;

var header = '${_csrf.headerName}';
var token = '${_csrf.token}';

$(function() {
	$("#join-btn").click(function() {
		joinProcessing();
	})
})

function validCheckId() {
	var $m_id = $("#join_id").val();
	var $pattern = /^[a-z]{2}[a-z0-9_\-]{4,20}$/;
	var $blank = /\s/gi;
	var $korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	
	if(new RegExp($blank).test($m_id)) { // 공백이 있으면
		var a = $m_id.replace($blank,"");
		$("#join_id").val(a); // 공백제거
	}
	
	if(new RegExp($pattern).test($m_id)) {
		
		// 아이디 중복체크
		$.ajax({
			url: "${pageContext.request.contextPath}/join/idChk",
			type: "POST",
			cache: false,
			data: {"m_id" : $m_id},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data, status) {
				if(data == "Success") { // 아이디가 중복이 아닐때 (사용가능)
					$("#join_id").removeClass("is-invalid");
					$("#join_id").addClass("is-valid");
					$idChk = true;
				} else { // 아이디가 중복일때 (사용불가능)
					$("#join_id").removeClass("is-valid");
					$("#join_id").addClass("is-invalid");
					$("#join_id").parent(".form-group").find("span").html("이미 사용 중인 아이디입니다.");
					$("#join_id").parent(".form-group").find("span").removeClass("valid-feedback");
					$("#join_id").parent(".form-group").find("span").addClass("invalid-feedback");
					$idChk = false;
				}
			}
			
		});
	} else if(new RegExp($korean).test($m_id)) { // 한글이 있으면
		$("#join_id").removeClass("is-valid");
		$("#join_id").addClass("is-invalid");
		$("#join_id").parent(".form-group").find("span").html("아이디는 한글로 입력할 수 없습니다.");
		$("#join_id").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#join_id").parent(".form-group").find("span").addClass("invalid-feedback");
		$idChk = false;
	} else { // 그외 정규식에 어긋나면
		$("#join_id").removeClass("is-valid");
		$("#join_id").addClass("is-invalid");
		$("#join_id").parent(".form-group").find("span").html("아이디는 영문, 숫자를 포함하여 6자 이상 20자 이하여야 합니다.");
		$("#join_id").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#join_id").parent(".form-group").find("span").addClass("invalid-feedback");
		$idChk = false;
	}
}

function validCheckPw() {
	var $m_pw = $("#join_pw").val();
	var $pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*])[A-Za-z\d~!@#$%^&*]{8,20}$/;
	var $blank = /\s/gi;
	
	if(new RegExp($blank).test($m_pw)) { // 공백이 있으면
		var a = $m_pw.replace($blank,"");
		$("#join_pw").val(a); // 공백제거
	}
	
	if(new RegExp($pattern).test($m_pw)) {
		$("#join_pw").removeClass("is-invalid");
		$("#join_pw").addClass("is-valid");
		$pwChk = true;
	} else {
		$("#join_pw").removeClass("is-valid");
		$("#join_pw").addClass("is-invalid");
		$("#join_pw").parent(".form-group").find("span").html("비밀번호는 영문, 숫자, 특수문자를 포함하여 8자 이상 20자 이하여야 합니다.");
		$("#join_pw").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#join_pw").parent(".form-group").find("span").addClass("invalid-feedback");
		$pwChk = false;
	}
}

function validCheckPwCom() {
	var $m_pw = $("#join_pw").val();
	var $m_pwCom = $("#m_pwCom").val();
	var $blank = /\s/gi;
	
	if(new RegExp($blank).test($m_pwCom)) { // 공백이 있으면
		var a = $m_pwCom.replace($blank,"");
		$("#m_pwCom").val(a); // 공백제거
	}
	
	if($m_pw == "" || $m_pw.length == 0) { // 비밀번호 입력이 안 되어 있으면
		$("#m_pwCom").removeClass("is-valid");
		$("#m_pwCom").addClass("is-invalid");
		$("#m_pwCom").parent(".form-group").find("span").html("비밀번호를 입력해 주세요.");
		$("#m_pwCom").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#m_pwCom").parent(".form-group").find("span").addClass("invalid-feedback");
		$pwComChk = false;
	} else { // 비밀번호 입력이 돼 있으면
		if($m_pw == $m_pwCom) { // 비밀번호가 일치하면
			$("#m_pwCom").removeClass("is-invalid");
			$("#m_pwCom").addClass("is-valid");
			$pwComChk = true;
		} else { // 일치하지 않으면
			$("#m_pwCom").removeClass("is-valid");
			$("#m_pwCom").addClass("is-invalid");
			$("#m_pwCom").parent(".form-group").find("span").html("비밀번호가 일치하지 않습니다.");
			$("#m_pwCom").parent(".form-group").find("span").removeClass("valid-feedback");
			$("#m_pwCom").parent(".form-group").find("span").addClass("invalid-feedback");
			$pwComChk = false;
		}
	}
}

function validCheckName() {
	var $m_name = $("#m_name").val();
	var $pattern = /^[가-힣]{3,7}$/;
	var $blank = /\s/gi;
	
	if(new RegExp($blank).test($m_name)) { // 공백이 있으면
		var a = $m_name.replace($blank,"");
		$("#m_name").val(a); // 공백제거
	}
	
	if(new RegExp($pattern).test($m_name)) {
		$("#m_name").removeClass("is-invalid");
		$("#m_name").addClass("is-valid");
		$nameChk = true;
	} else {
		$("#m_name").removeClass("is-valid");
		$("#m_name").addClass("is-invalid");
		$("#m_name").parent(".form-group").find("span").html("이름은 3자 이상 7자 이하 한글만 가능합니다.");
		$("#m_name").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#m_name").parent(".form-group").find("span").addClass("invalid-feedback");
		$nameChk = false;
	}
}

function validCheckNick() {
	var $m_nick = $("#m_nick").val();
	var $pattern = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]{2,20}$/;
	
	if(new RegExp($pattern).test($m_nick)) {
		$.ajax({ // 닉네임 중복검사
			url: "${pageContext.request.contextPath}/join/nickChk",
			type: "POST",
			cache: false,
			data: {"m_nick" : $m_nick},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data, status) {
				if(data == "Success") {
					$("#m_nick").removeClass("is-invalid");
					$("#m_nick").addClass("is-valid");
					$nickChk = true;
				} else {
					$("#m_nick").removeClass("is-valid");
					$("#m_nick").addClass("is-invalid");
					$("#m_nick").parent(".form-group").find("span").html("이미 사용 중인 닉네임입니다.");
					$("#m_nick").parent(".form-group").find("span").removeClass("valid-feedback");
					$("#m_nick").parent(".form-group").find("span").addClass("invalid-feedback");
					$nickChk = false;
				}
			}
		});
	} else {
		$("#m_nick").removeClass("is-valid");
		$("#m_nick").addClass("is-invalid");
		$("#m_nick").parent(".form-group").find("span").html("닉네임은 2자 이상 20자 이하 영문, 숫자, 한글만 가능합니다.");
		$("#m_nick").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#m_nick").parent(".form-group").find("span").addClass("invalid-feedback");
		$nickChk = false;
	}
}

function validCheckEmail() {
	var $m_email = $("#m_email").val();
	var $pattern = /^(([a-zA-Z\d][-_]?){3,20})@([a-zA-z\d.]{3,20})\.([a-z]{2,3})$/;
	var $blank = /\s/gi;
	
	if(new RegExp($blank).test($m_email)) { // 공백이 있으면
		var a = $m_email.replace($blank,"");
		$("#m_email").val(a); // 공백제거
	}
	
	if(new RegExp($pattern).test($m_email)) {
		$.ajax({
			url: "${pageContext.request.contextPath}/join/emailChk",
			type: "POST",
			cache: false,
			data: {"m_email" : $m_email},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				if(data == "Success") {
					$("#m_email").removeClass("is-invalid");
					$("#m_email").addClass("is-valid");
					$emailChk = true;
				} else {
					$("#m_email").removeClass("is-valid");
					$("#m_email").addClass("is-invalid");
					$("#m_email").parent(".form-group").find("span").html("중복된 이메일입니다.");
					$("#m_email").parent(".form-group").find("span").removeClass("valid-feedback");
					$("#m_email").parent(".form-group").find("span").addClass("invalid-feedback");
					$emailChk = false;
				}
			}
		});
	} else {
		$("#m_email").removeClass("is-valid");
		$("#m_email").addClass("is-invalid");
		$("#m_email").parent(".form-group").find("span").html("이메일 형식이 맞지 않습니다.");
		$("#m_email").parent(".form-group").find("span").removeClass("valid-feedback");
		$("#m_email").parent(".form-group").find("span").addClass("invalid-feedback");
		$emailChk = false;
	}
}

function joinProcessing() {
	validCheckId();
	validCheckPw();
	validCheckPwCom();
	validCheckName();
	validCheckNick();
	validCheckEmail();
	
	var $m_id = $("#join_id").val();
	var $m_pw = $("#join_pw").val();
	var $m_name = $("#m_name").val();
	var $m_nick = $("#m_nick").val();
	var $m_email = $("#m_email").val();
	
	console.log($idChk);
	if($idChk && $pwChk && $pwComChk && $nameChk && $nickChk && $emailChk) {
		$.ajax({
			url: "${pageContext.request.contextPath}/join/join-check",
			type: "POST",
			cache : false,
			data: {
				"m_id" : $m_id,
				"m_pw" : $m_pw,
				"m_name" : $m_name,
				"m_nick" : $m_nick,
				"m_email" : $m_email
			},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				console.log("join ajax success function");
				if(data == "Success"){
					alert('회원가입이 완료되었습니다.\n'
							+ '이메일 인증을 진행해 주세요.');
					location.href = "${pageContext.request.contextPath}/join/reqEmailAuth?m_id=" + $m_id;
				}
			},
			error: function() {
				alert('회원가입에 실패하였습니다. 다시 시도해 주세요.');
				location.href = "${pageContext.request.contextPath}/main";
				return false;
			}
		});
	} else {
		alert('회원가입에 실패하였습니다.\n'
				+ '입력창을 다시 확인해 주세요.');
		return false;
	}
		
}
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/custom/css/custom_joinForm.css">
<style>
	.valid-span {
		display: none;
	}
</style>
</head>
<body>
	<section class="container-fluid">
		<div class="row modal-dialog" style="padding-top: 70px;">
			<div class="join-box col-md-12 mx-auto modal-content">
				<div class="join-title form-group">
					<h2 class="mb-4 mt-4">회원가입</h2>
				</div>
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
				<div class="form-group-box">
					<div class="input-box">
						<div class="form-group">
							<label class="control-label" for="join_id">아이디</label> 
							<input id="join_id" name="m_id" type="text" 
							maxlength="20" class="form-control" onkeyup="validCheckId();">
							<span class="valid-span"></span>
						</div>
						<div class="form-group">
							<label class="control-label" for="join_pw">비밀번호</label>
							<input id="join_pw" name="m_pw" type="password" 
							maxlength="20" class="form-control" onkeyup="validCheckPw();">
							<span class="valid-span"></span>
						</div>
						<div class="form-group">
							<label class="control-label" for="m_pwCom">비밀번호 확인</label>
							<input id="m_pwCom" name="m_pwCom" type="password" 
							maxlength="20" class="form-control" onkeyup="validCheckPwCom();">
							<span class="valid-span"></span>
						</div>
						<div class="form-group">
							<label class="control-label" for="m_name">이름</label>
							<input id="m_name" name="m_name" type="text" 
							maxlength="10" class="form-control" onkeyup="validCheckName();">
							<span class="valid-span"></span>
						</div>
						<div class="form-group">
							<label class="control-label" for="m_nick">닉네임</label>
							<input id="m_nick" name="m_nick" type="text" 
							maxlength="20" class="form-control" onkeyup="validCheckNick();">
							<span class="valid-span"></span>
						</div>
						<div class="form-group">
							<label class="control-label" for="m_email">이메일</label>
							<input id="m_email" name="m_email" type="text" 
							maxlength="50" class="form-control" onkeyup="validCheckEmail();">
							<span class="valid-span"></span>
						</div>
					</div>
					<div class="form-group">
						<button id="join-btn" class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>