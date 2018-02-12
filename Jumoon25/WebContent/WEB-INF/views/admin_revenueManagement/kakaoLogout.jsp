<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	session.invalidate();
%>
<script>
Kakao.init('64be4085d424e8a310213e7cd6343b92');
Kakao.Auth.logout(function(data){
    if(data){//정상적으로 로그아웃이 되면 true를 반환
       location.href="revenueMain.do";
    }
});
</script>
</head>
<body>
</body>
</html>
