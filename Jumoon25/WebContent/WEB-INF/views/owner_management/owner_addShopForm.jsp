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

<title>사장님 가게등록</title>
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
		if (shopinput.shop_phone.value.length!=11) {
			alert("전화번호는 -없이 11자리입니다.");
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
			alert("주소찾기를 하세요");
			shopinput.shop_address.focus();
			return false;
		}
		if (!shopinput.shop_address1.value) {
			alert("주소찻기를 하세요");
			shopinput.shop_address.focus();
			return false;
		}
		if (!shopinput.shop_address2.value) {
			alert("상세주소를 입력하세요");
			shopinput.shop_address.focus();
			return false;
		}
		if (shopinput.shop_category.value == "0") {
			alert("음식분류를 선택하세요");
			shopinput.shop_category.focus();
			return false;
		}
		if (!shopinput.img.value) {
			alert("이미지를 넣어주세요");
			shopinput.img.focus();
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
		if (shopinput.shop_crNum.value.length!=10) {
			alert("사업자등록번호는 -없이 10자리입니다.");
			shopinput.shop_crNum.focus();
			return false;
		}
		if (shopinput.shop_bank.value == "0") {
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
		<h5>사장님 업체등록</h5>
		<form method="post" enctype="multipart/form-data"
			action="/Jumoon25/owner_management/owner_addShopPro.do"
			name="shopinput" onSubmit="return checkIt()">
			<div class="form-inline mb-1">
				<div class="form-group mr-auto ml-0">
					<input class="form-control form-control-sm" name="shop_name"
						type="text" placeholder="업체명" size="70">
				</div>
				<div class="form-group mr-0 ml-auto">
					<input class="form-control form-control-sm" name="shop_phone"
						type="text" placeholder="업체 전화번호(-없이 11자리)" maxlength="11"
						size="70">
				</div>
			</div>
			<div class="form-group mb-1">
				<textarea class="form-control form-control-sm" name="shop_intro"
					type="text" placeholder="업체소개(간단히)" maxlength="120"></textarea>
			</div>
			<div class="form-group mb-1">
				<textarea class="form-control form-control-sm" name="shop_cooInfo"
					type="text" placeholder="원산지 정보" maxlength="120"></textarea>
			</div>
			<div class="form-group mb-1">
				<input class="form-control form-control-sm" name="shop_deliveryArea"
					type="text" placeholder="배달지역(방배1동, 반포2동)">
			</div>
			<div class="form-inline mb-1">
				<div class="form-group mr-auto ml-0">
					<input class="form-control form-control-sm" name="shop_bHours"
						type="text" placeholder="영업시간(00:00-00:00)" size="70">
				</div>
				<div class="form-group mr-0 ml-auto">
					<input class="form-control form-control-sm"
						name="shop_deliveryCost" type="text"
						placeholder="최소배달가격(12,000원 이상)" size="70">
				</div>
			</div>
			<div class="form-inline mb-1">
				<input type="text" class="form-control form-control-sm"
					name="shop_address" id="sample6_postcode" placeholder="우편번호"
					size="10" readonly=""> <input type="button"
					class="btn btn-secondary btn-sm ml-auto mr-0"
					onclick="sample6_execDaumPostcode()" value="주소 찾기">
			</div>
			<div class="form-group mb-1">
				<input type="text" class="form-control form-control-sm" readonly=""
					id="sample6_address" name="shop_address1" placeholder="주소">
			</div>
			<div class="form-group mb-1">
				<input type="text" class="form-control form-control-sm"
					id="sample6_address2" name="shop_address2" placeholder="상세 주소">
			</div>
			<div class="form-inline mb-1">
				<div class="form-group mr-auto ml-0">
					<select class="custom-select-sm" name="shop_category">
						<option selected="" value="0">음식분류를 선택하세요</option>
						<option value="1">치킨</option>
						<option value="2">중식</option>
						<option value="3">피자</option>
						<option value="4">족발/보쌈</option>
						<option value="5">야식</option>
						<option value="6">찜/탕</option>
						<option value="7">한식/분식</option>
						<option value="8">본가스/일식/회</option>
						<option value="9">도시락/죽/패스트푸드</option>
					</select>
				</div>
				<div class="form-group mr-0 ml-auto">
					<input type="file" name="img" class="form-control-file-sm" /><small>
						이미지를 등록하세요</small>
				</div>
			</div>
			<div class="form-group mb-1">
				<textarea class="form-control form-control-sm" name="shop_comment"
					type="text" placeholder="사장님 한마디(공지사항)" maxlength="120"></textarea>
			</div>
			<div class="form-inline">
				<div class="form-group mr-auto ml-0">
					<input class="form-control form-control-sm" name="shop_crNum"
						type="text" placeholder="사업자등록번호(-없이 10자리)" maxlength="10" size="60">
				</div>
				<div class="form-group mr-0 ml-auto">
					<select class="custom-select-sm" name="shop_bank">
						<option selected="" value="0">은행을 선택하세요</option>
						<option value="국민">국민</option>
						<option value="농협">농협</option>
						<option value="우리">우리</option>
					</select> <input class="form-control form-control-sm" name="shop_account"
						type="text" placeholder="계좌번호(-없이 입력)" maxlength="20" size="50">
				</div>
			</div>
			<div class="form-inline my-3">
				<input type="submit" class="btn btn-primary btn-sm ml-auto mr-1"
					value="업체등록"> <input type="button"
					class="btn btn-primary btn-sm ml-1 mr-auto"
					onclick="javascript:window.location='owner_shop_management.do'"
					value="돌아가기">
			</div>
		</form>
	</div>
</body>
</html>
