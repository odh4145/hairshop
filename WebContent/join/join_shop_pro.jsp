<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

<script>

$(document).ready(function(){
	
var addr = "서울 강남구 강남대로 298";

var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + addr + "&key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438";

		
	$.ajax({
		url : url,
		type : "GET",
		cache : function(data, status){
			if(status == "success") parseJSON(data);
		}
	});
});
	
function parseJSON(jsonObj){
	
	var row = jsonObj.results.geometry;
	var i;
	
	var table = "<tr><th>위도</th><th>경도</th></tr>";
	
	for (i = 0; i < row.length; i++){
		table += "<tr>";
		table += "<td>" + row[i].lat + "</td>"
		table += "<td>" + row[i].lng + "</td>"
		table += "</tr>";
	}
	$("#demoJSON").html(table);
}
	
		
</script>

</body>
</html>