<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('a[data-toggle="tab"]').on('hidden.bs.tab', function(e) {
			alert("이벤트 실행됨");
		});
	});
</script>

</head>
<%@ include file = "../module/top.jsp" %>
<%@ include file = "../module/menu.jsp" %>

<body>

	<div class="container">
		<h2>가게정보</h2>
		<ul id="myTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a data-target="#menu"
				id="menu-tab" role="tab" data-toggle="tab" aria-controls="menu"
				aria-expanded="true">메뉴</a></li>
			<li role="presentation" class=""><a data-target="#review"
				role="tab" id="review-tab" data-toggle="tab"
				aria-controls="review" aria-expanded="false">리뷰</a></li>
			<li role="presentation" class=""><a data-target="#info"
				role="tab" id="info-tab" data-toggle="tab"
				aria-controls="info" aria-expanded="false">정보</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="menu"
				aria-labelledby="menu-tab">
				<p>메뉴내용<br/>
				<%@ include file = "shopProduct/menuDropDown.jsp" %>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="review"
				aria-labelledby="review-tab">
				<p>리뷰내용<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="info"
				aria-labelledby="info-tab">
				<p>정보내용<br/>
				<%@ include file = "shopInfo/map.jsp" %>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
			</div>
		</div>
	</div>

</body>
</html>
<%@ include file = "../module/bottom.jsp" %>