/**
 * 모달로 로그인 처리를 하기 위한 ajax
 * 2021.06.17 작성자 : 장다슬
 */

$(function() {
	$('#loginModal-btn').click(function() {
		loginUrl();
	})

	$('#login-btn').click(function() {
		loginProcessing();
	})
})

function loginUrl() {
	$.ajax({
		url: "/login"
	})
}

function loginProcessing() {
	$.ajax({
		url: "/loginOk",
		type: "POST",
		data: {
			"m_id": $('#m_id').val(),
			"m_pw": $('#m_pw').val()},
		beforeSend: function(xhr) {
			var $token = $("#token");
			xhr.setRequestHeader($token.data("token-name"), $token.val());
		},
		success: function(response) {
			alert('로그인 성공');
			
			// 로그인 한 회원이 이메일 인증 완료 되었으면 메인으로
			location = "main";
			
			// 이메일 인증이 안 되었으면 이메일 인증 요청 화면으로
		},
		error: function(a,b,c) {
			/*alert('로그인 실패');
			location = "main";*/
			console.log(a,b,c);
		}
	})
}