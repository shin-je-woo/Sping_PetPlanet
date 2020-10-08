<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp"%>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<div align="center">
		<h3>회원가입 완료</h3>
		<p>
			환영합니다! <strong>${param.userid}</strong> 님
		</p>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<p></p>
		<br> <a href="${path}/member/login/">로그인 페이지로 이동하기</a>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>