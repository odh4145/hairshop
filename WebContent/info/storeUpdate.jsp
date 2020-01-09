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
<link href="../css/storeupdate.css" rel="stylesheet" type="text/css">
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
				<img src="${info[0].sh_picture1 }" />
				<img src="${info[0].sh_picture2 }" />
				<img src="${info[0].sh_picture3 }" />
			</div>
			<div class="store_info">
				<form name="frm" action="designerOk.bbq" method="post" onsubmit="return chkSubmit(this)">
				
					<h2>${info[0].sh_name }</h2>
				<!-- 매장 기본정보 -->					
					<ul class="information">
						<li>번호 
							<input type="text" name="sh_telephone" value="${info[0].sh_telephone }" /> 
							<span>* 번호는 -포함하여 적어주세요.</span>
						</li>
						<li>주소 <input type="text" name="sh_location" value="${info[0].sh_location }" /></li>
						<li>시간
							<input class="time" type="text" name="sh_starttime" value="${info[0].sh_starttime }" /> - 
							<input class="time" type="text" name="sh_endtime" value="${info[0].sh_endtime }" />
						</li>
						<li class="himessage">인사말<br>
							<textarea name="sh_hello">${info[0].sh_hello }"
							</textarea>
						</li>
					</ul>
					
					<!-- 매장 가격정보 -->
					<div class="information">
						<h3>스타일 정보</h3>
						<h4>경과시간은 시간 단위로만 적어주세요.</h4>
						<c:forEach var="dto1" items="${service }">
							<ul class="price_info">
								<li><span>이름</span><input type="text" name="ser_name" value="${dto1.ser_name }" /></li>
								<li><span>가격</span><input type="text" name="ser_price" value="${dto1.ser_price }" /></li>
								<li><span>시간</span><input class="time" type="text" name="ser_time" value="${dto1.ser_time }" /></li>
							</ul>
						</c:forEach>	
					</div>									
				</form>
				<!-- 디자이너 목록 -->
				<div class="information">
					<h3>디자이너 정보</h3>
					<c:forEach var="dto2" items="${designer }">
						<ul class="designer">
							<li><img src="${dto2.de_picture }" /></li>
							<li class="designer_name">${dto2.de_name } ${dto2.de_position }</li>
							<li>${dto2.de_career }년 경력</li>
							<li>${dto2.de_major } 전문</li>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>			
	</div>
		
	<!-- 화살표버튼 -->
	<div id="go_top">
		<a><i class="fas fa-arrow-circle-up"></i></a>
	</div>
</section>

<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>
	
	</c:otherwise>
</c:choose>
