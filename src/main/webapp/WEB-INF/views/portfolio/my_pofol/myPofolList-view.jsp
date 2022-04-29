<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<c:if test="${empty myPofolList }">
		<h1>데이터 없음</h1>
	</c:if>
	<div class="row">
		<c:forEach items="${myPofolList }" var="list">
			<!-- 이미지 썸네일 -->
			<div class="card mx-2" onclick="view(${list.p_no});">
				<img class="card-img-top"
					src="${pageContext.request.contextPath}/resources/portfolio/upload/${list.p_thumbnail }">
				<div class="card-body">
					<h4 class="card-title">${list.p_title }</h4>
					<p class="card-text">${list.m_nick }</p>
					<p class="card-text">등록일 : ${list.p_regDate }</p>
					<p class="card-text">추천수 : ${list.p_recomm }</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
