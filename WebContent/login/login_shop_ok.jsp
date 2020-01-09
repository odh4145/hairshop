<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:choose>
	<c:when test="${login_shop == -1 }">
		<script>
			alert("로그인 실패!! (없는 아이디)");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${login_shop == 0 }">
		<script>
			alert("로그인 실패!! (비밀번호 틀림)");
			history.back();
			
		</script>
	</c:when>
    
    <c:when test="${login_shop == 1 }">
		<script>
			alert("로그인 성공");
			location.href = "login_shop.bbqLoginShop";
		</script>
	</c:when>    
</c:choose>




