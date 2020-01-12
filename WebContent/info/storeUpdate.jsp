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

<script>
function infoSubmit(frm) {
	var sh_telephone = frm.sh_telephone.value.trim();
	var sh_location = frm.sh_location.value.trim();
	var sh_starttime = frm.sh_starttime.value.trim();
	var sh_endtime = frm.sh_endtime.value.trim();

	if (sh_telephone == "" && sh_location == "" && sh_starttime == ""
			&& sh_endtime == "") {
		alert("빈 칸이 존재합니다.");
		return false;
	}
	return true;
}
</script>
<body>
<header>
	<ul id="top_menu">
		<li id="logo"><a href="index.bbq">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href=#">후기</a></li>
			<li><a href="#">예약내역</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>	
		<li id="login" ><a href="#">로그아웃</a></li>
	</ul>
</header>

<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">디자이너관리</h2>
			<div class="box clear">
				<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
				<div class="submenu">
					<h4 class="selected"><a href="storeUpdate.bbq?sh_uid=${param.sh_uid }">매장정보변경</a></h4>
					<h4><a>매장사진관리</a></h4>
					<h4><a>개인정보수정</a></h4>
				</div>
	
				<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
				<div class="inner">
					<div class="info">	
						<div class="store_pic">
							<img src="${info[0].sh_picture1 }" />
							<img src="${info[0].sh_picture2 }" />
							<img src="${info[0].sh_picture3 }" />
						</div>
					<div class="store_info">			
					<h2>${info[0].sh_name }</h2>
				
				<!-- 매장 기본정보 -->
				<form name="frm" action="storeInfoUpdate.bbq" method="post" onsubmit="return infoSubmit(this)">					
					<ul class="information">
					<h3>기본정보</h3>
						<input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
						<li>번호 
							<input type="text" name="sh_telephone" value="${info[0].sh_telephone }" /> 
							<span>* 번호는 - 포함하여 적어주세요.</span>
						</li>
						<li>주소 <input class="address" type="text" name="sh_location" value="${info[0].sh_location }" /></li>
						<li>시간
							<input class="time" type="text" name="sh_starttime" value="${info[0].sh_starttime }" /> - 
							<input class="time" type="text" name="sh_endtime" value="${info[0].sh_endtime }" />
						</li>
						<li>인사말<br>
							<textarea class="himessage" name="sh_hello">${info[0].sh_hello }"
							</textarea>
						</li>
						<input class="update" type="submit" value="기본정보수정" />
					</ul>				
				</form>
					
				<!-- 매장 가격정보 -->
				<div class="information">
					<h3>스타일 정보</h3>
					<h4>경과시간은 시간 단위로만 적어주세요. ex) 1시간이면 1이라고 입력</h4>
					<c:forEach var="dto1" items="${service }">
						<form name="serfrm" method="post" >		
							<ul class="service_info">
								<input type="hidden" name="sh_uid" value="${dto1.sh_uid}"/>
								<input type="hidden" name="ser_uid" value="${dto1.ser_uid}">
								<li>이름 <input type="text" name="ser_name" value="${dto1.ser_name }" /></li>
								<li>가격 <input type="text" name="ser_price" value="${dto1.ser_price }" /></li>
								<li>시간 <input class="time" type="text" name="ser_time" value="${dto1.ser_time }" /></li>
								<div class="btnbox">
									<input class="p_btn" type="submit" value="수정" formaction="serviceUpdate.bbq"/>
									<input id="go_delete" class="p_btn" type="submit" value="삭제" formaction="serviceDelete.bbq"/>
								</div>
							</ul>																	
						</form>
					</c:forEach>			
					
					<input class="update" type="button"  value="스타일추가"
						onClick="location.href='serviceAdd.bbq?sh_uid=${param.sh_uid}'" />
				</div>									
				
				<!-- 디자이너 목록 -->
				<div class="information">
					<h3>디자이너 정보</h3>
					<c:forEach var="dto2" items="${designer }">
						<form name="defrm" method="post" enctype="Multipart/form-data">
							<ul class="designer">
								<input type="hidden" name="sh_uid" value="${dto2.sh_uid }" />
								<input type="hidden" name="de_uid" value="${dto2.de_uid }" />
								<li id="imgbox"><img src="${dto2.de_picture }"></li>							
								<li>이름 <input type="text" name="de_name" value="${dto2.de_name }" /></li>
								<li>직책 <input type="text" name="de_position" value="${dto2.de_position }" /></li>
								<li>경력 <input type="text" name="de_career" value="${dto2.de_career }" /></li>
								<li>전공 <input type="text" name="de_major" value="${dto2.de_major }"></li>
								<li><input class="insert_dpic" type="file" name="de_picture" size=40></li>
								<div class="btnbox">
									<input class="p_btn d_btn" type="submit" value="수정" formaction="designerUpdate.bbq"/>
									<input id="go_delete" class="p_btn d_btn" type="submit" value="삭제" formaction="designerDelete.bbq"/>
								</div>
							</ul>
						</form>
					</c:forEach>
					<input class="update" type="button" value="디자이너추가"
						onClick="location.href='designerAdd.bbq?sh_uid=${param.sh_uid}'" />
				</div>
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
