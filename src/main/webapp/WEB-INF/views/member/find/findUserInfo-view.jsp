<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<link rel="stylesheet" href="/resources/custom/css/custom_find.css">
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section class="container con-findUserInfo py-5">
		<ul class="nav nav-tabs nav-justified" id="findMenu">
			<li class="nav-item">
				<a class="nav-link active"
				data-toggle="tab" href="#findId">아이디 찾기</a>
			</li>
			<li class="nav-item" style="margin-right: 0px;">
				<a class="nav-link" data-toggle="tab"
				href="#findPw">비밀번호 찾기</a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade show active" id="findId">
				<div class="row justify-content-center row-findUserInfo">	
					<form action="${pageContext.request.contextPath}/login/findId" class="col-md-9 py-2 align-self-center border-radius">
						<div class="col-md-12 mt-3">
							<div class="form-group">
								<label class="control-label" for="findId-name">이름</label>
								<input type="text" id="findId-name" name="m_name" class="form-control">
							</div>
							<div class="form-group">
								<label class="control-label" for="findId-email">이메일</label>
								<input type="text" id="findId-email" name="m_email" class="form-control">
								<span class="span-advice px-1">회원가입 당시 입력한 이메일을 기입해 주세요.</span>
							</div>
						</div>
						<div class="col-md-12 mt-5">
							<div class="form-group">
								<button type="submit" class="btn btn-block btn-login">다음</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="tab-pane fade" id="findPw">
				<div class="row justify-content-center row-findUserInfo">
					<form action="${pageContext.request.contextPath}/login/findPw" class="col-md-9 py-2 align-self-center border-radius">
						<div class="col-md-12 mt-3">
							<div class="form-group">
								<label class="control-label" for="findPw-name">이름</label>
								<input type="text" id="findPw-name" name="m_name" class="form-control">
							</div>
							<div class="form-group">
								<label class="control-label" for="findPw-id">아이디</label>
								<input type="text" id="findPw-id" name="m_id" class="form-control">
							</div>
							<div class="form-group">
								<label class="control-label" for="findPw-email">이메일</label>
								<input type="text" id="findPw-email" name="m_email" class="form-control">
								<span class="span-advice px-1">회원가입 당시 입력한 이메일을 기입해 주세요.</span>
							</div>
						</div>
						<div class="col-md-12 mt-5">
							<div class="form-group">
								<button type="submit" class="btn btn-block btn-login">다음</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>