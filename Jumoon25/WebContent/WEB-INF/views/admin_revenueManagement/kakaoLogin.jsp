<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />  
  <title></title>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<a id="kakao-login-btn"></a>
<script>
  // 사용할 앱의 Javascript 키를 설정해 주세요.
  Kakao.init('64be4085d424e8a310213e7cd6343b92');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    size:'large',//로그인버튼크기 small,medium,large/디폴트는 medium
    //fall://로그인실패할경우
    //persistAccessToken : false,
    persistRefreshToken : true,
    success: function(authObj) {
      // 로그인 성공시 API를 호출합니다.
      Kakao.API.request({
        url: '/v1/user/me',
        success: function(res) {
		  var idNum = res.id;
          var nickname = res.properties.nickname;
          var img_url = res.properties.profile_image;
          
          document.frm.idNum.value=idNum;
          document.frm.nickName.value=nickname;
          document.frm.profile_img.value=img_url;
          document.frm.submit();

        }
      });
      
    }
  });
</script>
<form action="/Jumoon25/admin_revenueManagement/result.do" method="post" name="frm">
<input type="hidden" name="idNum">
<input type="hidden" name="nickName">
<input type="hidden" name="profile_img">
</form>
</body>
</html>