<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css"
	rel="stylesheet">
<script type="text/javascript">

function validCheckLogin(obj) {
	console.log("validCheckLogin()");
	
	//var $id = $("#m_id").val();
	//var $pw = $("#m_pw").val();
	var id = obj["m_id"].value;
	var pw = obj["m_pw"].value;
	var errorMsg = "${errorMsg}"
	
	/*if($id == "" || $id.length == 0) {
		alert("아이디를 입력해 주세요.");
		return false;
	}
	
	if($pw == "" || $pw.length == 0) {
		alert("비밀번호를 입력해 주세요.");
		return false;
	}*/
	
	if(id == "" || id.length == 0) {
		alert("아이디를 입력해 주세요.");
		return false;
	}
	
	if(pw == "" || pw.length == 0) {
		alert("비밀번호를 입력해 주세요.");
		return false;
	}
	
	/* console.log("validCheckLogin().errorMsg: " + errorMsg);
	
	if(errorMsg != "" || errorMsg != 0) {
		alert(errorMsg);
		history.back();
		return false;
	} */
}

</script>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
<link rel="stylesheet"
	href="/resources/custom/css/custom_loginForm.css">
</head>
<body>
	<section class="container-fluid">
		<div class="modal-dialog modal-lg" style="padding-top: 70px;">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">로그인</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-6">
							<div class="well">
								<form action="<c:url value='/login-processing'/>" method="POST" onsubmit="return validCheckLogin(this);">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="m_id" class="control-label">아이디</label>
												<input type="text" class="form-control" value="${m_id }"
												id="m_id" name="m_id" placeholder="아이디">
											</div>
											<div class="form-group">
												<label for="m_pw" class="control-label">비밀번호</label>
												<input type="password" class="form-control" 
												id="m_pw" name="m_pw"placeholder="비밀번호">
												<%-- <c:if test="${not empty errorMsg}">
													<label class="check-valid">${errorMsg}</label>
												</c:if> --%>
											</div>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<button class="btn btn-block btn-login">로그인</button>
										</div>
									</div>
								</form>
								<div class="row">
									<div class="col-md-12">
										<ul class="login-bottom">
											<li>
												<a href="/login/findUserInfo" class="login-a">아이디/비밀번호 찾기</a>
											</li>
											<li>
												<a href="/join" class="login-a">회원가입 하기</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<h5>SNS 로그인</h5>
							<ul class="list-unstyled list-social">
								<li><a href="#" class="btn btn-lg btn-block"
									style="background-color: #03C75A"> <span
										class="naver-logo naver-font font-white">N</span> <span class="font-white">Naver</span>
								</a></li>
								<li><a href="#" class="btn btn-lg btn-block google-logo">
										<i class="fa fa-google-plus font-white"></i> <span class="font-white">Google</span>
								</a></li>
								<li><a href="#" class="btn btn-lg btn-block facebook-logo">
										<i class="fa fa-facebook font-white"></i> <span class="font-white">Facebook</span>
								</a></li>
								<li><a href="#" class="btn btn-lg btn-block twitter-logo">
										<i class="fab fa-twitter"></i> <span class="font-white">Twitter</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>