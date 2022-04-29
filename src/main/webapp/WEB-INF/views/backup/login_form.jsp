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

/* body {
	background-color: #cacaca;
} */
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

<!-- Modal -->
<!-- <div id="loginModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		Modal content
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">로그인</h4>
			</div>
			<div class="modal-body">
				<p>Some text in the modal.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div> -->

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
							<%-- <form role="form" method="post" action="<c:url value='/loginOk'/>"> --%>
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
												class="help-block"></span>
										</div>
									</div>
								</div>
								<!-- <div class="row">
									<div class="col-md-12">
										<a href="/sessions/forgot_password" class="login-a">비밀번호 찾기</a>
									</div>
								</div> -->
								<!-- <div class="row">
									<div class="col-md-6">
										<button type="submit" value="login" name="submit"
											class="btn btn-block btn-login">로그인</button>
									</div>
									<div class="col-md-6">
										<ul class="login-bottom">
											<li><a href="/sessions/forgot_password" class="login-a">비밀번호 찾기</a></li>
											<li><a href="" class="login-a">회원가입 하기</a></li>
										</ul>
									</div>
								</div> -->
								<div class="row">
									<div class="col-md-12">
										<button type="submit" value="login" name="submit"
											class="btn btn-block btn-login">로그인</button>
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
							<!-- <li>
								<a href="#" class="btn btn-lg btn-default btn-block" style="background-color: #03C75A">
									<img height="35px" src="/resources/img/snsLogin/naverLogo.svg"/>
									<span class="naver-font">Naver</span>
								</a>
							</li> -->
							<li><a href="#" class="btn btn-lg btn-block"
								style="background-color: #03C75A"> <span
									class="naver-logo naver-font">N</span> <span class="font-white">Naver</span>
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
