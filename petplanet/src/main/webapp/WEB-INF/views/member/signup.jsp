<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
tr {
	text-align:center;
}
th {
	background-color: #e17055;
	font-size: 22px;
	text-align: center;
}

td {
	font-size: 18px;
}
</style>
</head>
<body>
	<div align="center">
		<form name=form1 method="post" action="${path}/member/signup">
			<div style="max-width: 400px; background-color: #ffffff; padding-top: 10px; padding-bottom: 5px; padding-left:20px; padding-right:20px;">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td><input name="userid"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="passwd"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input name="username"></td>
					</tr>
					<tr>
					<tr>
						<th>닉네임</th>
						<td><input name="nickname"></td>
					</tr>
					<tr>
						<th>이메일(인증필요)</th>
						<td><input name="email"></td>
					</tr>
					<tr>
					<td colspan="2" align="center"><input type="submit" class="btn btn-primary" value="가입">
					</td>
				</table>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>