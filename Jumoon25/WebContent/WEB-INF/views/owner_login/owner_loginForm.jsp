<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�α���</title>

<script language="javascript">
	function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if (!document.myform.owner_id.value) {
			alert("���̵� �Է����� �����̽��ϴ�.");
			document.myform.owner_id.focus();
			return false;
		}
		if (!document.myform.owner_pw.value) {
			alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
			document.myform.owner_pw.focus();
			return false;
		}
	}
</script>
</head>
<BODY onload="begin()">

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
							<input type="text" id="owner_id" placeholder="���̵�" class="form-control" />
						</p>
						<p class="field">
							<label for="owner_pw" class="col-form-label">��й�ȣ</label>
							<input type="password" id="owner_pw" placeholder="��й�ȣ" class="form-control" />
						</p>
						<div class="btn-area">
							<input type="submit" class="btn btn-primary" value="�α���" />
							<input type="button" value="ȸ������" class="btn btn-primary" onclick="javascript:window.location='owner_inputForm.do'" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</BODY>
</HTML>
