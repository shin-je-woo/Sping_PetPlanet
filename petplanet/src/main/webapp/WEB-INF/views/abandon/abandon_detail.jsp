<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetPlanet</title>
<%@ include file="../include/header.jsp"%>
<style>
th {
	background-color: #e17055;
	font-size: 20px;
	text-align: left;
}

td {
	font-size: 18px;
}
</style>
</head>

<body>
	<div align="center">
		<div class="container" align="center">
			<table class="table table-bodered">
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">동물종류</th>
						<td>${vo.animaltype}</td>
						<th scope="row">성별</th>
						<td>${vo.gender}</td>
					</tr>
					<tr>
						<th scope="row">구조일</th>
						<td>${vo.phone}</td>
						<th scope="row">구조장소</th>
						<td>${vo.lost_date}</td>
					</tr>
					<tr>
						<th scope="row">색상</th>
						<td>${vo.phone}</td>
						<th scope="row">나이</th>
						<td>${vo.lost_date}</td>
					</tr>
					<tr>
						<th scope="row">특징</th>
						<td colspan="3">${vo.title}</td>
				</tbody>
			</table>
			
			<table class="table table-bodered">
			<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">공고번호</th>
						<td>${vo.animaltype}</td>
					</tr>
					
					<tr>
						<th scope="row">공고기간</th>
						<td>${vo.animaltype}</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-bodered">
			<colgroup>
					<col width="5%" />
					<col width="25%" />
					<col width="5%" />
					<col width="25%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">주소</th>
						<td>${vo.animaltype}</td>
					</tr>
					
					<tr>
						<th scope="row">담당자</th>
						<td>${vo.phone}</td>
						<th scope="row">연락처</th>
						<td>${vo.lost_date}</td>
					</tr>
					<tr>
						<th scope="row">보호소명</th>
						<td>${vo.phone}</td>
						<th scope="row">보호소연락처</th>
						<td>${vo.lost_date}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>