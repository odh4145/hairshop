<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<% if(session.getAttribute("sessionID") == null) {%>
	<script>
		alert("로그인 실패");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("로그인성공");
		
	</script>
<% } %>
    
<%--
<c:if test="${login_user == -1}">
	<script>
	alert("아디틀림")
	history.back();
	</script>
</c:if>

<c:if test="${login_user == 0}">
	<script>
	alert("비번틀림")
	history.back();
	</script>
</c:if>
 --%>   

<c:if test="${login_user == 1}">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

회원가입 성공
</body>
</html> 
</c:if>


