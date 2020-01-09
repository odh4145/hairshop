<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별매장</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/chooseArea.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
	<ul id="top_menu">
		<li id="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href="#">내주변</a></li>
			<li><a href="#">지역별매장</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>	
		<c:if test="${sessionScope.user == null }">
			<li id="login" ><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
			<li id="login" ><a href="../logout/Userlogout.bbq">로그아웃</a></li>
		</c:if>
	</ul>
</header>

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">지역별매장</h2>
		<div class="innerbox">
			<div class="choose">
				<a class="where" href="#">서울특별시</a>
				<a class="where" href="#">광주광역시</a>
				<a class="where" href="#">대구광역시</a>
				<a class="where" href="#">대전광역시</a>
				<a class="where" href="#">부산광역시</a>
				<a class="where" href="#">울산광역시</a>
				<a class="where" href="#">인천광역시</a>
			</div>
			<hr id="line">
			<div class="choose">
				<a class="where" href="#">강원도</a>
				<a class="where" href="#">경기도</a>
				<a class="where" href="#">경상남도</a>
				<a class="where" href="#">경상북도</a>
				<a class="where" href="#">전라남도</a>
				<a class="where" href="#">전라북도</a>
				<a class="where" href="#">충청남도</a>
				<a class="where" href="#">충청북도</a>
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