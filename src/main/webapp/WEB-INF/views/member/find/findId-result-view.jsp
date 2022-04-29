<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<link rel="stylesheet" href="/resources/custom/css/custom_find.css">
<style>
	.find-btn-group {
		list-style: none;
		display: flex;
		justify-content: space-between;
		padding-top: 5px;
		padding-left: 0px;
	}
</style>
<script>
var header = '${_csrf.headerName}';
var token = '${_csrf.token}';

function findIdEmail() {
	var $findId = "${fullID}";
	//var $m_email = "${memEmail}";
	//console.log("findID: " + $findId + ", memEmail: " + $m_email);
	console.log("findID: " + $findId);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/login/findIdEmailSend",
		type: "POST",
		data: {
			//"m_email" : $m_email,
			"findId" : $findId
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			if(data == "Success") {
				alert("이메일이 전송되었습니다.");
			}
		},
		error: function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
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
							<div class="col-md-9 mx-auto mb-4 text-center">
								<h1>아이디 찾기 결과</h1>
							</div>
							<div class="col-md-9 py-2 mx-auto border-radius">
								<div class="col-md-12 mt-1">
									<div class="text-center border-bottom">
										<h2 class="mb-3">${findID }</h2>
									</div>
									<p class="text-center pt-2">온전한 아이디는 이메일로 받아 보실 수 있습니다.</p>
								</div>
								<div class="col-md-12 mt-5">
									<ul class="find-btn-group">
										<li>
											<a class="btn btn-block btn-login" href="${pageContext.request.contextPath}/main">메인으로</a>
										</li>
										<li>
											<button class="btn btn-block btn-login" onclick="findIdEmail();">이메일 전송</button>
										</li>
									</ul>
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