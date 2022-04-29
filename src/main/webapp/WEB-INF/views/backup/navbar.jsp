<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>

<%-- <%@ include file="/resources/common.jsp"%> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/custom/css/custom_navbar.css">
<script src="https://kit.fontawesome.com/6a51c3e878.js"
	crossorigin="anonymous"></script>

<style>
a:focus {
	text-decoration: none;
	color: white;
}
</style>

<nav class="navbar">
	<div class="navbar-logo">
		<a href="/main"><i class="fas fa-laptop-code"></i>POFO</a>
	</div>
	<div class="navbar-btn">
		<ul>
			<!-- <li><a href="/member/login">로그인</a></li>
			<li><a href="/member/join">회원가입</a></li> -->
			<s:authorize access="isAnonymous()">
				<!-- 모달로 로그인 처리 -->
				<li><a id="login-btn" data-toggle="modal" href="#loginModal">로그인</a></li>
				<li><a href="/join">회원가입</a></li>

				<!-- 로그인 모달 include -->
				<%-- <%@ include file="../../WEB-INF/views/member/login_form.jsp"%> --%>
			</s:authorize>
			<s:authorize access="isAuthenticated()">
				<li><a>회원정보</a></li>
				<li><a>로그아웃</a></li>
			</s:authorize>
			<s:authorize access="hasAnyRole('ROLE_OPER','ROLE_ADMIN')">
				<li>관리자</li>
			</s:authorize>
		</ul>
	</div>
</nav>