<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/top_owner.jsp"%>
<%@ include file="../module/bottom.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>사장님 회원가입</title>
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
<script language="JavaScript">
	function checkIt() {
		var ownerinput = eval("document.ownerinput");
		if (!ownerinput.owner_id.value) {
			alert("ID를 입력하세요");
			return false;
		}
		if (!ownerinput.owner_pw.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (ownerinput.owner_pw.value.length < 4) {
			alert("비밀번호는 4자리 이상입니다");
			return false;
		}
		if (ownerinput.owner_pw.value != ownerinput.owner_pw2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		if (!ownerinput.owner_name.value) {
			alert("성함을 입력하세요");
			return false;
		}
		if (!ownerinput.owner_sex[0].checked
				&& !ownerinput.owner_sex[1].checked) {
			alert("성별을 입력하세요");
			return false;
		}
		if (!ownerinput.owner_birth.value) {
			alert("생년월일을 입력하세요");
			return false;
		}
		if (ownerinput.owner_birth.value.length != 8) {
			alert("생년월일은 -없이 8자리 입니다.");
			return false;
		}
		if (!ownerinput.owner_phone.value) {
			alert("전화번호를 입력하세요");
			return false;
		}
		if (ownerinput.owner_phone.value.length != 11) {
			alert("전화번호는 -없이 11자리 입니다.");
			return false;
		}
		if (!ownerinput.confirmCheck.value) {
			alert("ID중복체크를 하세요");
			return false;
		}
		if (!ownerinput.owner_address.value) {
			alert("주소를 입력하세요");
			return false;
		}
		if (!ownerinput.owner_address1.value) {
			alert("주소를 입력하세요");
			return false;
		}
		if (!ownerinput.owner_address2.value) {
			alert("주소를 입력하세요");
			return false;
		}
	}

	// 아이디 중복 여부를 판단
	function openConfirmid(ownerinput) {
		// 아이디를 입력했는지 검사
		if (ownerinput.owner_id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		// url과 사용자 입력 id를 조합합니다.
		url = "owner_confirmId.do?id=" + ownerinput.owner_id.value;

		// 새로운 윈도우를 엽니다.
		open(
				url,
				"confirm",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=300");
	}
</script>
<!-- 주소api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<body>
	<div class="container w-50 py-3">
		<h5>사장님 회원가입</h5>
		<form method="post" action="/Jumoon25/owner_login/owner_inputPro.do"
			name="ownerinput" onSubmit="return checkIt()">
			<input type="hidden" name="confirmCheck">
			<div class="form-inline mb-1">
				<input type="text" name="owner_id" placeholder="아이디"
					class="form-control form-control-sm" /><input type="button"
					name="confirm" value="중복확인"
					class="btn btn-secondary btn-sm ml-auto mr-0"
					OnClick="openConfirmid(this.form)">
			</div>
			<div class="form-group mb-1">
				<input class="form-control form-control-sm" name="owner_pw"
					type="password" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<input class="form-control form-control-sm" name="owner_pw2"
					type="password" placeholder="비밀번호 재입력">
			</div>
			<div class="form-inline mb-1">
				<div class="form-group">
					<input class="form-control form-control-sm" name="owner_name"
						type="text" placeholder="성함">
					<div class="custom-control custom-radio ml-4">
						<input name="owner_sex" class="custom-control-input"
							id="customRadio1" type="radio" value="m"> <label
							class="custom-control-label" for="customRadio1">남</label>
					</div>
					<div class="custom-control custom-radio ml-2">
						<input name="owner_sex" class="custom-control-input"
							id="customRadio2" type="radio" value="f"> <label
							class="custom-control-label" for="customRadio2">여</label>
					</div>
				</div>
			</div>
			<div class="form-group mb-1">
				<input class="form-control form-control-sm" name="owner_birth"
					type="text" placeholder="생년월일(-없이 8자리)" maxlength="8">
			</div>
			<div class="form-group mb-1">
				<input class="form-control form-control-sm" name="owner_phone"
					type="text" placeholder="전화번호(-없이 11자리)" maxlength="11">
			</div>
			<div class="form-inline mb-1">
				<input type="text" class="form-control form-control-sm" name="owner_address"
					id="sample6_postcode" placeholder="우편번호" size="10" readonly="">
				<input type="button" class="btn btn-secondary btn-sm ml-auto mr-0"
					onclick="sample6_execDaumPostcode()" value="주소 찾기">
			</div>
			<div class="form-group mb-1">
				<input type="text" class="form-control form-control-sm" readonly=""
					id="sample6_address" name="owner_address1" placeholder="주소">
			</div>
			<div class="form-group">
				<input type="text" class="form-control form-control-sm"
					id="sample6_address2" name="owner_address2" placeholder="상세 주소">
			</div>
			<div class="form-inline">
				<input type="submit" class="btn btn-primary btn-sm ml-auto mr-1"
					value="회원가입"> <input type="button"
					class="btn btn-primary btn-sm ml-1 mr-auto"
					onclick="javascript:window.location='owner_loginForm.do'"
					value="돌아가기">
			</div>
		</form>
	</div>
</body>
</html>