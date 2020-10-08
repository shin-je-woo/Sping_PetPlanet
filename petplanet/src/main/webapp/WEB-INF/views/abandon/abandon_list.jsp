<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cards Gallery</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="${path}/resources/css/cards-gallery.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.container {
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
		var url = "${pageContext.request.contextPath}/abandon/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/abandon/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/abandon/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>

</head>
<body>

	<section class="gallery-block cards-gallery">
		<div class="container">
			<div class="row">
				<c:forEach var="list" items="${list}">
					<div class="col-md-6 col-lg-4">
						<div class="card border-0 transform-on-hover">
							<a class="lightbox" href="${list.popfile}"> <img
								src="${list.popfile}" alt="Card Image" class="card-img-top"
								width="350px" height="234px">
							</a>
							<div class="card-body">
								<div class="flex-container">
									<div><span class="label label-default">공고번호</span></div>
									<div><p class="text-muted card-text">${list.noticeNo}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-default">공고기간</span></div>
									<div><p class="text-muted card-text">${list.noticeSdt} ~ ${list.noticeEdt}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-warning">발견장소</span></div>
									<div><p class="text-muted card-text">${list.happenPlace}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-warning">발견날짜</span></div>
									<div><p class="text-muted card-text">${list.happenDt}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-success">품종</span></div>
									<div><p class="text-muted card-text">${list.kindCd}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-success">성별</span></div>
									<div><p class="text-muted card-text">${list.sexCd}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-success">나이</span></div>
									<div><p class="text-muted card-text">${list.age}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-success">체중</span></div>
									<div><p class="text-muted card-text">${list.weight}</p></div>
								</div>
								
								<div class="flex-container">
									<div><span class="label label-info">특징</span></div>
									<div><p class="text-muted card-text">${list.specialMark}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-info">상태</span></div>
									<div><p class="text-muted card-text">${list.processState}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-primary">보호소</span></div>
									<div><p class="text-muted card-text">${list.careNm}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-primary">보호장소</span></div>
									<div><p class="text-muted card-text">${list.careAddr}</p></div>
								</div>
								<div class="flex-container">
									<div><span class="label label-primary">연락처</span></div>
									<div><p class="text-muted card-text">${list.careTel}</p></div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


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
	</section>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
	<script>
        baguetteBox.run('.cards-gallery', { animation: 'slideIn'});
    </script>
</body>
</html>