<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>

	<c:when test="${join_user == -1 }">
		<script>
			alert("회원가입 실패!!(아이디 중복)");
			history.back();
		</script>
	</c:when>
	<c:when test="${join_user == 0}">
		<script>
			alert("회원가입 실패!!(휴대폰 번호 중복)");
			history.back();
		</script>
	</c:when>
	<c:when test="${join_user == 1}">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 완료</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">

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
		<li id="login" ><a href="../login/login_user.bbqLoginUser">로그인</a></li>
	</ul>
</header>

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">회원가입 완료</h2>
		<h2>회원가입 완료</h2>
		<a href="../login/login_user.jsp">로그인</a>
		
		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>
	</div>
</section>


<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/public.js" type="text/javascript"></script>
</body>
</html>		
	</c:when>
</c:choose>



