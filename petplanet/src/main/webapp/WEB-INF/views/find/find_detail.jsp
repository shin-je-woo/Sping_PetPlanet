<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PetPlanet</title>
<%@ include file="../include/header.jsp"%>
<style>
th {
	background-color: #e17055;
	font-size: 22px;
	text-align: center;
}

td {
	font-size: 18px;
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
	<div align="center">
		<div class="container" align="center"
			style="max-width: 900px; background-color: #ffffff; padding-top: 10px; padding-bottom: 5px; padding-left: 20px; padding-right: 20px;">
			<table class="table table-bodered">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">동물종류</th>
						<td>${vo.animaltype}</td>
						<th scope="row">성별</th>
						<td>${vo.gender}</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td>${vo.phone}</td>
						<th scope="row">실종날짜</th>
						<td>${vo.lost_date}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${vo.title}</td>
					<tr>
						<th colspan="4" align="center">상세설명</th>
					</tr>
					<tr>
						<td align="left"><img src="${path}/image/${vo.image_url}"
							width="300px" height="300px"></td>
						<td align="left">${vo.lost_description}</td>
					</tr>
					<tr>
						<th colspan="4" align="center">실종장소</th>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<div class="map_wrap">
								<div id="map"
									style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
								<div class="hAddr">
									<span class="title">지도중심기준 행정동 주소정보</span> <span
										id="centerAddr"></span>
								</div>
							</div> <script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c179083bd2f40f76d5588d7486313749&libraries=services"></script>
							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(${lat},
											${lng}), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								}

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer,
										mapOption);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();

								var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
								infowindow = new kakao.maps.InfoWindow({
									zindex : 1
								}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

								// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
								searchAddrFromCoords(map.getCenter(),
										displayCenterInfo);

								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(${lat},
										${lng}); 

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});

								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
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
												break;
											}
										}
									}
								}
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="1"><input type="button"
							class="btn btn-warning" value="수정"
							onclick="location.href='${path}/find/list'"></td>
						<td colspan="1"><input type="button"
							class="btn btn-primary" value="목록으로 돌아가기"
							onclick="location.href='${path}/find/list'"></td>
						<td colspan="1"><input type="button"
							class="btn btn-danger" value="삭제"
							onclick="location.href='${path}/find/list'"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>