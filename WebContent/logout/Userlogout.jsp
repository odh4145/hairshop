<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% session.invalidate(); %>

<%-- reqiest ㅇ[ 딤겨있는url -> location.href --%>

<script>
	alert("로그아웃");
	history.go(-1)
</script>