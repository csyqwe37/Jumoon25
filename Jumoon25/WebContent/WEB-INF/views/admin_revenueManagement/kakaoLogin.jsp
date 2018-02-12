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
  // ����� ���� Javascript Ű�� ������ �ּ���.
  Kakao.init('64be4085d424e8a310213e7cd6343b92');
  // īī�� �α��� ��ư�� �����մϴ�.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    size:'large',//�α��ι�ưũ�� small,medium,large/����Ʈ�� medium
    //fall://�α��ν����Ұ��
    //persistAccessToken : false,
    persistRefreshToken : true,
    success: function(authObj) {
      // �α��� ������ API�� ȣ���մϴ�.
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