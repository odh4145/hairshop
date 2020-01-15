<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	
	<c:when test="${change_user_info == 0 }">
		<script>
			alert("비밀번호 변경 실패!!(현재 비밀번호 틀림)");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${change_user_info == 1 }">
			<% session.invalidate();%>
		<script>
			alert("비밀번호 변경 완료. 로그아웃합니다");
			location.href = "../index.jsp";
		</script>
	</c:when>
	
	
</c:choose>

