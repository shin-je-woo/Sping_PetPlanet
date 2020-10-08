<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp"%>
<style>
th {
	background-color: #e17055;
	font-size: 18px;
	text-align: center;
}

td {
	font-size: 18px;
}
</style>
<script>
	$(function() {
		$("#btnLogin").click(function() {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			document.form1.action = "${path}/member/login_check";
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<div align="center">
		<div
			style="max-width: 300px; background-color: #ffffff; padding-top: 10px; padding-bottom: 5px; padding-left:20px; padding-right:20px;">
			<form name="form1" method="post">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td><input name="userid" id="userid"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="passwd" id="passwd"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							class="btn btn-primary" id="btnLogin" value="로그인"> <c:if
								test="${param.message == 'nologin' }">
								<div style="color: red;">로그인 하신 후 이용해 주세요</div>
							</c:if> <c:if test="${message == 'error' }">
								<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if></td>
					</tr>
				</table>
			</form>
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="223"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>