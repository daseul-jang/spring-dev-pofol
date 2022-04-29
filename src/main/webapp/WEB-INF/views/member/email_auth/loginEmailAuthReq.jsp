<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<script type="text/javascript">

function sendMail() {
	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";
	var $m_id = "${sessionScope.m_id}";
	
	console.log("sessionID: " + $m_id);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/login/sendAuthMail",
		type: "POST",
		data: {
			"m_id" : $m_id
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			if(data == "Success") {
				alert("메일이 전송되었습니다.");
			} else {
				alert("오류 발생");
				history.back();
			}
		}
	});
}

function goMain() {
	location.href = "${pageContext.request.contextPath}/main";
}

</script>
<!-- Header include -->
	<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section>
		<h1>[이메일 인증]</h1>
		<h3>버튼을 눌러 인증을 진행해 주세요.</h3>
		<button onclick="sendMail();">인증 메일 보내기</button>
		<button onclick="goMain();">메인으로</button>
	</section>
</body>
</html>