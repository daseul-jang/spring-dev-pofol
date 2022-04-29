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

/*function login() {
	$.ajax({
		url: "/login",
		type: "POST",
		data : $('#logFrm').serialize()
	},
	beforeSend:function(xhr)
	{
		var $token = $("#token");
		xhr.setRequestHeader($token.data("token-name"), $token.val());
	},
	success:function(response)
	{
		if(response.code == "200") {
			window.location = response.item.url;
		} else {
			alert(response.message);
		}
	},
	error:function(a,b,c)
	{
		console.log(a,b,c);
	})
}*/

/*function login() {
	$.ajax({
		url: "/login",
		type: "POST",
		data : $('#loginForm').serialize(),
		success:function(data) {
			alert('로그인 성공');
			location = "main";
		}
	})
}*/

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
			/*alert('로그인 성공');
			location = "main";*/
			if (response.code == "200") {
				window.location = response.item.url;
			} else {
				alert(response.message);
			}
		},
		error: function(a,b,c) {
			/*alert('로그인 실패');
			location = "main";*/
			console.log(a,b,c);
		}
	})
}