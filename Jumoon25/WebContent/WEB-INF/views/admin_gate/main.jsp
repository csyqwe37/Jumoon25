<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>관리자 페이지</title>
		<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
		<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
		<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
		<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
		<style type="text/css">
			html, body {
			   height: 100%;
			}
			
			.wrap {
			   min-height: 100%;
			   position: relative;
			   margin-bottom:-60px;
			   padding-bottom:60px;
			}
			
			.footer {
			   margin-top:10px;
			   bottom: 0;
			   width: 100%;
			   height: 50px;
			   color: white;
			   background-color: #333333;
			   position: relative;
			}
			
			.jumbotron {
			  padding: 2rem 1rem;
			  margin-bottom: 2rem;
			  background-color: #e9ecef;
			  border-radius: 0.3rem;
			  margin: ;
			}
		</style>
	</head>
	<body>
		<div class="wrap">
		<%@ include file="../module/top_owner.jsp"%>
		
		<ul class="nav nav-pills">
		  <li class="nav-item">
		    <a class="nav-link active">Active</a>
		  </li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">메뉴</a>
		    <div class="dropdown-menu" style="left: 0px; top: 0px; position: absolute; transform: translate3d(0px, 39px, 0px);" x-placement="bottom-start">
		      <a class="dropdown-item" href="/Jumoon25/admin_notice/noticeList.do?currentPage=1">공지사항</a>
		      <div class="dropdown-di vider"></div>
		      <a class="dropdown-item" href="/Jumoon25/admin_ownerManagement/permissionList.do?currentPage=1">사장님 승인</a>
		      <a class="dropdown-item" href="/Jumoon25/admin_revenueManagement/revenueMain.do">매출관리</a>
		    </div>
		  </li>
		</ul>
		
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
	</div>
	<%@ include file="../module/bottom.jsp"%>
	</body>
</html>