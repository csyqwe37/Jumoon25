<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>사장님 가게등록</title>
<script language="JavaScript">
	function checkIt() {
		var shopinput = eval("document.shopinput");
		if (!shopinput.shop_name.value) {
			alert("가게이름을 입력하세요");
			shopinput.shop_name.focus();
			return false;
		}
		if (!shopinput.shop_phone.value) {
			alert("전화번호를 입력하세요");
			shopinput.shop_phone.focus();
			return false;
		}
		if (!shopinput.shop_intro.value) {
			alert("가게소개를 입력하세요");
			shopinput.shop_intro.focus();
			return false;
		}
		if (!shopinput.shop_bHours.value) {
			alert("영업시간을 입력하세요");
			shopinput.shop_bHours.focus();
			return false;
		}
		if (!shopinput.shop_cooInfo.value) {
			alert("원산지정보를 입력하세요");
			shopinput.shop_cooInfo.focus();
			return false;
		}
		if (!shopinput.shop_deliveryArea.value) {
			alert("배달지역을 입력하세요");
			shopinput.shop_deliveryArea.focus();
			return false;
		}
		if (!shopinput.shop_deliveryCost.value) {
			alert("배달가격을 입력하세요");
			shopinput.shop_deliveryCost.focus();
			return false;
		}
		if (!shopinput.shop_address.value) {
			alert("주소를 입력하세요");
			shopinput.shop_address.focus();
			return false;
		}
		if (!shopinput.shop_category.value) {
			alert("음식분류를 선택하세요");
			shopinput.shop_category.focus();
			return false;
		}
		if (!shopinput.shop_image.value) {
			alert("이미지를 넣어주세요");
			shopinput.shop_image.focus();
			return false;
		}
		if (!shopinput.shop_comment.value) {
			alert("사장님 한마디를 넣어주세요");
			shopinput.shop_comment.focus();
			return false;
		}

		if (!shopinput.shop_crNum.value) {
			alert("사업자등록번호를 넣어주세요");
			shopinput.shop_crNum.focus();
			return false;
		}
		if (!shopinput.shop_bank.value) {
			alert("은행명를 넣어주세요");
			shopinput.shop_bank.focus();
			return false;
		}
		if (!shopinput.shop_account.value) {
			alert("계좌를 넣어주세요");
			shopinput.shop_account.focus();
			return false;
		}

	}
</script>
<body>

	<form method="post"
		action="/Jumoon25/owner_magement/owner_addShopPro.do" name="shopinput"
		onSubmit="return checkIt()">
		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>사장님
							가게등록</b></font></td>
			</tr>
			<tr>
				<td width="200"><b>가게정보 입력</b></td>
				<td width="400">&nbsp;</td>
			</tr>

			<tr>
				<td width="200">가게 이름</td>
				<td width="400"><input type="text" name="shop_name" size="15"
					maxlength="15"></td>
			</tr>
			<tr>
				<td width="200">전화번호</td>
				<td width="400"><input type="text" name="shop_phone" size="15"
					maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">가게 소개</td>
				<td width="400"><input type="text" name="shop_intro" size="15"
					maxlength="12"></td>
			<tr>
				<td width="200">영업시간</td>
				<td width="400"><input type="text" name="shop_bHours" size="15"
					maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">원산지정보</td>
				<td width="400"><input type="text" name="shop_cooInfo"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">배달지역</td>
				<td width="400"><input type="text" name="shop_deliveryArea"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">배달가격</td>
				<td width="400"><input type="text" name="shop_deliveryCost"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">가게주소</td>
				<td width="400"><input type="text" name="shop_address"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">음식분류</td>
				<td width="400"><input type="text" name="shop_category"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">이미지</td>
				<td width="400"><input type="text" name="shop_image" size="15"
					maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">사장님 한마디</td>
				<td width="400"><input type="text" name="shop_comment"
					size="15" maxlength="12"></td>
			</tr>

			<tr>
				<td width="200"><b>개인정보 입력</b></td>
				<td width="400">&nbsp;</td>
			<tr>
			<tr>
				<td width="200">사업자등록번호</td>
				<td width="400"><input type="text" name="shop_crNum" size="15"
					maxlength="10"></td>
			</tr>
			<tr>
				<td width="200">은행명</td>
				<td width="400"><input type="text" name="shop_bank" size="15"
					maxlength="10"></td>
			</tr>
			<tr>
				<td width="200">계좌번호</td>
				<td width="400"><input type="text" name="shop_account"
					size="15" maxlength="10"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="confirm" value="등   록"> <input type="reset"
					name="reset" value="다시입력"> <input type="button"
					value="등록안함" onclick="javascript:window.location='owner_main.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
