<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<script type="text/javascript">
	var sessionId = "${sessionScope.m_id}";
	
	function loginCheck() {
		
		if(sessionId == "" || sessionId.length == 0 || sessionId == null) {
			history.go(-1);
		}
	}
	
	function view(pno) {
		location.href = "${pageContext.request.contextPath}/portfolio/" + sessionId + "/view/" + pno;
	}
</script>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section>
		<div>
			정보 / 보유기술
		</div>
		<div>
			<div>
				<div><a href="/portfolio/write">글쓰기</a></div>
				<div>
					<%@ include file="myPofolList-view.jsp" %>
				</div>
			</div>
		</div>
	</section>

</body>
</html>