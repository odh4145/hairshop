<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약내역</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<!-- 마이페이지 아닌분들은 sub.css 지우세요 -->
<link href="../css/sub.css" rel="stylesheet" type="text/css">

</head>

<body>


	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../location/Location2.bbq">내주변</a></li>
			<li><a href="../location/chooseArea.bbq">지역별매장</a></li>
				<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">마이페이지</a></li>
			</ul>
			<c:if test="${sessionScope.user == null }">
				<li id="login"><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<li id="login"><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
	</header>

	<c:choose>
	
	<c:when test="${sessionScope.user != null }">

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">마이페이지 예약내역</h2>

			<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
			<div class="submenu inner">
				<h4 class="selected">
					<a href="../book/user.bbq?use_uid=${sessionScope.user }">예약내역</a>
				</h4>
				<h4>
					<a href="../jm/list.bbq?use_uid=${sessionScope.user }">내가 쓴 글</a>
				</h4>
				<h4>
					<a href="../changeinfo/changeUserInfo.bbq?use_uid=${sessionScope.user }">개인정보수정</a>
				</h4>
			</div>

			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div class="inner">
				<c:forEach var="book" items="${book }">
					<div>
						<p>예약시간 : ${book.bo_time}</p>
						<p>매장이름 : ${book.sh_name}</p>
						<p>위치 : ${book.sh_location}</p>
						<p>매장번호 : ${book.sh_telephone}</p>
						<c:if test="${book.bo_stat == 1 }">
							<p class="test">승인 전 예약입니다.</p>
							<form action="delete.book.bbq">
								<input type="hidden" name="bo_uid" value="${book.bo_uid }">
								<input type="hidden" name="use_uid" value="${book.use_uid }">
								<button onclick="location.href = 'delete.book.bbq'">취소하기</button>
							</form>
							<hr>
						</c:if>
						
						<c:if test="${book.bo_stat == 2 }">
							<p class="test">승인 완료된 예약입니다.</p>
							<hr>
						</c:if>
						
						<c:if test="${book.bo_stat == 3 }">
							<p class="test">지난 예약입니다.</p>
							<button><a href="../jm/write.bbq?sh_uid=${book.sh_uid}">후기 남기러 가기</a></button>
							<hr>
						</c:if>
					</div>
				</c:forEach>
			</div>

			<!-- 화살표버튼 -->
			<div id="go_top">
				<a><i class="fas fa-arrow-circle-up"></i></a>
			</div>
		</div>
	</section>
	
	</c:when>
	
	
<c:when test="${sessionScope.user == null }">
	<script>
		alert("로그인 해야함")
		location.href = "../login/login_user.bbq";
	</script>
</c:when>
	
	</c:choose>

	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>