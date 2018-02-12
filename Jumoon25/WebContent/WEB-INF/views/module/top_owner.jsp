<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="/Jumoon25//owner_login/owner_loginForm.do">주문25</a>
		<button class="navbar-toggler" aria-expanded="false"
			aria-controls="navbarColor02" aria-label="Toggle navigation"
			type="button" data-target="#navbarColor02" data-toggle="collapse">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="navbar-nav ml-auto">
			<c:if test="${sessionScope.ownerId!=null}">
				<li class="nav-item"><a class="nav-link" href="/Jumoon25/owner_login/owner_logout.do">로그아웃</a></li>
			</c:if>
			<c:if test="${sessionScope.ownerId==null}">
				<li class="nav-item"><a class="nav-link" href="/Jumoon25/owner_login/owner_loginForm.do">로그인</a></li>
			</c:if>
			</ul>
		</div>
	</nav>

</body>
</html>