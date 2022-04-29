<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<script type="text/javascript">
	function view(pno) {
		location.href = "${pageContext.request.contextPath}/portfolio/userPofol/view/" + pno;
	}
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/custom/css/custom_main.css">
<style>
	.main-head {
		height: 150px !important; 
	}

	@media (min-width: 768px) {
		.main-head {
			height: 380px !important;
		}
	}
</style>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
</head>
<body>
	<section class="container-fluid">
		<div class="row main-head">
			<div class="search-box align-self-center">
				<div class="has-search">
					<form action="<c:url value='/portfolio/userPofolList'/>">
						<span class="fa fa-search form-control-feedback"></span>
			   			<input type="text" class="form-control" name="word" placeholder="Search">
					</form>
		  		</div>
		  	</div>
		 </div>
		<%@ include file="portfolio/mainBoard-view.jsp" %>
	</section>
</body>
</html>