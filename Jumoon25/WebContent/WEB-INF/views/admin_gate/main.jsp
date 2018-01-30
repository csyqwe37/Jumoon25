<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>관리자 페이지</title>
		<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
		<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
		<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
		<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
	</head>
	<body>
		
		<div class="jumbotron">
		  <h1 class="display-3">관리자 페이지</h1>
		  <p class="lead">이 페이지는 주문25 총 관리자가 가맹점, 매출, 사장님을 관리할 수 있는 기능을 갖추고 있습니다.</p>
		  <hr class="my-4">
		  <p>Challenges are what make life interesting; overcoming them is what makes life meaningful.</p>
		  <p class="lead">
		    <a class="btn btn-primary btn-lg" role="button" href="/Jumoon25/admin_notice/noticeList.do?currentPage=1">공지사항</a>
		    <a class="btn btn-primary btn-lg" role="button" href="/Jumoon25/admin_ownerManagement/permissionList.do?currentPage=1">사장님 승인</a>
		    <a class="btn btn-primary btn-lg" role="button" href="/Jumoon25/admin_revenueManagement/revenueMain.do">매출관리</a>
		  </p>
		</div>
	<ul class="list-group">
	  <li class="list-group-item d-flex justify-content-between align-items-center">
	    Cras justo odio
	    <span class="badge badge-primary badge-pill">14</span>
	  </li>
	  <li class="list-group-item d-flex justify-content-between align-items-center">
	    Dapibus ac facilisis in
	    <span class="badge badge-primary badge-pill">2</span>
	  </li>
	  <li class="list-group-item d-flex justify-content-between align-items-center">
	    Morbi leo risus
	    <span class="badge badge-primary badge-pill">1</span>
	  </li>
	</ul>
	<br/><br/>
	
	<div class="list-group">
  <a class="list-group-item list-group-item-action flex-column align-items-start active" href="#">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">List group item heading</h5>
      <small>3 days ago</small>
    </div>
    <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
    <small>Donec id elit non mi porta.</small>
  </a>
  <a class="list-group-item list-group-item-action flex-column align-items-start" href="#">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">List group item heading</h5>
      <small class="text-muted">3 days ago</small>
    </div>
    <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
    <small class="text-muted">Donec id elit non mi porta.</small>
  </a>
</div>
	</body>
</html>