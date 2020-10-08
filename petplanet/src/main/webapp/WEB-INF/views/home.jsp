<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<%@ include file="include/header.jsp"%>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.carousel-inner>.item>img {
	width: 640px;
	height: 480px;
}
</style>

</head>
<body>
	<div class="container" style="margin-top:30px">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${path}/resources/images/1.png" class="d-block w-100">
				</div>

				<div class="item">
					<img src="${path}/resources/images/2.png" class="d-block w-100">
				</div>

				<div class="item">
					<img src="${path}/resources/images/3.png" class="d-block w-100">
				</div>

				<div class="item">
					<img src="${path}/resources/images/4.png" class="d-block w-100">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="container" style="margin-top:30px">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>유기동물을 조회하고, 잃어버린 애완동물을 등록할 수 있는 사이트입니다. Spring, JSP, MySQL, MyBatis를
					사용했습니다.</p>
			</div>
		</div>
	</div>

	<%@ include file="include/footer.jsp"%>
</body>
</html>