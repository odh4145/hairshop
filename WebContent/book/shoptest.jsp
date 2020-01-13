<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% session.getAttribute("shop"); %>
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
				<li><a href="#">후기</a></li>
				<li><a href="../book/shoptest.bbq">예약내역</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
			<c:if test="${sessionScope.shop == null }">
				<li id="login"><a href="../login/login_shop.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li id="login"><a href="../logout/Shoplogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
	</header>

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">마이페이지 예약내역</h2>

			<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
			<div class="submenu inner">
				<h4 class="selected">
					<a>예약내역</a>
				</h4>
				<h4>
					<a>내가 쓴 글</a>
				</h4>
				<h4>
					<a>개인정보수정</a>
				</h4>
			</div>

			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div class="inner">
				<c:forEach var="book_sh" items="${book_sh }">
					<div>
						<p>예약시간 : ${book_sh.bo_time}</p>
						<p>시술 이름 : ${book_sh.bo_service}</p>
						<c:if test="${book_sh.bo_stat == 1 }">
							<p class="test">승인 전 예약입니다.</p>
							<form action="bookShopRadio.jsp">
								<input type="hidden" name="bo_uid" value="${book_sh.bo_uid }">
								<input type="hidden" name="sh_uid" value="${book_sh.sh_uid }">
								<input type="submit" value='취소하기'/>
							</form>
							<form action="shopupdate.book.bbq">
								<input type="hidden" name="bo_uid" value="${book_sh.bo_uid }">
								<input type="hidden" name="sh_uid" value="${book_sh.sh_uid }">
								<input type="submit" value='승인'/>
							</form>
								<hr>
						</c:if>
						<c:if test="${book_sh.bo_stat == 2 }">
							<p class="test">승인 완료된 예약입니다.</p>
							<hr>
						</c:if>
						<c:if test="${book_sh.bo_stat == 3 }">
							<p class="test">이미 지난 예약입니다.</p>
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

	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>