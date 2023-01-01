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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bbs.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단영역 -->
	<jsp:include page="../nav.jsp"/>
	<!-- -------- -->
	<!-- 콘텐츠영역 -->
	<div id="contents_sub">
		
		<div id="bbs">
			<header>
				<h2>
					<c:choose>
						<c:when test="${param.bname == 'NOTICES' }">공지사항</c:when>
						<c:when test="${param.bname == 'TWIT' }">트위터</c:when>
					</c:choose>
				</h2>
			</header>
			<table summary="게시판 목록">
				<caption>게시판 목록</caption>
				<thead>
					<tr class="title">
						<th class="no">번호</th>
						<th class="subject">제목</th>
						<th class="writer">글쓴이</th>
						<th class="reg">날짜</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
				<tfoot>
	                      <tr>
	                          <td colspan="4">
	                              ${pageCode }
	                          </td>
							  <td>
								<input type="button" value="글쓰기"
				onclick="javascript:location.href='write?cPage=${nowPage}&bname=BBS'"/>
							  </td>
	                      </tr>
	                  </tfoot>			
				
				<tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st">		
					<tr>
						<td>
							<%-- 순차적인 번호를 만들어서 표현하자 --%>
							${totalCount -((nowPage-1)*numPerPage + st.index) }
						</td>
						<td style="text-align: left">
						
							<a href="view?cPage=${nowPage }&b_idx=${vo.b_idx}">
								${vo.subject}
							<c:if test="${fn:length(vo.c_list) > 0 }">
									(${fn:length(vo.c_list)})
							</c:if>
							</a>
						</td>
						<td>${vo.writer}</td>
						<td>${vo.write_date}</td>
						<td>${vo.hit}</td>
					</tr>
				</c:forEach>
				</tbody>
				
				
			</table>
			
		</div>
		
		
	</div>
	<!-- ---------- -->
	<!-- 하단영역 -->
	<%@ include file="../footer.jsp" %>
	<!-- -------- -->
</div>
</body>
</html>