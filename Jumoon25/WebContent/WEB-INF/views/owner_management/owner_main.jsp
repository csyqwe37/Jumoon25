<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>사장님 메인</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>

<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
<link href="/Jumoon25/design/bootswatch/bootstrap.min.css"
	rel="stylesheet">
<link href="/Jumoon25/design/bootswatch/_bootswatch.scss"
	rel="stylesheet">
<link href="/Jumoon25/design/bootswatch/_variables.scss"
	rel="stylesheet">

<style type="text/css">
html, body {
	height: 100%;
}

.wrap {
	min-height: 100%;
	position: relative;
	margin-bottom: -60px;
	padding-bottom: 60px;
}

.footer {
	margin-top: 10px;
	bottom: 0;
	width: 100%;
	height: 50px;
	color: white;
	background-color: #333333;
	position: relative;
}

.jumbotron {
	padding: 2rem 1rem;
	margin-bottom: 1rem;
	background-color: white;
	color: #2FA4E7;
	height: 150px;
}

.w-60 {
	width: 60% !important;
}

.w-40 {
	width: 40% !important;
}

.badge-1 {
	font-weight: 700;
	line-height: 1;
	text-align: center;
}

.text-1 {
	margin-bottom: 0.5rem;
	font-family: inherit;
	font-weight: 500;
	line-height: 1.2;
	font-size: 2rem;
}

.text-2 {
	font-size: 1rem;
	color: #000000;
}

.text-3 {
	font-size: 0.8rem;
	color: #666666;
}

.block {
	display: block;
}
</style>

</head>
<BODY>
	<div class="wrap">
		<%@ include file="../module/top_owner.jsp"%>
		<div>
			<div class="jumbotron text-center">
				<p class="text-1">사장님, 환영합니다!</p>
				<hr class="my-2">
				<p class="lead">이곳은 사장님들만을 위한 사이트입니다. 이곳에서 새로운 꿈을 키우세요!</p>
			</div>
		</div>

		<div class="container">
			<div class="w-60 float-left p-2">
				<div class="mb-4">
					<div class="d-flex justify-content-between mr-3 ml-1 mb-0">
						<p class="badge-1 text-2">
							<img style="width: 25px; height: 25px; display: inline"
								src="/Jumoon25/design/image/notice.png"> 공지사항
						</p>
						<small><a class="text-3"
							href="/Jumoon25/admin_notice/noticeList.do?currentPage=1">더보기
								></a></small>
					</div>
					<ul class="list-group">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<a class="badge-1 text-2"
							href="/Jumoon25/admin_notice/noticeView.do?notice_number=${max}&currentPage=1">${title}</a>
							<span class="text-3">${dateResult}</span>

						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<a class="badge-1 text-2"
							href="/Jumoon25/admin_notice/noticeView.do?notice_number=${max-1}&currentPage=1">${title1}</a>
							<span class="text-3">${date1Result}</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<a class="badge-1 text-2"
							href="/Jumoon25/admin_notice/noticeView.do?notice_number=${max-2}&currentPage=1">${title2}</a>
							<span class="text-3">${date2Result}</span>
						</li>
					</ul>
				</div>
				<div class="block mb-4">
					<div class="d-flex justify-content-between mr-3 ml-1 mb-0">
						<p class="badge-1 text-2"><img style="width: 25px; height: 25px; display: inline"
								src="/Jumoon25/design/image/tip.png"> 사장님 꿀팁</p>
						<small><a class="text-3"
							href="https://ceo.baemin.com/#/knowhow">더보기 ></a></small>
					</div>
					<div class="w-50 float-left">
						<a href="https://ceo.baemin.com/#/knowhow/detail/9"><img
							src="/Jumoon25/design/image/cms155419248_b.jpg"
							style="width: 100%; height: auto;"></a> <a
							href="https://ceo.baemin.com/#/knowhow/detail/10"><img
							src="/Jumoon25/design/image/cms154219196_b.jpg"
							style="width: 100%; height: auto;"></a>
					</div>
					<div class="w-50 float-right">
						<a href="https://ceo.baemin.com/#/knowhow/detail/16"><img
							src="/Jumoon25/design/image/cms132604084_b.jpg"
							style="width: 100%; height: auto;"></a> <a
							href="https://ceo.baemin.com/?utm_source=1#/knowhow/detail/15"><img
							src="/Jumoon25/design/image/cms185054512_b.jpg"
							style="width: 100%; height: auto;"></a>
					</div>
				</div>
			</div>

			<div class="w-40 float-right p-2">

				<div class="mb-4">
					<div class="d-flex justify-content-between mb-0">
						<p class="badge-1 text-2">모든 관리를 한번에!</p>
						<small><a class="text-3"
							href="/Jumoon25/owner_management/owner_shop_management.do">업체관리
								바로가기 ></a></small>
					</div>
					<div class="d-flex justify-content-between mb-0">
						<a href="/Jumoon25/owner_management/owner_shop_management.do"><img
							style="width: auto; height: 150px;"
							src="/Jumoon25/design/image/sale.png"></a>
						<p class="card-text">업체 등록, 업체 수정, 업체 삭제, 메뉴 등록, 메뉴 수정 등 모든
							작업이 가능합니다!</p>
					</div>
				</div>

				<div class="mb-4">
					<div class="d-flex justify-content-between mb-0">
						<p class="badge-1 text-2">사장님의 매출을 확인하세요!</p>
						<small><a class="text-3"
							href="/Jumoon25/owner_management/owner_sales_graph.do">매출
								보러가기 ></a></small>
					</div>
					<div class="d-flex justify-content-between mb-0">
						<a href="/Jumoon25/owner_management/owner_sales_graph.do"><img
							style="width: auto; height: 150px;"
							src="/Jumoon25/design/image/shop.png"></a>
						<p class="card-text">사장님이 매출을 쉽고 간편하게 볼 수 있도록 도와드립니다!</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="../module/bottom.jsp"%>
</BODY>
</HTML>