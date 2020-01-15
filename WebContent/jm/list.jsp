<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%

   String sh_name = (String)request.getAttribute("shopName");

   int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));

%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%= sh_name %> 후기 게시판</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/reviewlist.css" rel="stylesheet" type="text/css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
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
         
         <h2 id="content_title"><%= sh_name %> 후기 List</h2>
            <div class="inbox">
               <table class="list">
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>별점</th>
                  </tr>

                  <c:forEach var="dto" items="${list }" varStatus="status">
                     <tr>
                        <td>${(page - 1) * pageRows + status.index + 1 }</td>
                        <td id="subject"><a href="view.bbq?uid=${dto.uid }&page=${page}">${dto.title }</a></td>
                        <td>${dto.name }</td>
                        <td>${dto.star }</td>
                     </tr>
                  </c:forEach>
               </table>

               <form name="frm" action="sortlist.bbq?sh_uid=<%=sh_uid %>" method="post">
                  <select name="speed" id="speed">
                     <option selected="selected">제목</option>
                     <option>작성자</option>
                  </select>
                  <input type="text" name="text" /> 
                  <input class="btn" type="submit" class="fas fa-search" value="&#xf002;" />
                  <input class="btn" type="button" onclick="location.href='shlist.bbq?sh_uid=<%=sh_uid %>'" value="되돌아가기" />
               </form>
               
               <jsp:include page="pagination.jsp">
               <jsp:param value="${writePages }" name="writePages" />
               <jsp:param value="${totalPage }" name="totalPage" />
               <jsp:param value="${page }" name="curPage" />
               <jsp:param value="${sh_uid }" name="sh_uid" />
               </jsp:include>
            </div>
         </div>
   
   
  

      <!-- 화살표버튼 -->
      <div id="go_top">
         <a><i class="fas fa-arrow-circle-up"></i></a>
      </div>
      
   </section>

   <!-- javascript 링크 -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="../js/public.js" type="text/javascript"></script>

</body>
</html>






