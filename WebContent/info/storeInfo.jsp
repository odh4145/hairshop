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

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${list[0].sh_name } 정보</title>
</head>

<body>
<h2>${list[0].sh_name } 정보</h2>
<br>
<p>
${list[0].sh_uid }<br>
${list[0].sh_name }<br>
${list[0].sh_telephone }<br>
${list[0].sh_picture1 }<br>
${list[0].sh_dayoff1 }<br>
${list[0].sh_starttime }<br>
${list[0].sh_endtime }
</p>
</body>
</html>
	
	</c:otherwise>
</c:choose>









