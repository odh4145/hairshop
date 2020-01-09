<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
<link href="../css/calendar.css" rel="stylesheet" type="text/css">
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
			<li id="login"><a href="#">로그아웃</a></li>
		</ul>
	</header>

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title"></h2>

			<!---------------------- content ---------------------->
			<div id="booking">
				<div class='wrap'>
					<div class='btn-holder'>
						<i id='btnPrev' class="fas fa-chevron-left"></i>
						<span id='currentDate'></span>
						<i id='btnNext' class="fas fa-chevron-right"></i>
					</div>
					<div id="calendar"></div>
				</div>
				<!--  
				<div class="time">
					<ul>
						<li>10:00</li>
						<li>11:00</li>
						<li>12:00</li>
						<li>13:00</li>
						<li>14:00</li>
						<li>15:00</li>
						<li>16:00</li>
						<li>17:00</li>
						<li>18:00</li>
						<li>19:00</li>
						<li>20:00</li>
					</ul>
					<button type="submit" id="choose_d">디자이너 선택하기</button>
				</div>
				-->
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
	<script src="../js/calendar.js" type="text/javascript"></script>
</body>
</html>










