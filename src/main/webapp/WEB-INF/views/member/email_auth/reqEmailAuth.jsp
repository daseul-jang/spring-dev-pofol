<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<style>
	.link {
		color: black;
	}
</style>
<!-- Header include -->
	<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section>
		<h1>이메일이 전송되었습니다.</h1>
		<a href="/main" class="link">메인화면으로 가기</a>
		<a href="/join/reqEmailAuth?m_id=${memberDTO.m_id }" class="link">인증메일 다시 보내기</a>
	</section>
</body>
</html>