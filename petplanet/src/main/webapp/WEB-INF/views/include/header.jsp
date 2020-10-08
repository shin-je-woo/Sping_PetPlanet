<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width,
    initial-scale=1.0">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script src="${path}/resources/js/header.js" defer></script>
</head>
<body>
	<header>
		<nav id="navbar">
			<div class="navbar_logo">
				<a href="${path}"> <img
					src="${path}/resources/images/animal-rights.png" alt="mainlogo">PetPlanet
				</a>
			</div>

			<ul class="navbar_menu">
				<li><a href="${path}">Home</a></li>
				<li><a href="${path}/abandon/list">실종동물조회</a></li>
				<li><a href="${path}/find/list">찾아주세요</a></li>
				<li><a href="#">TEST</a></li>
			</ul>

			<ul class="navbar_icons">
				<!-- 로그인 세션 처리 -->
				<c:choose>
					<c:when test="${sessionScope.username == null}">
						<li class="nav-item"><a class="nav-link"
							href="${path}/member/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${path}/member/signup">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> ${sessionScope.username} 님 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">회원정보수정</a> <a
									class="dropdown-item" href="${path}/member/logout">로그아웃</a>
							</div></li>
					</c:otherwise>
				</c:choose>
			</ul>

			<a href="#" class="navbar_toggleBtn"> <i class="fas fa-bars"></i>
			</a>

		</nav>
	</header>
	<div style='line-height: 680%'>
		<br>
	</div>
</body>
</html>

