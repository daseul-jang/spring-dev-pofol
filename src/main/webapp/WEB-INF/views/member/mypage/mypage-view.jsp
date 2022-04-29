<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
<script type="text/javascript">
	/* function sendPw() {
		var header = "${_csrf.headerName}";
		var token = "${_csrf.token}";
		var $m_id = "${sessionScope.m_id}";
		var $m_pw = $("#inputPw").val();
		
		console.log("sendPw().m_id: " + $m_id);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/mypage/" + $m_id,
			type: "POST",
			data: {
				"m_id" : $m_id,
				"m_pw" : $m_pw
			},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				if(data == "Success") {
					$("#inputPwArea").css("display", "none");
					$("#mypageArea").css("display", "block");
				}
				
			}
		});
	} */
</script>
</head>
<body>
	<section>
		<!-- <div id="inputPwArea">
			<p>비밀번호를 입력해 주세요.</p>
			<input type="password" name="m_pw" id="inputPw">
			<button onclick="sendPw();">확인</button>
		</div>
		<div id="mypageArea" style="display: none;">
			<p>비번입력완ㅋ</p>
		</div> -->
		<div>
			<h3>기본 정보 (프로필, 닉네임 변경)</h3>
			<div>
				
			</div>
		</div>
		<div>
			비밀번호 변경
		</div>
		<div>
			이메일 변경
		</div>
	</section>
</body>
</html>