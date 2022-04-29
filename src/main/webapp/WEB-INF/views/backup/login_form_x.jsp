<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO - Login</title>
<%@ include file="/resources/common.jsp"%>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css"
	rel="stylesheet">

<style>
@font-face {
	font-family: "NanumSquareOTF_acEB";
	src: url("/resources/font/NanumSquareOTF_acEB.otf") format("opentype");
}

ul.list-social>li {
	padding-bottom: 5px;
}

.btn-login {
	background-color: #7293b4;
	color: #fff;
}

.login-a {
	text-decoration: none;
	color: #627388;
}

.login-a:hover {
	color: #4a85a8;
}

.login-bottom {
	list-style: none;
	display: flex;
	justify-content: space-between;
	padding-top: 5px;
	padding-left: 0px;
}

.font-white {
	color: #fff;
}

.naver-logo {
	font-family: NanumSquareOTF_acEB;
	font-size: 19px;
	font-weight: 900;
}

.google-logo {
	background-color: #DC4B29;
}

.facebook-logo {
	background-color: #415DAE;
}

.twitter-logo {
	background-color: #1DA1F2;
}

.twitter-logo>i {
	color: #fff;
}
</style>

<script type="text/javascript">
	$(function() {

		$('#login-btn').click(function() {
			loginProcessing();
		})

	})

	function loginProcessing() {
		$.ajax({
			url : "${pageContext.request.contextPath}/login-check",
			type : "POST",
			data : {
				"m_id" : $('#m_id').val(),
				"m_pw" : $('#m_pw').val()
			},
			beforeSend : function(xhr) {
				var $token = $("#token");
				xhr.setRequestHeader($token.data("token-name"), $token.val());
			},
			success : function(response) {
				alert('로그인 성공');

				// 로그인 한 회원이 이메일 인증 완료 되었으면 메인으로
				location = "main";

				// 이메일 인증이 안 되었으면 이메일 인증 요청 화면으로
			},
			error : function(a, b, c) {
				/*alert('로그인 실패');
				location = "main";*/
				console.log(a, b, c);
			}
		})
	}
</script>
</head>
<body>
	<%@ include file="/resources/include/navbar.jsp"%>
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="myModalLabel">로그인</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-6">
							<div class="well">
								<%-- <form id="loginForm" role="form" method="post" action="<c:url value='/loginOk'/>"> --%>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="m_id" class="control-label">아이디</label> <input
												type="text" class="form-control" id="m_id" name="m_id"
												value="" placeholder="아이디를 입력해주세요." required> <span
												class="help-block"></span>
										</div>
										<div class="form-group">
											<label for="m_pw" class="control-label">비밀번호</label> <input
												type="password" class="form-control" id="m_pw" name="m_pw"
												value="" placeholder="비밀번호를 입력해주세요." required> <span
												class="help-block"></span> <input type="hidden" id="token"
												data-token-name="${_csrf.headerName}" placeholder="Password"
												value="${_csrf.token}">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<button type="submit" value="login" id="login-btn"
											name="submit" class="btn btn-block btn-login">로그인</button>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<ul class="login-bottom">
											<li><a href="/sessions/forgot_password" class="login-a">비밀번호
													찾기</a></li>
											<li><a href="" class="login-a">회원가입 하기</a></li>
										</ul>
									</div>
								</div>
								<!-- </form> -->
							</div>
						</div>
						<div class="col-xs-6">
							<h5>SNS 로그인</h5>
							<ul class="list-unstyled list-social">
								<li><a href="#" class="btn btn-lg btn-block"
									style="background-color: #03C75A"> <span
										class="naver-logo naver-font">N</span> <span
										class="font-white">Naver</span>
								</a></li>
								<li><a href="#" class="btn btn-lg btn-block google-logo">
										<i class="fa fa-google-plus"></i> <span class="">Google</span>
								</a></li>
								<li><a href="#" class="btn btn-lg btn-block facebook-logo">
										<i class="fa fa-facebook"></i> <span class="">Facebook</span>
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
	</div>
</body>
</html>