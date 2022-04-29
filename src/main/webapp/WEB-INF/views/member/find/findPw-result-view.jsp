<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<link rel="stylesheet" href="/resources/custom/css/custom_find.css">
<script>
/* var header = '${_csrf.headerName}';
var token = '${_csrf.token}';

function findIdEmail() {
	
} */
</script>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section class="container con-findUserInfo py-5">
		<div class="tab-content br-t">
			<div class="row justify-content-center row-findUserInfo">
				<div class="col-md-12 align-self-center">
					<c:choose>
						<c:when test="${empty error }">
							<div class="row py-2 mx-4 border-radius" style="height: 300px;">
								<div class="col-md-12 mx-auto align-self-center">
									<div class="py-2 text-center">
										<h4 class="mb-3 pb-3 border-bottom">${msg }</h4>
										<p>로그인 후 비밀번호를 변경해 주세요.</p>
									</div>
									<div class="col-md-12 my-3">
										<div class="float-right">
											<a class="btn btn-block btn-login" href="${pageContext.request.contextPath}/main">메인으로</a>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-9 mx-auto mb-4 text-center">
								<h1>ERROR</h1>
							</div>
							<div class="col-md-9 py-2 mx-auto border-radius">
								<div class="col-md-12 mt-1">
									<p class="text-center pt-2">${error }</p>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
</body>
</html>