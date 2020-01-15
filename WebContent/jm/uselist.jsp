<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%

   String use_id = (String)request.getAttribute("use_id");

   int use_uid = Integer.parseInt(request.getParameter("use_uid"));

%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%= use_id %>님의 후기 게시판</title>
<style>
table {
   width: 80%;
}

table, th, td {
   border: 1px solid black;
   border-collapse: collapse;
}
</style>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.user != null }">
	<header>
		<ul id="top_menu">
			<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../location/Location2.bbq">내 주변 매장</a></li>
				<li><a href="../location/chooseArea.bbq">지역별 매장</a></li>
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
				<li id="login"><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<li id="login"><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
			<ul id="mo_menu">
				<li><a href="../location/Location2.bbq">내 주변 매장</a></li>
				<li><a href="../location/chooseArea.bbq">지역별 매장</a></li>
				<li><a id="mypage">마이페이지</a></li>
				<ul id="mo_sub">
					<c:if test="${sessionScope.user != null }">
						<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">예약내역</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../book/user.bbq?use_uid=0">예약내역</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="../jm/uselist.bbq?use_uid=${sessionScope.user }">내가 쓴 글</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../jm/uselist.bbq?use_uid=0">내가 쓴 글</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="../changeinfo/changeUserInfo.bbq">개인정보수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../changeinfo/changeUserInfo.bbq">개인정보수정</a></li>
					</c:if>				
				</ul>
			<c:if test="${sessionScope.user == null }">
				<li><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<li><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>			
			</ul>
	</header>

   <section>
      <div class="content">
         
         <h2 id="content_title"><%= use_id %>님의 후기 List</h2>

            <div>
               <hr>
               
               
               <table>
                  <tr>
                     <th>row</th>
                     <th>제목</th>
                     <th>내용</th>
                     <th>별점</th>
                     <th>등록일</th>
                  </tr>

                  <c:forEach var="dto" items="${list }" varStatus="status">
                     <tr>
                        <td>${(page - 1) * pageRows + status.index + 1 }</td>
                        <td>${dto.title }</td>
                        <td>${dto.content }</td>
                        <td>${dto.star }</td>
                        <td>${dto.regDate }</td>
                     </tr>
                  </c:forEach>
               </table>
               <br>

            </div>
            
            <jsp:include page="usepagination.jsp">
               <jsp:param value="${writePages }" name="writePages" />
               <jsp:param value="${totalPage }" name="totalPage" />
               <jsp:param value="${page }" name="curPage" />
               <jsp:param value="${sh_uid }" name="sh_uid" />
            </jsp:include>
         </div>
   
   
  

      <!-- 화살표버튼 -->
      <div id="go_top">
         <a><i class="fas fa-arrow-circle-up"></i></a>
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






