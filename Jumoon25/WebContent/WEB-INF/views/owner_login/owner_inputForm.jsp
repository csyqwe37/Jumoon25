<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>사장님 회원가입</title>
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
		if (ownerinput.owner_pw.value != ownerinput.owner_pw2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		if (!ownerinput.owner_name.value) {
			alert("사용자 이름을 입력하세요");
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
		if (!ownerinput.owner_address.value) {
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
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
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

	<form method="post" action="/Jumoon25/owner_login/owner_inputPro.do"
		name="ownerinput" onSubmit="return checkIt()">
		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>사장님
							회원가입</b></font></td>
			</tr>
			<tr>
				<td width="200"><b>아이디 입력</b></td>
				<td width="400">&nbsp;</td>
			</tr>

			<tr>
				<td width="200">사용자 ID</td>
				<td width="400"><input type="text" name="owner_id" size="10"
					maxlength="12"> <input type="button" name="confirm"
					value="ID중복확인" OnClick="openConfirmid(this.form)"></td>
			</tr>
			<tr>
				<td width="200">비밀번호</td>
				<td width="400"><input type="password" name="owner_pw"
					size="15" maxlength="12"></td>
			<tr>
				<td width="200">비밀번호 확인</td>
				<td width="400"><input type="password" name="owner_pw2"
					size="15" maxlength="12"></td>
			</tr>

			<tr>
				<td width="200"><b>개인정보 입력</b></td>
				<td width="400">&nbsp;</td>
			<tr>
			<tr>
				<td width="200">사용자 이름</td>
				<td width="400"><input type="text" name="owner_name" size="15"
					maxlength="10"></td>
			</tr>
			<tr>
				<td width="200">성별</td>
				<td width="400"><input type="radio" name="owner_sex" value="m">남
					<input type="radio" name="owner_sex" value="f">여</td>
			</tr>
			<tr>
				<td width="200">생년월일</td>
				<td width="400"><input type="text" name="owner_birth" size="40"
					maxlength="30" placeholder="생년월일 순으로  -없이 입력하세요(8자리)"></td>
			</tr>
			<tr>
				<td width="200">전화번호</td>
				<td width="400"><input type="text" name="owner_phone" size="60"
					maxlength="50" placeholder="11자리를 -없이 입력하세요"></td>
			</tr>
			<tr>
				<td width="200">주소</td>
				<td width="400"><input type="text" name="owner_address"
					size="60" maxlength="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="confirm" value="등   록"> <input type="reset"
					name="reset" value="다시입력"> <input type="button"
					value="가입안함"
					onclick="javascript:window.location='owner_loginForm.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
