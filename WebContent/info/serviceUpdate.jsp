<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${service == 0 }"> 
		<script>
			alert("수정실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("서비스 정보가 수정되었습니다.");
			location.href = "storeUpdate.bbq?sh_uid=${param.sh_uid}";
		</script>
	</c:otherwise>
</c:choose>












