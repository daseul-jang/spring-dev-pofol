<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/resources/common.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/custom/css/custom_navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/sidebar.css">
<script src="https://kit.fontawesome.com/6a51c3e878.js"
	crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
	<div class="navbar-logo">
		<a href="/main"><i class="fas fa-laptop-code"></i>POFO</a>
	</div>
	<div class="collapse navbar-collapse navbar-btn" id="navbarNav">
		<ul class="navbar-nav">
			<s:authorize access="isAnonymous()">
				<!-- 모달로 로그인 처리 -->
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/join">회원가입</a></li>
			</s:authorize>
			<s:authorize access="isAuthenticated()">
				<%-- <li><a id="menu-toggle" data-toggle="collapse" href="#menu-toggle" style="color: #fff; display: inline;">${sessionScope.m_nick}</a></li> --%>
				<li class="nav-item">
					<a href="<c:url value='/mypage'/>" class="nav-link" data-toggle="tooltip" data-placement="bottom" title="마이페이지" style="color: #fff;">
						${sessionScope.m_nick}
					</a>
				</li>
				<li class="nav-item">
					<form class="nav-link" id="logout" action="${pageContext.request.contextPath}/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="logout-btn" type="submit">로그아웃</button>
					</form>
				</li>
			</s:authorize>
		</ul>
	</div>
	<a id="menu-toggle" href="#menu-toggle" style="display: inline;">
		<span class="navbar-toggler-icon"></span>
	</a>
</nav>
<div id="wrapper">
	<!-- sidebar -->
	<div id="sidebar-wrapper">
		<div class="container-fluid side-section">
			<div class="sideNavMenu">
				<s:authorize access="isAnonymous()">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" id="loginModal-btn" data-toggle="modal" href="#loginModal">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="/join">회원가입</a></li>
					</ul>
				</s:authorize>
			</div>
			<div>
				<s:authorize access="isAuthenticated()">
					<div>
						<div>사진</div>
						<div>
							<a href="<c:url value='/mypage'/>" data-toggle="tooltip" data-placement="right" title="마이페이지" > ${sessionScope.m_nick} <!-- <i class="far fa-edit"></i> -->
							</a>
						</div>
					</div>
				</s:authorize>
			</div>
			<div class="sidebar-menu">
				<ul>
					<li class="sidebar-dropdown">
						<a href="#">
							<span>포트폴리오</span>
							<i class="fas fa-angle-down float-right"></i>
						</a>
						<div class="sidebar-submenu">
							<ul>
								<li>
									<%-- <a onclick="return userCheck();" href="${pageContext.request.contextPath}/portfolio/myPofol?m_id=${sessionScope.m_id}">나의 포트폴리오</a> --%>
									<a onclick="return userCheck();" href="<c:url value='/portfolio/${sessionScope.m_id }'/>">나의 포트폴리오</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/portfolio/userPofolList">회원 포트폴리오</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="sidebar-dropdown">
						<a href="#">
							<span>회원 커뮤니티</span>
							<i class="fas fa-angle-down float-right"></i>
						</a>
						<div class="sidebar-submenu">
							<ul>
								<li>
									<a href="${pageContext.request.contextPath}/userCommunity/freeBoard">자유 게시판</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/userCommunity/qnaBoard">질문 게시판</a>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<s:authorize access="hasAnyRole('ROLE_NEW', 'ROLE_USER')">
							<a href="#">문의하기</a>
						</s:authorize>
						<s:authorize access="hasRole('ROLE_ADMIN')">
							<a href="#">관리자 페이지</a>
						</s:authorize>
					</li>
				</ul>
			</div>
		</div>
		<div class="container-fluid side-footer">
			<div class="footer-logout">
				<s:authorize access="isAuthenticated()">
					<form class="nav-link" id="logout" action="${pageContext.request.contextPath}/logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button class="logout-btn" type="submit">로그아웃</button>
					</form>
				</s:authorize>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});

		/* $(window).resize(function(e) {
			if ($(window).width() <= 768) {
				$("#wrapper").removeClass("toggled");
			} else {
				$("#wrapper").addClass("toggled");
			}
		}); */

		$(".sidebar-dropdown > a").click(function() {
			$(".sidebar-submenu").slideUp(200);
			if ($(this).parent().hasClass("active")) {
				$(".sidebar-dropdown").removeClass("active");
				$(this).parent().removeClass("active");
			} else {
				$(".sidebar-dropdown").removeClass("active");
				$(this).next(".sidebar-submenu").slideDown(200);
				$(this).parent().addClass("active");
			}
		});
		
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	function userCheck() {
		var userInfo = "${sessionScope.m_id}";
		
		if(userInfo == "" || userInfo.length == 0 || userInfo == null) {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		} else {
			return true;
		}
	}
</script>