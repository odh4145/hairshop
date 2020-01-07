<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
<c:when test="${empty book || fn:length(book) == 0 }">
	<script>
		alert("기존 예약이 존재하지 않습니다")
		history.back();
	</script>
</c:when>
<c:otherwise>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>test</title>
<link href="../css/sub.css" rel="stylesheet" type="text/css"/>
<link href="../css/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>Test_PASS</h3>
	<!-- 날짜, 시간 따로 나눠서 넘겨와야 함. 종료시간도 만들어서 넘겨주는게 좋을거 같다. -->
	
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">유저 아이디 와야 할 곳</h2>
		<c:forEach var="book" items = "${book }">
			<div>
			<p>예약시간 : ${book. bo_time}</p>
			<p>디자이너 이름 : ${book. de_name}</p>
			<p>가격 : ${book. ser_price}</p>
			<p>예상 시간 : ${book. ser_time}</p>
			<p class="test">예약 현황 : ${book. bo_stat}</p>
			</div>
			<hr>
		</c:forEach>
		
		<div class="inner">
	
		</div>
	</div>
<script type="text/javascript">
$(function(){
		$("p.test").html("test");
});</script>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</body>
</html>

</c:otherwise>
</c:choose>














