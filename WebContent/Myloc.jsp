<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<title>내 주변 매장 찾기</title>
<meta charset="UTF-8">
<style>
      #map {
        height: 100%;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
</head>
<body>


<div id = "map"></div>


<!-- 자기위치를 로드하는 지도 생성 -->
 <script>
    var map;
    var infoWindow;
      
 
    function initMap() {
    	// 지도 초기화 생성  <기초 좌표값 서울시청> <zoom값 14>
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.566287, lng: 126.978094},
          zoom: 15
        });
        infoWindow = new google.maps.InfoWindow;
       
       
        // 사용자 위치 받아오는 지오코드 .
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
        	
        	  // 사용자 위치 좌표 저장하는 변수
        	var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
        	
        	  
        	  // 상세정보창으로 사용자의 추정위치를 센터로 잡아줌
            alert("웹은 GPS모듈이 없어서 사용자 위치가 부정확할수 있습니다.");
            infoWindow.open(map);
            map.setCenter(pos);
          }, 
          // 사용자의 정보를 못불러올 경우 
          function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // 브라우저가 지오코드를 지원 못하는경우 
          handleLocationError(false, infoWindow, map.getCenter());
          alert("죄송합니다. 내 위치 서비스를 지원하지 않는 브라우저입니다.");
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
      </script>

 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438&callback=initMap"
    async defer></script>


</body>
</html>