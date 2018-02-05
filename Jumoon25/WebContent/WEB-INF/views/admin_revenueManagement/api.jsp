<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<style>
#map {
        height: 400px;
        width: 100%;
      }
</style>
</head>
<body>
	<h3>My Google Maps Demo</h3>
	<div id="map"></div>
	
	<script>
      function initMap() {
    	  var uluru = {lat: -25.363, lng: 131.044};
          var map = new google.maps.Map(document.getElementById('map'), {
          	zoom: 4,
          	center: uluru
          });
          var marker = new google.maps.Marker({
        	  position: uluru,
        	  map: map
          })
      }
    </script>
    
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyByp8s0Cdujlv6AbEWzEY9vBFnGrQQcBH8&callback=initMap"
    async defer></script>
</body>
</html>