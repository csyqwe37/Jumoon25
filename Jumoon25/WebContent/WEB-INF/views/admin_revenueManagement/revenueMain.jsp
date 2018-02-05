<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>매출 관리</title>
	<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		$(document).ready(function(){
			Kakao.init('64be4085d424e8a310213e7cd6343b92');
			function getKakaotalkUserProfile() {
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						$("#kakao-profile").append(res.properties.nickname);
						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image, "alt":res.properties.nickname + "님의 프로필 사진"}));
					},
					fail: function(error){
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin() {
				$("#kakao-logged-group .kakao-logout-btn, #kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("<a/>", {"class":"kakao-login-btn","text":"로그인"});
				loginBtn.click(function(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				$("#kakao-logged-group").prepend(loginBtn)
			}
			function createKakaotalkLogout() {
				$("#kakao-logged-group .kakao-logout-btn, #kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>", {"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined && Kakao.Auth.getRefreshToken().replace(/ /gi,"") != ""){
				createKakotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		})
	</script>
</head>
<body>

	<div id="kakao-logged-group"></div> 
	<div id="kakao-profile"></div> 
	
	<span class="badge badge-primary">Primary</span>
	<span class="badge badge-secondary">Secondary</span>
	<span class="badge badge-success">Success</span>
	<span class="badge badge-danger">Danger</span>
	<span class="badge badge-warning">Warning</span>
	<span class="badge badge-info">Info</span>
	<span class="badge badge-light">Light</span>
	<span class="badge badge-dark">Dark</span>
	<br/><br/>
	<div class="progress">
	  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"></div>
	</div>
	<div class="progress">
	  <div class="progress-bar bg-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
	</div>
	<div class="progress">
	  <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
	</div>
	<div class="progress">
	  <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
	</div>
	
	<input type="button" class="btn btn-primary disabled" name="api" value="api" 
	onclick="javascript:window.location='/Jumoon25/admin_revenueManagement/api.do'"/>
	<br/>
	<input type="button" class="btn btn-primary disabled" name="kakao" value="kakao" 
	onclick="javascript:window.location='/Jumoon25/admin_revenueManagement/kakao.do'"/>

</body>
</html>