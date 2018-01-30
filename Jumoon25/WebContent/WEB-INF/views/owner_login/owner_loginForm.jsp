<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/top.jsp"%>
<%@ include file="../module/bottom.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>사장님 로그인</title>
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

<script language="javascript">
	function checkIt() {
		if (!document.myform.owner_id.value) {
			alert("아이디를 입력하지 않으셨습니다.");
			document.myform.owner_id.focus();
			return false;
		}
		if (!document.myform.owner_pw.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.owner_pw.focus();
			return false;
		}
	}
</script>
</head>
<BODY>

	<div id="wrap">
		<div id="header">
			<h1 class="logo">
				<a href="#">Jumoon25</a>
			</h1>
		</div>
		<div id="container">
			<div id="content">
				<h2 class="blind">����� �α���</h2>
				<div class="join">
					<form name="myform"	action="/Jumoon25/owner_login/owner_loginPro.do" method="post" onSubmit="return checkIt()">
						<p class="field">
							<label for="owner_id" class="col-form-label">���̵�</label>
							<input type="text" id="owner_id" name="owner_id" value="${owner_dto.owner_id} placeholder="���̵�" class="form-control" />
						</p>
						<p class="field">
							<label for="owner_pw" class="col-form-label">��й�ȣ</label>
							<input type="password" id="owner_pw" name="owner_pw" value="${owner_dto.owner_pw} placeholder="��й�ȣ" class="form-control" />
						</p>
						<div class="btn-area">
							<input type="submit" class="btn btn-primary" value="�α���" />
							<input type="button" value="ȸ������" class="btn btn-primary" onclick="javascript:window.location='owner_inputForm.do'" />
						</div>
					</form>

	<div class="container w-50 py-3">
	<a href="#"></a><h3>사장님 로그인</h3>
			<form name="myform" action="/Jumoon25/owner_login/owner_loginPro.do"
				method="post" onSubmit="return checkIt()">
				<div class="form-group">
					<label for="owner_id">아이디</label> <input type="text" name="owner_id"
						placeholder="아이디를 입력하세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="owner_pw">비밀번호</label> <input type="password"
						name="owner_pw" placeholder="비밀번호를 입력하세요." class="form-control" />
				</div>
				<div class="btn-area" align="center">
					<input type="submit" class="btn btn-primary" value="로그인" /> <input
						type="button" value="회원가입" class="btn btn-primary"
						onclick="javascript:window.location='owner_inputForm.do'" />
				</div>
			</form>
	</div>

</BODY>
</HTML>