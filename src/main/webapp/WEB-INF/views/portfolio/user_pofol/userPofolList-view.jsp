<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<script type="text/javascript">
	function view(pno) {
		location.href = "${pageContext.request.contextPath}/portfolio/userPofol/view/" + pno;
	}
</script>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section class="container-fluid">
		<div>
			<form>
				<input type="text" name="word" value="${pageObject.word}">
				<button type="submit">검색</button>
			</form>
			<ul class="list-group list-group-horizontal justify-content-end">
				<li class="list-group-item"><a href="${pageContext.request.contextPath}/portfolio/userPofolList?sort=new">최신순</a></li>
				<li class="list-group-item"><a href="${pageContext.request.contextPath}/portfolio/userPofolList?sort=best">인기순</a></li>
			</ul>
		</div>
		<div>
			<c:if test="${empty pofolList }">
				<h1>데이터 없음</h1>
			</c:if>
			<c:set var="i" value="0"/>
			<c:set var="j" value="4"/>
			<c:forEach items="${pofolList }" var="list">
				<c:if test="${i%j == 0 }">
					<div class="row">
				</c:if>
				<!-- 이미지 썸네일 -->
				<div class="card mx-2 mb-3" onclick="view(${list.p_no});">
					<img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/portfolio/upload/${list.p_thumbnail }">
					<div class="card-body">
						<h5 class="card-title">${list.p_title }</h5>
						<p>${list.m_nick }</p>
						<p>등록일 : <fmt:formatDate value="${list.p_regDate }" pattern="yyyy.MM.dd"/></p>
						<p>추천수 : ${list.p_recomm }</p>
					</div>
				</div>
				<c:if test="${i%j == j-1 }">
					</div>
				</c:if>
				<c:set var="i" value="${i+1 }"/>
			</c:forEach>
		</div>
		<div>
			<pageNav:pageNav pageObject="${pageObject }" listURI="${pageContext.request.contextPath}/portfolio/userPofolList"/>
		</div>
	</section>
</body>
</html>