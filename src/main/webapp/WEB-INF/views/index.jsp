<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS파일 연결! -->
<link type="text/css" rel="stylesheet" href="resources/css/common.css"/>
<link type="text/css" rel="stylesheet" href="resources/css/index.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단영역 -->
	<jsp:include page="nav.jsp"/>
	<!-- -------- -->
	<!-- 콘텐츠영역 -->
	<div id="contents_sub">
		<div class="main_img">
		<!-- img태그에서 title은 설명을 보여주는 역활, alt는
		 스크린리더기에서 읽혀지고 또는 이미지 손실시 대신 출력되는 문장! -->
			<a href="">
				<img src="resources/img/@img00.png" title="서울안전체험 한마당봉사" 
					alt="서울안전체험 한마당봉사"/>
			</a>
		</div>
		<div class="main_news">
			<div class="news_type01 fl">
				<p class="title">공공데이터 설명</p>
				<p class="news_src">
					<a href="" class="thum_img">
						<img src="resources/img/@img01.png" alt="기사사진"/>
					</a>
					<span class="ellip subject">
						공공데이터란 무엇이고 어떻게 활용할까>
					</span>
					<span class="writer">by increpas</span>
					<span class="more_view">자세히보기</span>
					<span class="fclear"></span>
				</p>
			</div>
			<!-- ----------------------------------------------------- -->
			<div class="news_type01 cen">
				<p class="title">공공데이터 구조</p>
				<p class="news_src">
					<a href="" class="thum_img">
						<img src="resources/img/@img02.png" alt="기사사진"/>
					</a>
					<span class="ellip subject">
						공공데이터의 구조란?
					</span>
					<span class="writer">by data.org</span>
					<span class="more_view">자세히보기</span>
					<span class="fclear"></span>
				</p>
			</div>
			<!-- ----------------------------------------------------- -->
			<div class="news_type01 fr">
				<p class="title">기브유 나눔영상</p>
				<p class="news_src">
					<span class="thum_img">
						<img src="resources/img/@img03.png" alt="기사사진"/>
						<span class="btn_play" title="동영상 재생">
							<a href=""></a>
						</span>							
					</span>
					<span class="ellip subject">
						공공데이터 활용 TOP 10
					</span>
					<span class="writer">by increpas</span>
					<span class="more_view">자세히보기</span>
					<span class="fclear"></span>
				</p>
			</div>
		</div>
		<div class="main_board">
			<!-- 공지사항 -->
			<div class="board_type01 fl">
				<p class="title">공지사항</p>
				<span class="more_view"><a href="bbs/list?bname=NOTICES">더보기</a></span>
				<ul class="notice">
				<c:forEach var="vo" items="${n_list}">
					<li>
						<a href="bbs/list">${vo.subject }</a>
						<span class="date">${fn:replace(vo.write_date,"-",".") }</span>
					</li>
				</c:forEach>
					
				</ul>
			</div>
			<!-- 공지사항 끝 -->
			
			<!-- together트위터 -->
			<div class="board_type01 cen">
				<p class="title">T-Together트위터</p>
				<span class="more_view"><a href="bbs/list?bname=TWIT">더보기</a></span>
				<c:forEach var="vo" items="${t_list }">
					<a href="bbs/twit" class="article">
						<div class="thum_img">
							<img src="resources/bbs_upload/${vo.file_name }" alt="캠페인이미지" 
							style="width:100%; height: 100%"/>
						</div>
						<span class="src">
							${vo.subject }
						</span>
						<span class="fclear"></span>
					</a>
				</c:forEach>
			</div>
			<!-- together트위터 끝 -->
			
			<!-- 배너 -->
			<div class="board_type01 fr">
				<span class="banner b01">
					<a href="">
						T-Together와 함께할 기관/단체를 모십니다.
					</a>
				</span>
				<span class="banner b02">
					<a href="">
						T-Together  이젠 모바일로 함께해요.
					</a>
				</span>
			</div>
			<!-- 배너 끝 -->
		</div>
	</div>
	<!-- ---------- -->
	<!-- 하단영역 -->
	<%@ include file="footer.jsp" %>
	<!-- -------- -->
</div>
</body>
</html>