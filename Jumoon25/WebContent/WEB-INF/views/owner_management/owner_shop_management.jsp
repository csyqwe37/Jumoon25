<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>사장님 업체관리</title>
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
	position: relative;
	margin-top: 10px;
	bottom: 0;
	width: 100%;
	height: 50px;
	color: white;
	background-color: #333333;
}
</style>
</head>
<BODY>
	<div class="wrap">
		<%@ include file="../module/top_owner.jsp"%>
		<div class="container w-75 py-3">
			<table class="table table-hover">
				<thead>
					<tr class="table-primary">
						<th scope="col">업체명</th>
						<th scope="col">사업자등록번호</th>
						<th scope="col">리뷰수</th>
						<th scope="col">별점</th>
						<th scope="col">즐겨찾기</th>
						<th scope="col">업체관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.shop_pause==0}">
							<tr>
								<td>${dto.shop_name}</td>
								<td>${dto.shop_crNum}</td>
								<td>${dto.shop_review_count}</td>
								<td>${dto.shop_star}</td>
								<td>${dto.shop_bookmark}</td>
								<td><div class="btn-group" role="group">
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_shop_pause.do?crNum=${dto.shop_crNum}'">일시정지</button>
										&nbsp
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_shop_modify.do?crNum=${dto.shop_crNum}'">수
											정</button>
										&nbsp
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_shop_delete.do?crNum=${dto.shop_crNum}'">삭
											제</button>
										&nbsp
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_menu_management.do?crNum=${dto.shop_crNum}'">메뉴관리</button>
									</div></td>
							</tr>
						</c:if>
						<c:if test="${dto.shop_pause==1}">
							<tr class="table-danger">
								<td>${dto.shop_name}</td>
								<td>${dto.shop_crNum}</td>
								<td>${dto.shop_review_count}</td>
								<td>${dto.shop_star}</td>
								<td>${dto.shop_bookmark}</td>
								<td><div class="btn-group" role="group">
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_shop_pause.do?crNum=${dto.shop_crNum}'">일시정지</button>
										&nbsp
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_shop_modify.do?crNum=${dto.shop_crNum}'">수
											정</button>
										&nbsp
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_shop_delete.do?crNum=${dto.shop_crNum}'">삭
											제</button>
										&nbsp
										<button class="btn btn-secondary" type="button"
											onclick="javascript:window.location='owner_menu_management.do?crNum=${dto.shop_crNum}'">메뉴관리</button>
									</div></td>
							</tr>
						</c:if>
					</c:forEach>

					<c:if test="${list.size()==0}">
						<tr align="center">
							<td colspan="6"><h5>등록된 업체가 없습니다.</h5></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="btn-area" align="right">
				<input class="btn btn-primary" type="button" name="addShop"
					value="업체등록"
					onclick="javascript:window.location='/Jumoon25/owner_management/owner_addShopForm.do'" />
				<input class="btn btn-primary" type="button" name="back"
					value="이전으로"
					onclick="javascript:window.location='/Jumoon25/owner_management/owner_main.do'" />
			</div>
		</div>
	</div>
	<%@ include file="../module/bottom.jsp"%>
</BODY>
</HTML>
