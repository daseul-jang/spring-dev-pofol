<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section>
		<div>
			<div>제목 : ${pofolDTO.p_title }</div>
			<div>내용 : ${pofolDTO.p_content }</div>
			<div>개발 기간 : ${pofolDTO.p_startDate } ~ ${pofolDTO.p_endDate }</div>
			<div>개발 환경 : ${pofolDTO.p_devSetting }</div>
			<div>기술 스택 : ${pofolDTO.p_stack }</div>
			<div>동영상 : ${empty pofolDTO.p_video? "등록된 동영상이 없습니다.":pofolDTO.p_video }</div>
			<div>링크 : ${pofolDTO.p_link }</div>
		</div>
	</section>
</body>
</html>