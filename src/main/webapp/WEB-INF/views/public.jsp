<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/common.css"/>
<link type="text/css" rel="stylesheet" href="resources/css/public.css"/>
</head>
<body>
	<div id="wrap">
	<jsp:include page="nav.jsp"/>
	<div id="contents_sub">
		<div>
			<h1 id="head">${cityName } 충전소 목록</h1>
		</div>
    <form>
		   <label for="city">지역 선택</label>
		    <select id="city" onchange="cityChange(this.value)">
		      <option value=11>서울특별시</option>
		      <option value=28>인천광역시</option>
		      <option value=26>부산광역시</option>
		      <option value=27>대구광역시</option>
		      <option value=29>광주광역시</option>
		      <option value=30>대전광역시</option>
		      <option value=31>울산광역시</option>
		      <option value=36>세종특별자치시</option>
		      <option value=41>경기도</option>
		      <option value=42>강원도</option>
		      <option value=43>충청북도</option>
		      <option value=44>충청남도</option>
		      <option value=45>전라북도</option>
		      <option value=46>전라남도</option>
		      <option value=47>경상북도</option>
		      <option value=48>경상남도</option>
		      <option value=50>제주특별자치도</option>
		    </select>
    </form>
	
	<div id="map" style="width:900px;height:500px;margin-top:30px;"></div>
	
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09d394c2e99f99287e0da08c506b0273"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  	<script>
  		
  		
  	function cityChange(city){
  		var cityName = $('#city option:selected').text();
  		location.href="/inter/public?city="+city+"&cityName="+cityName;
  		
  		
  	}
  	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng("${list[0].lat}", "${list[0].lng}"), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	
	var positions =[  
	   <c:forEach var="vo" items="${list }">
	    {
		        content: '<div>${vo.statNm}</div>',
		        latlng: new kakao.maps.LatLng("${vo.lat}", "${vo.lng}")
	   	}, 
	   </c:forEach> 
	];
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
		
	</script>
	<%@ include file="footer.jsp" %>
</body>
</html>