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
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>test</title>
<link href="../css/sub.css" rel="stylesheet" type="text/css"/>
<link href="../css/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>Test_PASS</h3>
	<!-- bo_stat처리 필요 DTO로 만드는게 편할듯 -->
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">${book[0].use_id }</h2>
			<div>
			<p>예약시간 : ${book[0]. bo_time}</p>
			<p>디자이너 이름 : ${book[0]. de_name}</p>
			<p>가격 : ${book[0]. ser_price}</p>
			<p>예상 시간 : ${book[0]. ser_time}</p>
			<p>예약 현황 : ${book[0]. bo_stat}</p>
			
			</div>
		
		<div class="inner">
		<!---------------------- Todo ---------------------->
		<!---------------------- Todo ---------------------->
		<!---------------------- Todo ---------------------->
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/public.js" type="text/javascript"></script>
</body>
</html>

</c:otherwise>
</c:choose>














