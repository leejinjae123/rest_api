<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS파일 연결! -->
<link type="text/css" rel="stylesheet" href="../resources/css/common.css"/>
<link type="text/css" rel="stylesheet" href="../resources/css/sub_tab.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단영역 -->
	<jsp:include page="../nav.jsp"/>
	<!-- -------- -->
	<!-- 콘텐츠영역 -->
	<div id="contents_sub">
		<p>
			<img src="../resources/img/@img05.png" alt="위드유봉사"/>
		</p>
		<div class="tab_type01">
			<ul>
				<li id="t1"><a href="javascript:ex1(1)">위드유</a></li>
				<li id="t2" class="selected"><a href="javascript:ex1(2)">위드유 영상</a></li>
				<li id="t3"><a href="javascript:ex1(3)">위드유 현황</a></li>
			</ul>
		</div>
		<!-- 탭이 선택될 때 보여질 내용들(이중 1개만 보여준다.) -->
		<div id="tab1" class="tab_cont">
			첫번째 Tab!
		</div>
		<div id="tab2" class="tab_cont show">
			위르겐 클롭 리버풀 감독이 8월31일(현지시각) 안필드에서 열린 뉴캐슬<br/> 
			유나이티드와의 2022~2023 잉글랜드 프리미어리그(EPL) 홈 5라운드에서<br/> 
			2-1로 극적인 역전승을 거둔 뒤 한 말이다.<br/><br/>

			리버풀은 이날 전반 38분 알렉산더 이삭에게 골을 내주며 끌려갔다.<br/> 
			이후 후반 16분 호베르투 피르미누의 골로 1-1 동점을 만들었다.<br/> 
			승부는 그렇게 끝나는 듯 싶었다.<br/><br/>
			
			하지만 후반 추가시간 8분 코너킥 뒤 혼전 상황에서 모하메드 살라의 <br/> 
			도움으로 파비오 카르발류가 문전 왼쪽에서 오른발슛으로 골문을 가르며 <br/> 
			승리할 수 있었다. 후반 26분 트렌트 알렉산더 아놀드와 교체 투입된 카르발류였다.<br/><br/> 
			 
			클롭 감독은 이날 루이스 디아스-호베르투 피르미누-모하메드 살라를 공격 최전방, <br/> 
			조던 헨더슨-파비뉴-하비 엘리엇을 중원에 포진시키는 등 4-3-3 전술로 나섰다. <br/> 
			공점유율 72%로 경기를 지배했고, 슈팅수도 23-5(유효 6-2)로 우위를 보였지만 <br/> 
			골이 잘 안터져 힘든 경기를 펼쳐야 했다.<br/> <br/> 

			시즌 초반 2무1패를 기록하는 부진했던 리버풀은 2승2무1패(승점 8)로 <br/> 
			리그 5위에 자리했다. 지난달 27일 본머스와의 4라운드 홈경기에서는 9-0 대승을<br/> 
			 거둔 바 있다. kkm100@sportsseoul.com
		</div>
		<div id="tab3" class="tab_cont">
			세번째 Tab입니다.
		</div>
	</div>
	<!-- ---------- -->
	<!-- 하단영역 -->
	<jsp:include page="../footer.jsp"/>
	<!-- -------- -->
</div>

<script>
	//자바스크립트는 자료형을 지정하지 않는다.
	function ex1(n){
		
		// 모든 탭의 class를 지운다. 우선 현재문서(document) 안에서 
		// 아이디가 t1, t1, t3인 요소들을 모두 검색해야 함!
		var t1 = document.getElementById("t1");
		var t2 = document.getElementById("t2");
		var t3 = document.getElementById("t3");
		
		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var tab3 = document.getElementById("tab3");
		
		//지정된 class 삭제하기
		t1.className = "";
		t2.className = "";
		t3.className = "";
		
		tab1.className = "tab_cont";
		tab2.className = "tab_cont";
		tab3.className = "tab_cont";
		
		//인자인 n의 값에 따라 class를 selected로 지정한다.
		switch(n){
			case 1:
				t1.className = "selected";
				tab1.className = "tab_cont show";
				break;
			case 2:
				t2.className = "selected";
				tab2.className = "tab_cont show";
				break;
			case 3:
				t3.className = "selected";
				tab3.className = "tab_cont show";
				break;
		}
		
	}
	
</script>
</body>
</html>










    