<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	/* font-size: 19px; */
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

function enterEvent() {
	if(window.event.keyCode == 13) {
		loginProcessing();
	}
}

function loginProcessing() {
	var $m_id = $("#m_id").val();
	var $m_pw = $("#m_pw").val();
	
	if($m_id == "" || $m_id.length == 0) {
		alert("아이디를 입력해 주세요.");
		return false;
	} else if ($m_pw == "" || $m_pw.length == 0) {
		alert("비밀번호를 입력해 주세요.");
		return false;
	} else {
		$.ajax({
			url: "${pageContext.request.contextPath}/login-check",
			type: "POST",
			data: {
				"m_id": $("#m_id").val(),
				"m_pw": $("#m_pw").val()
			},
			beforeSend: function(xhr) {
				var $token = $("#token");
				xhr.setRequestHeader($token.data("token-name"), $token.val());
			},
			success: function(response) {
				console.log("로그인 완료");
				location.href = "${pageContext.request.contextPath}/login/authChk?m_id=" + $m_id;
				return true;
			},
			error: function(a,b,c) {
				// 추후 수정
				alert("아이디 또는 비밀번호를 다시 확인해 주세요.");
				console.log(a,b,c);
				return false;
			}
		});
	}
}

</script>

<!-- Modal -->
<div id="loginModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">로그인</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-6">
						<div class="well">
							<input type="hidden" id="token"
								data-token-name="${_csrf.headerName}" placeholder="Password"
								value="${_csrf.token}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="m_id" class="control-label">아이디</label>
										<input type="text" class="form-control" 
										id="m_id" name="m_id" placeholder="아이디" required>
									</div>
									<div class="form-group">
										<label for="m_pw" class="control-label">비밀번호</label>
										<input type="password" class="form-control" 
										id="m_pw" name="m_pw"placeholder="비밀번호" required onkeyup="enterEvent();">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button type="submit" value="login" id="login-btn"
									name="submit" class="btn btn-block btn-login" onclick="return loginProcessing();">로그인</button>
								</div>
							</div>
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
</div>
