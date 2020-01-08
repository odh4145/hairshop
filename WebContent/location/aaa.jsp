<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.location.beans.*" %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<P><%= request.getParameter("lat")%></P><br>
<P><%= request.getParameter("lng")%></P><br>


   <% LocDTO [] arr = (LocDTO [])request.getAttribute("shoplist"); %>
	
	
	
	
	<%
	if(arr.length!=0){
	for(int i=0;i<arr.length; i++){
		String name = arr[i].getSh_name();
		String location = arr[i].getSh_location();
		String locationLat = arr[i].getSh_location_lat();
		String locationLng = arr[i].getSh_location_lng();
		}	
	}else{
		%>
		<script>
		alert("죄송합니다. 미용실이존재하지 않습니다.");
		
		</script>
		
		<%
	}
	%>
	
 
</body>
</html>