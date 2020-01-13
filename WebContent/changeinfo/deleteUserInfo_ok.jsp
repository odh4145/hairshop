<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	
	<c:when test="${deleteUser == 0 }">
		<script>
			alert("회원탈퇴 실패!!(현재 비밀번호 틀림)");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${deleteUser == 1 }">
			<% session.invalidate();%>
		<script>
			alert("회원탈퇴 완료");
			location.href = "../index.jsp";
		</script>
	</c:when>
	
	
</c:choose>
