<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PetPlanet-찾습니다</title>
<%@ include file="../include/header.jsp"%>
<style>
.captionBtn {
	caption-side: top;
	text-align: right;
}
th {
	background-color: #e17055;
	font-size: 22px;
	text-align: center;
}

td {
	font-size: 18px;
}
#findList {
	width: 100%;
	text-align: center;
}

#paginationBox {
	display: inline-block;
}
</style>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/find/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/find/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/find/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>

</head>
<body>
	<div align="center" style="margin-top:30px">
		<div id="findList" style="max-width:900px; background-color: #ffffff; padding-top: 10px; padding-bottom: 5px; padding-left:20px; padding-right:20px;">
			<table class="table table-hover">
				<caption class="captionBtn">
					<input type="button" class="btn btn-warning" value="등록하기"
						onclick="location.href='${path}/find/write'">
				</caption>
				<tr align="center">
					<th>동물종류</th>
					<th>사진</th>
					<th>제목</th>
					<th>실종장소</th>
					<th>실종날짜</th>
				</tr>
				<c:forEach var="row" items="${list}">
					<tbody id="items">
						<tr align="center"
							onClick="location.href='http://localhost:8080/${pageContext.request.contextPath}/find/detail/${row.find_id}'"
							style="cursor: pointer;">
							<td style="padding-top: 45px;">${row.animaltype}</td>
							<td><img src="${path}/image/${row.image_url}" width="100px"
								height="100px"></td>
							<td style="padding-top: 45px;">${row.title}</td>
							<td style="padding-top: 45px;">${row.map_address}</td>
							<td style="padding-top: 45px;">${row.lost_date}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

			<!-- pagination{start} -->

			<div id="paginationBox">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
					</c:if>

					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li
							class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
								${idx} </a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next('${pagination.range}', 
'${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
					</c:if>
				</ul>
			</div>
			<!-- pagination{end} -->
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>