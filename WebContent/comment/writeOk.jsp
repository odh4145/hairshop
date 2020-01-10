<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer) request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert("등록 실패, 다시 작성해주세요.");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("후기글 등록성공, 리스트 페이지로 이동합니다.");
		location.href = "list.do";
	</script>
<% }  %>











