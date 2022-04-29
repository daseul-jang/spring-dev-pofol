<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 정렬 부분 -->
<div class="container-fluid">
	<ul class="list-group list-group-horizontal justify-content-end">
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/main?sort=new">최신순</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/main?sort=best">인기순</a></li>
	</ul>
</div>

<!-- 게시글 썸네일 보여주는 부분 -->

<div class="container-fluid">
	<div class="row my-2">
		<div class="col-md-12">
			<h2>${sort }</h2>
		</div>
	</div>
	<div class="row">
		<c:if test="${empty mainList }">
			<h1>데이터 없음</h1>
		</c:if>
		<c:forEach items="${mainList }" var="mainList">
			<!-- 이미지 썸네일 -->
			<div class="card mx-2" onclick="view(${mainList.p_no});">
				<img class="card-img-top"
					src="${pageContext.request.contextPath}/resources/portfolio/upload/${mainList.p_thumbnail }">
				<div class="card-body">
					<h4 class="card-title">${mainList.p_title }</h4>
					<p class="card-text">${mainList.m_nick }</p>
					<p class="card-text">등록일 : ${mainList.p_regDate }</p>
					<p class="card-text">추천수 : ${mainList.p_recomm }</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>