<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta content="IE=edge" http-equiv="X-UA-Compatible"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScipt SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>
<input type="button" value="카카오톡 로그아웃" onclick="ktout()">

<script type="text/javascript">
	///<!{CDATA[
		//사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('64be4085d424e8a310213e7cd6343b92');
		
		//카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container: '#kakao-login-btn',
			success: function(authObj) {
				//로그인 성공시, API를 호출
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						var info = [
								JSON.stringify(res.id),
								JSON.stringify(res.kaccount_email),
								JSON.stringify(res.properties.nickname),
								JSON.stringify(res.properties.profile_image),
								JSON.stringify(res.properties.thumbnail_image)
						];
						alert(res.properties.nickname+'님 환영합니다.'+info);
						
						location.href="./result.do?kakao_id="+res.id;
					},
					fail: function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail: function(err) {
				alert(JSON.stringify(err));
			}
		});
		function ktout() {
			Kakao.Auth.logout(function () {
				setTimeout(function(){
					location.href="http://localhost:8080/Jumoon25/admin_revenueManagement/api.do"
				}, 1000);	//로그아웃 처리되는 타임을 임시적으로 1000설정(1초)
			});
		}
	//]]>
</script>

</body>
</html>