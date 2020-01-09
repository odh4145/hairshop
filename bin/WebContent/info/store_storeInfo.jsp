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
<link href="../css/sub.css" rel="stylesheet" type="text/css">

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
		<h2 id="content_title">매장정보</h2>
		
		<!-- 세부메뉴 -->
		<div class="submenu inner">
			<h4 class="selected"><a>매장정보</a></h4>
			<h4><a>디자이너관리</a></h4>
			<h4><a>개인정보수정</a></h4>
		</div>	
		
		<!---------------------- content ---------------------->
		<div class="inner info">	
			<div class="store_pic">
			</div>
			<div class="store_info">
				<h2><input>${info[0].sh_name }</h2><br>
				<p>
					${info[0].sh_uid }<br>
					${info[0].sh_name }<br>
					${info[0].sh_telephone }<br>
					${info[0].sh_picture1 }<br>
					${info[0].sh_dayoff1 }<br>
					${info[0].sh_starttime }<br>
					${info[0].sh_endtime }
				</p>
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









