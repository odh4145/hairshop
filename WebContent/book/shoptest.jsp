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
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="./book.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css" />
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>

<body>

<c:choose>

<c:when test="${sessionScope.shop != null }">

	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
				<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
				<c:choose>
				<c:when test="${sessionScope.shop != null }">
				<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop }">마이페이지</a></li>
				</c:when>
				<c:when test="${sessionScope.shop == null }">
				<li><a href="../info/storeUpdate.bbq?sh_uid=0">마이페이지</a></li>
				</c:when>
				</c:choose>
			</ul>
			<c:if test="${sessionScope.shop == null }">
				<li id="login"><a href="../login/login_shop.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li id="login"><a href="../logout/Shoplogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
			<ul id="mo_menu">
				<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
				<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
				<li><a id="mypage">마이페이지</a></li>
				<ul id="mo_sub">
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.user }">매장정보 변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=0">매장정보 변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장 사진 관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../info/storepicList.bbq?sh_uid=0">매장 사진 관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="">개인정보수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="">개인정보수정</a></li>
					</c:if>				
				</ul>
			<c:if test="${sessionScope.shop == null }">
				<li><a href="../login/login_shop.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li><a href="../logout/Shoplogout.bbq">로그아웃</a></li>
			</c:if>			
			</ul>
	</header>	

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">매장 예약내역</h2>

			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div class="inner">
				<h3>가장 최근 예약 순대로 보입니다</h3>
				<c:forEach var="book_sh" items="${book_sh }">
					<div>
					
						<div id="show_stat1">
							<c:if test="${book_sh.bo_stat == 1 }">
								<p>예약시간 : ${book_sh.bo_time}</p>
								<p>시술 이름 : ${book_sh.bo_service}</p>
								<p class="test">승인 전 예약입니다.</p>
								<form action="bookShopRadio.jsp">
									<input type="hidden" name="bo_uid" value="${book_sh.bo_uid }">
									<input type="hidden" name="sh_uid" value="${book_sh.sh_uid }">
									<input type="submit" value='취소하기'/>
								</form>
								<form action="shopupdate.book.bbq">
									<input type="hidden" name="bo_uid" value="${book_sh.bo_uid }">
									<input type="hidden" name="sh_uid" value="${book_sh.sh_uid }">
									<input type="hidden" name="bo_service" value="${book_sh.bo_service }">
									<input type="hidden" name="bo_time" value="${book_sh.bo_time }">
									<input type="submit" value='승인'/>
								</form>
									<hr>
							</c:if>
						</div>
						
						<div id="show_stat2">
							<c:if test="${book_sh.bo_stat == 2 }">
								<p>예약시간 : ${book_sh.bo_time}</p>
								<p>시술 이름 : ${book_sh.bo_service}</p>
								<p class="test">승인 완료된 예약입니다.</p>
								<hr>
							</c:if>
						</div>
						
						<div id="show_stat3">
							<c:if test="${book_sh.bo_stat == 3 }">
								<p>예약시간 : ${book_sh.bo_time}</p>
								<p>시술 이름 : ${book_sh.bo_service}</p>
								<p class="test">이미 지난 예약입니다.</p>
								<hr>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 화살표버튼 -->
			<div id="go_top">
				<a><i class="fas fa-arrow-circle-up"></i></a>
			</div>
		</div>
		<jsp:include page="pagingbook_shop.jsp">
				<jsp:param value="${writePages }" name="writePages" />
				<jsp:param value="${totalPage }" name="totalPage" />
				<jsp:param value="${page }" name="curPage" />
				<jsp:param value="${sh_uid }" name="sh_uid" />
			</jsp:include>
	</section>
	
</c:when>

<c:when test="${sessionScope.shop == null }">
	<script>
		alert("매장의 정보가 없습니다.")
		location.href = "../login/login_shop.bbq";
	</script>
</c:when>

</c:choose>
	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>