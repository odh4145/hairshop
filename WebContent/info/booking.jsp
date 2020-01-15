<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>${info[0].sh_name } 예약하기</title>
<link rel="icon" href="../img/favicon.png">
<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/calendar.css" rel="stylesheet" type="text/css">

<!-- bootstrap 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.3.min.js" integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- javascript 코드 -->
<script>
var de = "";
var ser = "";
var arr = "";

$(document).ready(function() {
	$('#date').bootstrapMaterialDatePicker({
		time : false,
		clearButton : true,
		minDate : new Date()
	});

	$.material.init()
});

function deCheck(chk){
	de = chk.value;
    var de_chk = document.getElementsByName("de_name");
    for(var i=0; i<de_chk.length; i++){
        if(de_chk[i] != chk){
        	de_chk[i].checked = false;
        }
    }
}
    
function serCheck(chk){
	ser = chk.value;
    var ser_chk = document.getElementsByName("ser_name");
    for(var i=0; i<ser_chk.length; i++){
        if(ser_chk[i] != chk){
        	ser_chk[i].checked = false;
        }
    }
}

function sub() {
	frm = document.forms["frm"];

	var date = frm.date.value;
	var time = $("#number option:selected").val();		
	if (date == "" || time == "") {
		alert("날짜와 시간 선택은 필수입니다.");
		return false;
	} 
	else{		
		var bo_time = date + " " + time;
		frm.bo_time.value = bo_time;
		
		if (de == "") {
			de = "미정";
		}
		if (ser == "") {
			ser = "미정";
		}	
		
		var bo_service = de + " - " + ser;
		frm.bo_service.value = bo_service;
		
		return true;
	}
}
</script>
</head>

<body>
	
	<c:when test="${sessionScope.user != null }">
	
	<header>
		<ul id="top_menu">
			<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../location/Location2.bbq">내주변</a></li>
				<li><a href="../locaion/chooseArea.bbq">지역별매장</a></li>
				<c:choose>
				<c:when test="${sessionScope.user != null }">
				<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">마이페이지</a></li>
				</c:when>
				<c:when test="${sessionScope.user == null }">
				<li><a href="../book/user.bbq?use_uid=0">마이페이지</a></li>
				</c:when>
			</c:choose>
			</ul>
			<c:if test="${sessionScope.user == null }">
				<li id="login"><a href="login_user.bbqLoginUser">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<li id="login"><a href="../logout/Userlogout.jsp">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
		<ul id="mo_menu">
			<li><a>내주변</a></li>
			<li><a>지역별매장</a></li>
			<li><a id="mypage">마이페이지</a></li>
			<ul id="mo_sub">
				<li>예약내역</li>
				<li>내가쓴글</li>
				<li>개인정보수정</li>
			</ul>
			<li><a>로그인</a></li>
		</ul>
	</header>

	<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">매장사진관리</h2>
		
		<div class="box clear">
			<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
			<div class="submenu">
				<h4><a href="storeUpdate.bbq?sh_uid=${info[0].sh_uid}">매장정보변경</a></h4>
				<h4 class="selected"><a>매장사진관리</a></h4>
				<h4><a>개인정보수정</a></h4>
			</div>
	
			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div class="inner">
				<form name="picfrm" enctype="Multipart/form-data" action="storepicUpdate.bbq" method="post">
					<ul class="pic_box">
						<input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
						<li><img src="${info[0].sh_picture1 }"></li>
						<li><input class="insert_dpic" type="file" name="sh_picture1" size=40></li>
						<li><input class="update" type="submit" value="수정하기" /></li>
					</ul>						
					<ul class="pic_box">
						<input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
						<li><img src="${info[0].sh_picture2 }"></li>
						<li><input class="insert_dpic" type="file" name="sh_picture2" size=40></li>
						<li><input class="update" type="submit" value="수정하기" /></li>
					</ul>						
					<ul class="pic_box">
						<input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
						<li><img src="${info[0].sh_picture3 }"></li>
						<li><input class="insert_dpic" type="file" name="sh_picture3" size=40></li>
						<li><input class="update" type="submit" value="수정하기" /></li>
					</ul>						
				</form>
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
<script src="../js/storeUpdate.js" type="text/javascript"></script>
</body>
</html>
</c:when>
</c:otherwise>
</c:choose>
