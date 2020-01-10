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
<script type="text/javascript">
var bDisplay = true;
function doDisplay(){
	alert('예약을 취소하기 위해선 사유를 입력해 주셔야 합니다');
	var con = document.getElementById("DIV_K");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}

function openwindow(url){
    window.open(url,'','scrollbars=no,width=500,height=500');
    elementId=id;

}
</script>
</head>

<body>
	<header>
		<ul id="top_menu">
			<li id="logo"><a href="index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="#">내주변</a></li>
				<li><a href="#">지역별매장</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
			<li id="login"><a href="#">로그아웃</a></li>
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
			<h3>넘어왔는지 확인용 테스트 문구</h3>
				<c:forEach var="book_sh" items="${book_sh }">
					<div>
						<p>예약시간 : ${book_sh.bo_time}</p>
						<p>디자이너 이름 : ${book_sh.de_name}</p>
						<p>시술 이름 : ${book_sh.bo_service}</p>
						<c:if test="${book_sh.bo_stat == 1 }">
							<p class="test">승인 전 예약입니다.</p>
							<!-- todo승인 update-->
							<form action="bookupdate_shop">
								<input type=submit value="승인"/>
								<!-- TODO -->
								<input type=button onClick="location.href='bookShopRadio.html'" value="승인"/>
								<input type=button onClick="openwindow('bookShopRadio.html')" value='취소하기'/>
								<input type="hidden" name="bo_uid" value="${book_sh.bo_uid }">
								<input type="hidden" name="sh_uid" value="${book_sh.sh_uid }">
								<hr>
							</form>
						</c:if>
						<c:if test="${book_sh.bo_stat == 2 }">
							<p class="test">승인 완료된 예약입니다.</p>
							
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