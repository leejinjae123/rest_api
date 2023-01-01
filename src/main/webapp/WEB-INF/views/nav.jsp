<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id="header">
	<a href="/inter"><h1>SK Together</h1></a>
	<ul class="gnb">
		<li><a href=""><span class="menu m01">공공데이터</span></a></li>
		<li><a href=""><span class="menu m02"> 설명 </span></a></li>
		<li><a href=""><span class="menu m03">활용예제</span></a></li>
		<li><a href="bravo/sub1"><span class="menu m04">BRAVO!</span></a></li>
		<li><a href="public"><span class="menu m05">충전소 위치</span></a></li>
		<c:if test="${mvo eq null }">
		<li><a href="login"><span class="menu m04">LOGIN</span></a></li>
		</c:if>
		<c:if test="${mvo ne null }">
		<li><a href="logout"><span class="menu m04">LOGOUT</span></a></li>
		</c:if>
	</ul>
</div>