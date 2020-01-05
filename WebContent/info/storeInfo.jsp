<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty info || fn:length(info) == 0 }">
		<script>
			alert("매장의 정보가 없습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<!------ html 시작 ------>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별매장</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/storeInfo.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
	<ul id="top_menu">
		<li id="logo"><a href="index.jsp">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href=#">내주변</a></li>
			<li><a href="#">지역별매장</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>	
		<li id="login" ><a href="#">로그아웃</a></li>
	</ul>
</header>

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">${info[0].sh_name }</h2>
		
		<!---------------------- content ---------------------->
		<div class="info">	
			<div class="store_pic">
				<img src="http://placehold.it/400x350" />
				<img src="http://placehold.it/400x350" />
				<img src="http://placehold.it/400x350" />
			</div>
			<div class="store_info">
				<h2>${info[0].sh_name }</h2>
				<div id="book_review">
					<a style="border-right:1px solid #eee" href="#">
						<i class="far fa-calendar-check"></i><br>예약
					</a>
					<a href="#"><i class="far fa-comment-dots"></i><br>리뷰</a>
				</div>
				
				<!-- 매장 기본정보 -->
				<div class="information">
					<p>
						<i class="fas fa-phone"></i>${info[0].sh_telephone }<br>
						<i class="fas fa-map-marker-alt"></i>${info[0].sh_location }<br>
						<i class="fas fa-clock"></i>
						${info[0].sh_starttime }:00 - ${info[0].sh_endtime }:00<br>
						${info[0].sh_hello }
					</p>
				</div>	
				
				<!-- 매장 가격정보 -->
				<div class="information">
					<h3>스타일 정보</h3>
					<h4>경과시간은 예상일 뿐이며 매장상황에 따라 달라질 수 있습니다.</h4>
					<ul class="price_info">
						<li>펌<br>30000원<br><span>1시간</span></li>
					</ul>
					<ul class="price_info">
						<li>펌<br>30000원<br><span>1시간</span></li>
					</ul>
				</div>
				
				<!-- 매장 가격정보 -->
				<div class="information">
					<h3>디자이너 정보</h3>
					<ul class="designer">
						<li><img src="http://placehold.it/150x150" /></li>
						<li class="designer_name">이름 디자이너</li>
						<li>경력 5년</li>
						<li>펌 전문</li>
					</ul>
					<ul class="designer">
						<li><img src="http://placehold.it/150x150" /></li>
						<li class="designer_name">이름 디자이너</li>
						<li>경력 5년</li>
						<li>펌 전문</li>
					</ul>
				</div>
			</div>			
		</div>
		
		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>
	</div>
</section>

<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>
	
	</c:otherwise>
</c:choose>









