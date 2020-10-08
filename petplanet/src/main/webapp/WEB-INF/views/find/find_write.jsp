<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c179083bd2f40f76d5588d7486313749&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c179083bd2f40f76d5588d7486313749"></script>
<title>PetPlanet</title>
<%@ include file="../include/header.jsp"%>
<style>
th {
	background-color: #eeeeee;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
</head>
<body>

	<div class="container" align="center" style="background-color:#ffffff; padding-top:30px; padding-bottom:5px">
		<form name="form1" id="form1" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th align="left">제목</th>
					<td align="left"><input name="title" id="title"></td>
				</tr>
				<tr>
					<th align="left">동물종류</th>
					<td align="left"><input name="animaltype" id="animaltype"></td>
				</tr>
				<tr>
					<!-- <td align="left">동물성별</td>
					<td align="left"><input name="gender" id="gender"></td>
					-->
					<th align="left">성별</th>
					<td align="left"><input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여</td>
				</tr>
				<tr>
					<th align="left">연락처</th>
					<td align="left"><input name="phone" id="phone"></td>
				</tr>
				<tr>
					<th align="left">실종날짜</th>
					<td align="left"><input name="lost_date" id="lost_date">※기입
						예:2019-02-03</td>
				</tr>
				<tr>
					<th align="left">상세설명</th>
					<td align="left"><textarea rows="5" cols="60"
							name="lost_description" id="lost_description"></textarea></td>
				</tr>
				<tr>
					<th align="left">이미지</th>
					<td align="left"><input type="file" name="image" id="image"></td>
				</tr>
				<tr>
					<th align="left">실종장소</th>
					<td align="left"><input type="text" id="sample5_address"
						placeholder="주소"> <input type="button"
						onclick="sample5_execDaumPostcode()" value="주소 검색"> <br>
						<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							<div class="hAddr">
								<span class="title">행정동 주소정보</span> <span id="centerAddr"></span>
							</div>
						</div>

						<p>
							<em>지도를 클릭해주세요!</em>
						</p>
						<div>
							<script type="text/javascript">
								var latlng;
								var address;
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								var map = new kakao.maps.Map(mapContainer,
										mapOption); // 지도를 생성합니다

								//주소-좌표 변환 객체를 생성
								var geocoder = new daum.maps.services.Geocoder();

								// 지도를 클릭한 위치에 표출할 마커입니다
								var marker = new kakao.maps.Marker({
									// 지도 중심좌표에 마커를 생성합니다 
									position : map.getCenter()
								});
								// 지도에 마커를 표시합니다
								marker.setMap(map);

								// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
								searchAddrFromCoords(map.getCenter(),
										displayCenterInfo);

								// 지도에 클릭 이벤트를 등록합니다
								// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
								kakao.maps.event
										.addListener(
												map,
												'click',
												function(mouseEvent) {
													searchDetailAddrFromCoords(
															mouseEvent.latLng,
															function(result,
																	status) {
																if (status === kakao.maps.services.Status.OK) {
																	// 클릭한 위도, 경도 정보를 가져옵니다 
																	latlng = mouseEvent.latLng;
																	// 마커 위치를 클릭한 위치로 옮깁니다
																	marker
																			.setPosition(latlng);
																	// 클릭한 위치로 행정동 주소정보를 바꾼다
																	searchAddrFromCoords(
																			latlng,
																			displayCenterInfo);
																}
															});
												});
								function find_write() {
									var title = $("#title").val();
									var animaltype = $("#animaltype").val();
									var genders = document
											.getElementsByName('gender');
									var gender_value; // 라디오버튼 담을 변수
									for (var i = 0; i < genders.length; i++) {
										if (genders[i].checked) {
											gender_value = genders[i].value;
										}
									}			
									var phone = $("#phone").val();
									var lost_date = $("#lost_date").val();
									var lost_description = $(
											"#lost_description").val();
									var image = document.getElementById("image").value;
									if (title == "") { //빈값이면
										alert("제목을 입력하세요");
										$("#title").focus(); //입력포커스 이동
										return;
									}
									if (animaltype == "") {
										alert("동물종류를 입력하세요");
										$("#animaltype").focus();
										return;
									}
									if (gender_value === undefined) {
										alert("성별을 입력하세요");
										document.getElementsByName("gender")[0].focus();
										return;
									}
									if (phone == "") {
										alert("연락처를 입력하세요");
										$("#phone").focus();
										return;
									}

									if (lost_date == "") {
										alert("실종 날짜를 입력하세요");
										$("#lost_date").focus();
										return;
									}
									if (lost_description == "") {
										alert("상세 설명을 입력하세요");
										$("#lost_description").focus();
										return;
									}
									if (image == "") {
										alert("사진을 첨부해주세요");
										$("#image").focus();
										return;
									}
									if (latlng === undefined){
										alert("실종장소를 등록해주세요");
										document.getElementsById("sample5_address").focus();
										return;
										}
								}
								function save_write() {
									find_write();							
									var formData = new FormData(document
											.getElementById('form1'));
									formData.append("lat", JSON
											.stringify(latlng.getLat()));
									formData.append("lng", JSON
											.stringify(latlng.getLng()));
									formData.append("address", address);
									$.ajax({
										type : "POST",
										enctype : 'multipart/form-data',
										url : "<c:url value="/find/insert" />",
										data : formData,
										dataType : 'json',
										processData : false,
										contentType : false,
										type : 'POST',
										success : function(response) {
											if(response){
												alert("등록 완료!");
												location.replace("${pageContext.request.contextPath}/find/list");												
											}
									    },
									    err : function(err) {
									        alert(err.status);
									    }
									});
								}
								// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
								kakao.maps.event.addListener(map, 'idle',
										function() {
											searchAddrFromCoords(map
													.getCenter(),
													displayCenterInfo);
										});

								function searchAddrFromCoords(coords, callback) {
									// 좌표로 행정동 주소 정보를 요청합니다
									geocoder.coord2RegionCode(coords.getLng(),
											coords.getLat(), callback);
								}

								function searchDetailAddrFromCoords(coords,
										callback) {
									// 좌표로 법정동 상세 주소 정보를 요청합니다
									geocoder.coord2Address(coords.getLng(),
											coords.getLat(), callback);
								}

								// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
								function displayCenterInfo(result, status) {
									if (status === kakao.maps.services.Status.OK) {
										var infoDiv = document
												.getElementById('centerAddr');

										for (var i = 0; i < result.length; i++) {
											// 행정동의 region_type 값은 'H' 이므로
											if (result[i].region_type === 'H') {
												infoDiv.innerHTML = result[i].address_name;
												address = result[i].address_name;
												break;
											}
										}
									}
								}

								// 주소검색을 하면 지도에 위치 표시
								function sample5_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													var addr = data.address; // 최종 주소 변수

													// 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById("sample5_address").value = addr;
													// 주소로 상세 정보를 검색
													geocoder
															.addressSearch(
																	data.address,
																	function(
																			results,
																			status) {
																		// 정상적으로 검색이 완료됐으면
																		if (status === daum.maps.services.Status.OK) {

																			var result = results[0]; //첫번째 결과의 값을 활용

																			// 해당 주소에 대한 좌표를 받아서
																			var coords = new daum.maps.LatLng(
																					result.y,
																					result.x);
																			// 지도를 보여준다.
																			mapContainer.style.display = "block";
																			map
																					.relayout();
																			// 지도 중심을 변경한다.
																			map
																					.setCenter(coords);
																			// 마커를 결과값으로 받은 위치로 옮긴다.
																			marker
																					.setPosition(coords)
																		}
																	});
												}
											}).open();
								}
							</script>
						</div>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-primary" onclick="save_write()"
							type="button">등록하기</button> <input type="button"
						class="btn btn-primary" value="목록으로"
						onclick="location.href='${path}/find/list'"></td>
				</tr>
			</table>
		</form>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>