/**
 * 회원가입 유효성 검사 및 데이터 전송을 위한 ajax
 * 2021.06.25 작성자 : 장다슬
 */
 
var header = '${_csrf.headerName}';
var token = '${_csrf.token}';

$(function() {
	$("#join-btn").click(function() {
		joinProcessing();
	})
})

function joinProcessing() {
	var $m_id = $("#join_id").val();
	var $m_pw = $("#join_pw").val();
	var $m_name = $("#m_name").val();
	var $m_nick = $("#m_nick").val();
	var $m_email = $("#m_email").val();
	
	$.ajax({
		url: "${pageContext.request.contextPath}/join/join-check",
		type: "POST",
		cache : false,
		data: {
			"m_id":$m_id,
			"m_pw":$m_pw,
			"m_name":$m_name,
			"m_nick":$m_nick,
			"m_email":$m_email
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			if(data == "success"){
				alert('회원가입이 완료되었습니다.\n'
						+ '이메일 인증을 진행해 주세요.');
				location.href = "${pageContext.request.contextPath}/join/reqEmailAuth?m_id=" + $m_id;
			}
		},
		error: function() {
			alert('회원가입에 실패하였습니다. 다시 시도해 주세요.');
			location.href = "${pageContext.request.contextPath}/main";
		}
	});
}